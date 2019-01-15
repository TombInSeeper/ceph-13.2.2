#include "objssd-nvme.h"

#define TRANSFER_UNIT_SIZE 4096
#define PROG_GRANULARITY 4

#define PLANE_SUPERBLOCK 1

nvme_obj  *OBJ_TABLE;
unsigned char *obj_bitmap;
unsigned int obj_bitmap_len;
int object_count;
uint8_t **BBT;
void print_nvm_geo(const struct nvm_geo *geo)
{
    printf("channel:%llu\n", geo->nchannels);
    printf("lun:%llu\n", geo->nluns);
    printf("plane:%llu\n", geo->nplanes);
    printf("block:%llu\n", geo->nblocks);
    printf("page:%llu\n", geo->npages);
    printf("sector:%llu\n", geo->nsectors);
}
void print_oc_addr(struct nvm_addr *addr)
{
    printf("channel:%llu ", addr->g.ch);
    printf("lun:%llu ", addr->g.lun);
    printf("plane:%llu ", addr->g.pl);
    printf("block:%llu ", addr->g.blk);
    printf("page:%llu ", addr->g.pg);
    printf("sector:%llu\n", addr->g.sec);
}
int find_next_zero_bit(unsigned char *bitmap)
{
    int i;
    for(i = 0; i < object_count; i++){
        if(bitmap[i] == 0)
            return i;
    }
    return -1;
}

int obj_addr_to_oc_addr(struct nvm_dev* dev, struct nvm_addr *addr, int obj_id, uint64_t obj_offset)
{
    const struct nvm_geo *geo = nvm_dev_get_geo(dev);
    int block_index = obj_id;
    int block_size = geo->npages * geo->nsectors;
    int block_num = OBJ_TABLE[obj_id].obj_size / block_size;
    int transfer_floor_unit_count = block_num * PROG_GRANULARITY;
    int transfer_floor_index = obj_offset / transfer_floor_unit_count;
    int transfer_floor_offset = obj_offset % transfer_floor_unit_count;   
    int plane_count = transfer_floor_offset / PROG_GRANULARITY;
    int plane_offset = transfer_floor_offset % PROG_GRANULARITY;
    int i, channel_index = 0, lun_index = 0, plane_index = 0;
    i = 0;
    while(i < plane_count){
        plane_index++;
        if(plane_index == geo->nplanes){
            plane_index = 0;
            lun_index++;
            if(lun_index == geo->nluns){
                lun_index = 0;
                channel_index++;
            }
        }
        if(BBT[channel_index * geo->nluns * geo->nplanes + lun_index * geo->nplanes + plane_index][obj_id] == 0)
            i++;
    }
    int sector_sum_count = transfer_floor_index * PROG_GRANULARITY + plane_offset;
    int page_index = sector_sum_count / geo->nsectors;
    int sector_index = sector_sum_count % geo->nsectors;
    addr->g.ch = channel_index;
    addr->g.lun =  lun_index;
    addr->g.pl = plane_index;
    addr->g.blk = block_index;
    addr->g.pg = page_index;
    addr->g.sec = sector_index;
    return 0;
}

int oc_addr_to_obj_addr(struct nvm_dev* dev, struct nvm_addr *oc_addr, int *obj_id, uint64_t *obj_offset)
{
    const struct nvm_geo *geo = nvm_dev_get_geo(dev);
    *obj_id = oc_addr->g.blk;

    int channel_index = oc_addr->g.ch;
    int lun_index = oc_addr->g.lun;
    int plane_index = oc_addr->g.pl;
    int page_index = oc_addr->g.pg;
    int sector_index = oc_addr->g.sec;
    int transfer_floor_index = (page_index * geo->nsectors + sector_index) / PROG_GRANULARITY;
    (*obj_offset) = geo->nchannels * geo->nluns * geo->nplanes * transfer_floor_index * PROG_GRANULARITY + channel_index *geo->nluns * geo->nplanes * PROG_GRANULARITY + lun_index * geo->nplanes * PROG_GRANULARITY + plane_index * PROG_GRANULARITY + sector_index;
    return 0;
}


int __obj_write(struct nvm_dev *dev, char *data, int obj_id, uint64_t obj_offset)
{
    struct nvm_addr *oc_addr = (struct nvm_addr *)malloc(sizeof(struct nvm_addr));
    obj_addr_to_oc_addr(dev, oc_addr, obj_id, obj_offset);
    //print_oc_addr(oc_addr);
    int ret = nvm_addr_write(dev, oc_addr, 1, data, NULL, 0x0, NULL);
    if(ret != 0){
        printf("write failed!\n");
        free(oc_addr);
        return -1;
    }
    free(oc_addr);
    return 0;
}
int __obj_read(struct nvm_dev *dev, char *data, int obj_id, uint64_t obj_offset)
{
    struct nvm_addr *oc_addr = (struct nvm_addr *)malloc(sizeof(struct nvm_addr));
    obj_addr_to_oc_addr(dev, oc_addr, obj_id, obj_offset);
    //print_oc_addr(oc_addr);
    int ret = nvm_addr_read(dev, oc_addr, 1, data, NULL, 0x0, NULL);
    if(ret < 0){
        free(oc_addr);
        printf("read failed\n");
        return -1;
    }
    free(oc_addr);
    return 0;
}
int obj_write(struct nvm_dev* dev, io_u *io)
{
    int obj_id = io->obj_id;
    int obj_offset = io->obj_off;
    int data_transfer_size = io->data_size;
    char *data_buffer_pointer = io->data;
    int i;
    //clock_t start, finish;
    //double duration;
    //start = clock();
    for(i = 0; i < data_transfer_size; i++){
        //printf("write :%d\n", i);
        __obj_write(dev, data_buffer_pointer + i * 4096, obj_id, obj_offset + i);
    }
    //finish = clock();
    //duration = (double)(finish - start) / (CLOCKS_PER_SEC);
    //printf("duration time:%lf\n", duration);
    return 0;
}
int obj_read(struct nvm_dev *dev, io_u *io)
{
    int obj_id = io->obj_id;
    int obj_offset = io->obj_off;
    int data_transfer_size = io->data_size;
    char *data_buffer_pointer = io->data;
    int i;
    for(i = 0; i < data_transfer_size; i++){
        //printf("read :%d\n", i);
        __obj_read(dev, data_buffer_pointer + i * 4096, obj_id, obj_offset + i);
    }
    return 0;
}
int __obj_erase(struct nvm_dev *dev, unsigned int obj_id)
{
    /*const struct nvm_geo *geo = nvm_dev_get_geo(dev);
    struct nvm_addr *oc_addr = (struct nvm_addr *)malloc(sizeof(struct nvm_addr));
    int channel_index, lun_index, plane_index, ret;
    for(channel_index = 0; channel_index < geo->nchannels; channel_index++){
        for(lun_index = 0; lun_index < geo->nluns; lun_index++){
            for(plane_index = 0; plane_index < geo->nplanes; plane_index++){
                memset(oc_addr, 0, sizeof(struct nvm_addr));
                oc_addr->g.ch = channel_index;
                oc_addr->g.lun = lun_index;
                oc_addr->g.pl = plane_index;
                oc_addr->g.blk = obj_id;
                ret = nvm_addr_erase(dev, oc_addr, 1, 0x1, NULL);
                if(ret != 0){
                    printf("delete failed!\n");
                    free(oc_addr);
                    return -1;
                }
            }
        }
    }
    free(oc_addr);
    return 0;*/
    struct nvm_addr addr = {.ppa=0};
    struct nvm_ret ret;
    addr.g.ch = 0;
    addr.g.lun = 0;
    addr.g.blk = obj_id;
    addr.g.pl = 0;

    nvm_addr_erase_sb(dev, &addr, 1, 0, &ret);
    if (ret.status != 0 || ret.result != 0) {
        struct nvm_log_page log;
        nvm_get_mef_log(dev, &log);
        for (uint32_t i = 0; i < log.nppas; ++i) {
            struct nvm_addr bad = nvm_addr_dev2gen(dev, log.ppas[i]);
            nvm_bbt_mark(dev, &bad, 1, NVM_BBT_BAD, NULL);
        }
    }
    return 0;
}
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
    __obj_erase(dev, *obj_id);
    return 0;
}

int obj_delete(struct nvm_dev *dev, unsigned int obj_id)
{
    const struct nvm_geo *geo = nvm_dev_get_geo(dev);
    unsigned int block_id = obj_id;
    struct nvm_addr *oc_addr = (struct nvm_addr *)malloc(sizeof(struct nvm_addr));
    __obj_erase(dev, obj_id);
    OBJ_TABLE[obj_id].created &= 0x0;
    OBJ_TABLE[obj_id].obj_offset = 0;
    //obj_bitmap[obj_id] = 0; 
    free(oc_addr);
    return 0;
}

void init_BBT(struct nvm_dev *dev)
{
    int i, j, k;
    const struct nvm_geo *geo = nvm_dev_get_geo(dev);
    BBT = (uint8_t **)malloc(sizeof(uint8_t *) * geo->nchannels * geo->nluns * geo->nplanes);
    for(i = 0; i < geo->nchannels * geo->nluns * geo->nplanes; i++){
        BBT[i] = (uint8_t *)malloc(sizeof(uint8_t) * geo->nblocks);
    }
    struct nvm_addr *oc_addr = (struct nvm_addr *)malloc(sizeof(struct nvm_addr));
    int channel_index, lun_index, plane_index, ret;
    for(channel_index = 0; channel_index < geo->nchannels; channel_index++){
        for(lun_index = 0; lun_index < geo->nluns; lun_index++){
            memset(oc_addr, 0, sizeof(struct nvm_addr));
            oc_addr->g.ch = channel_index;
            oc_addr->g.lun = lun_index;
            const struct nvm_bbt *bbt;
            bbt = nvm_bbt_get(dev, *oc_addr, NULL);
            int base_index = channel_index * geo->nluns * geo->nplanes + lun_index * geo->nplanes;
            for(j = 0; j < geo->nblocks; j++){
                BBT[base_index][j] = bbt->blks[2 * j];
                BBT[base_index + 1][j] = bbt->blks[2 * j + 1];
            }
        }
    }
    free(oc_addr);
}

int cal_min_object_block_num(struct nvm_dev* dev)
{ 
    const struct nvm_geo *geo = nvm_dev_get_geo(dev);
    int object_block_num = geo->nchannels * geo->nluns *geo->nplanes;
    int min_object_block_num = object_block_num;
    int i, j, temp_num;
    for(i = 30; i < geo->nblocks - 10; i++){
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

struct nvm_dev* dev_open(const char * dev_path)
{
    struct nvm_dev *dev;
    int i, j;
    dev = nvm_dev_open(dev_path);

    const struct nvm_geo *geo = nvm_dev_get_geo(dev);
    object_count = geo->nblocks - 40;
    init_BBT(dev);
    int min_object_block_num = cal_min_object_block_num(dev);
    int object_block_num = geo->nchannels * geo->nluns *geo->nplanes;
    printf("min_object_block_num:%d\n", min_object_block_num);
    int obj_count = geo->nblocks;
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
    obj_bitmap = (unsigned char *)malloc(sizeof(unsigned char) * obj_count);
    for(i = 0; i < 30; i++)
        obj_bitmap[i] = 1;
    for(i = 30; i < obj_count; i++)
        obj_bitmap[i] = 0;
    int find_id = find_next_zero_bit(obj_bitmap);
    printf("debug in open:%d\n", find_id);
    return dev;
}
int dev_close(struct nvm_dev *dev)
{
    free(obj_bitmap);
    free(OBJ_TABLE);
    free(BBT);
    nvm_dev_close(dev);
    return 0;
}
void update_bbt(struct nvm_dev *dev)
{
    uint32_t channel, lun, blk;
    const struct nvm_geo *geo = nvm_dev_get_geo(dev);
    for(channel = 0; channel < geo->nchannels; channel++){
        for(lun = 0; lun < geo->nluns; lun++){
			for ( blk = 10; blk < geo->nblocks; blk++) {
				struct nvm_addr addr = {.ppa=0};
				struct nvm_ret ret;
				addr.g.ch = channel;
				addr.g.lun = lun;
				addr.g.blk = blk;
				addr.g.pl = 0;

				const struct nvm_bbt *bbt = nvm_bbt_get(dev, addr, NULL);
				if (bbt->blks[blk*2] != NVM_BBT_FREE || bbt->blks[blk*2+1] != NVM_BBT_FREE) {
				    printf("ignore ch=%d lun=%d blk=%d bbt=%d-%d\n",
				              channel, lun, blk, bbt->blks[blk*2], bbt->blks[blk*2+1]);
				    continue;
				}
				nvm_addr_erase(dev, &addr, 1, 0, &ret);
				if (ret.status != 0 || ret.result != 0) {
				    printf("mark bbt ch=%d lun=%d blk=%d \n", channel, lun, blk);
                    addr.g.pl = 0;
    				nvm_bbt_mark(dev, &addr, 1, NVM_BBT_BAD, NULL);
    				addr.g.pl = 1;
    				nvm_bbt_mark(dev, &addr, 1, NVM_BBT_BAD, NULL);
				}
			}
        }
    }
}
