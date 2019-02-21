#include "objssd-nvme.h"
#include "queue.h"
#include "objssd-thread.h"
#include "objssd-bbt.h"

#define TRANSFER_UNIT_SIZE 4096

nvme_obj  *OBJ_TABLE;
pthread_mutex_t OBJ_TABLE_LOCK;
unsigned char *obj_bitmap;
unsigned int obj_bitmap_len;
int object_count;
extern uint8_t **BBT;
uint8_t **queue_complete_bit;
Queue **queue_table;

#define THREAD_NUM 4
pthread_t *thread;
int *thread_id;

/**
 * find the next bit which equals zero
 */
int find_next_zero_bit(unsigned char *bitmap)
{
    int i;
    for(i = 0; i < object_count; i++){
        if(bitmap[i] == 0)
            return i;
    }
    return -1;
}

/**
 * erase an object which is also a superblock
 */
int __obj_erase(struct nvm_dev *dev, unsigned int obj_id)
{
    struct nvm_addr addr = {.ppa=0};
    struct nvm_ret ret;
    uint32_t i;
    addr.g.ch = 0;
    addr.g.lun = 0;
    addr.g.blk = obj_id;
    addr.g.pl = 0;
    nvm_addr_erase_sb(dev, &addr, 1, 0, &ret);
    // If erasing fails, mark bad block
    if (ret.status != 0 || ret.result != 0) {
        struct nvm_log_page log;
        nvm_get_mef_log(dev, &log);
        for (i = 0; i < log.nppas; ++i) {
            struct nvm_addr bad = nvm_addr_dev2gen(dev, log.ppas[i]);
            nvm_bbt_mark(dev, &bad, 1, NVM_BBT_BAD, NULL);
        }
    }
    return 0;
}

/**
 * create an object
 * @param dev device pointer
 * @param obj_id object id pointer
 * @param obj_4k_size object pointer(4k base)
 * @retval -1  fails
 * @retval 0 success
 */
int obj_create(struct nvm_dev *dev, unsigned int *obj_id, unsigned int *obj_4k_size)
{
    int find_id = find_next_zero_bit(obj_bitmap);
    if(find_id == -1){
        printf("create failed!\n");
        return -1;
    }
    (*obj_id) = find_id;
    (*obj_4k_size) = OBJ_TABLE[find_id].obj_size;
    OBJ_TABLE[find_id].created |= 0x1;
    OBJ_TABLE[find_id].obj_offset = 0;
    obj_bitmap[find_id] = 1;
    //erase it?(unnecessary?)
    __obj_erase(dev, *obj_id);
    return 0;
}


/**
 * delete an object
 * @param dev device pointer
 * @param obj_id id of object to delete
 * @retval 0 success
 */
int obj_delete(struct nvm_dev *dev, unsigned int obj_id)
{
    struct nvm_addr *oc_addr = (struct nvm_addr *)malloc(sizeof(struct nvm_addr));
    __obj_erase(dev, obj_id);
    OBJ_TABLE[obj_id].created &= 0x0;
    OBJ_TABLE[obj_id].obj_offset = 0;
    // this should not be noted
    //obj_bitmap[obj_id] = 0;
    free(oc_addr);
    return 0;
}

/**
 * calculate the minimum objects according to bad blocks
 */
int cal_min_object_block_num(struct nvm_dev* dev)
{
    int q;
    const struct nvm_geo *geo = nvm_dev_get_geo(dev);
    unsigned int object_block_num = geo->nchannels * geo->nluns *geo->nplanes;
    unsigned int min_object_block_num = object_block_num;
    unsigned int i, j, temp_num;
    //begin from superblock 10, because superblocks below 30 have many bad blocks
    for(i = 30; i < geo->nblocks - 20; i++){
        temp_num = object_block_num;
        for(j = 0; j < object_block_num; j++){
            if(BBT[j][i] != 0){
                temp_num --;
            }
        }
        if(temp_num < min_object_block_num)
            min_object_block_num = temp_num;
    }
    return min_object_block_num;
}

/**
 * create queues for every lun
 */
int create_queue_for_every_lun(unsigned int nluns)
{
    unsigned int i;
    queue_table = (Queue **)malloc(sizeof(Queue *) * nluns);
    for(i = 0; i < nluns; i++){
        queue_table[i] = CreateQueue();
        if(queue_table[i] == NULL)  {return -1;}
    }
    return 0;
}

/**
 * open a device and do some preparation
 * @param dev_path device path
 * @retval struct nvm_dev   device handle
 */
struct nvm_dev* dev_open(const char * dev_path)
{
    struct nvm_dev *dev;
    int i, j;
    //recall nvm_dev_open function and get the handle
    dev = nvm_dev_open(dev_path);
    const struct nvm_geo *geo = nvm_dev_get_geo(dev);
    printf("nchannels:%d\tnluns:%d\tnplanes:%d\n", geo->nchannels, geo->nluns, geo->nplanes);
    object_count = geo->nblocks - 40;
    //init the bad block table
    init_BBT(dev);
    //calculate the minimum blocks of object according to bbt
    int min_object_block_num = cal_min_object_block_num(dev);
    int object_block_num = geo->nchannels * geo->nluns *geo->nplanes;
    printf("min_object_block_num:%d\n", min_object_block_num);
    int obj_count = geo->nblocks;
    //malloc OBJ_TABLE and init the OBJ_TABLE
    OBJ_TABLE = (nvme_obj *)malloc(sizeof(nvme_obj) * obj_count);
    for(i = 0; i < obj_count; i++){
        OBJ_TABLE[i].created &= 0x0;
        OBJ_TABLE[i].obj_id = i;
        OBJ_TABLE[i].obj_size = min_object_block_num * geo->npages * geo->nsectors;
        OBJ_TABLE[i].obj_offset = 0;
        OBJ_TABLE[i].block_bitmap = (unsigned int *)malloc(sizeof(unsigned int) * object_block_num);
        for(j = 0; j < object_block_num; j++){
            OBJ_TABLE[i].block_bitmap[j] = BBT[j][i];
        }
    }
    //malloc obj_bitmap and init it
    obj_bitmap = (unsigned char *)malloc(sizeof(unsigned char) * obj_count);
    for(i = 0; i < 30; i++)
        obj_bitmap[i] = 1;
    for(i = 30; i < obj_count; i++)
        obj_bitmap[i] = 0;
    //create queues for every lun
    int luns_num = geo->nchannels * geo->nluns;
    create_queue_for_every_lun(luns_num);
    //create queue complete bit pointer for every queue
    queue_complete_bit = (uint8_t **)malloc(sizeof(uint8_t *) * luns_num);
    for(i = 0; i < luns_num; i++){
        queue_complete_bit[i] = (uint8_t *)malloc(sizeof(uint8_t) * 64);
        for(j = 0; j < 64; j++){
            queue_complete_bit[i][j] = 0;
        }
    }
    //create threads for each lun
    thread = (pthread_t *)malloc(sizeof(pthread_t) * THREAD_NUM);
    thread_id = (int *)malloc(sizeof(int) * THREAD_NUM);
    for(i = 0; i < 4; i++){
        int *thread_index = (int *)malloc(sizeof(int));
        (*thread_index) = i;
        thread_id[i] = pthread_create(&(thread[i]), NULL, (void *)&process_request, thread_index);
        if(thread_id[i])  {printf("create failed!!!\n"); return NULL;};
    }
    return dev;
}
/**
 * close the device and free resources
 */
int dev_close(struct nvm_dev *dev)
{
    free(obj_bitmap);
    free(OBJ_TABLE);
    free(BBT);
    nvm_dev_close(dev);
    return 0;
}

/**
 * set one object unused
 */
int mark_created(unsigned int obj_id){
    
    printf("%s:%u by up level\n",__func__,obj_id);
    obj_bitmap[obj_id] = 1;
    return 0;
}
