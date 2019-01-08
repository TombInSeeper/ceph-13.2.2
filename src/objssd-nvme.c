#include "objssd-nvme.h"

#define TRANSFER_UNIT_NUM 1
#define TRANSFER_DATA_LAYOUT_UNIT_NUM 24
#define TRANSFER_UNIT_SIZE 4096

#define PLANE_SUPERBLOCK 1
#define LUN_SUPERBLOCK 0

nvme_obj  *OBJ_TABLE;
unsigned char *obj_bitmap;
unsigned int obj_bitmap_len;
int object_count;
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
    printf("channel:%llu\n", addr->g.ch);
    printf("lun:%llu\n", addr->g.lun);
    printf("plane:%llu\n", addr->g.pl);
    printf("block:%llu\n", addr->g.blk);
    printf("page:%llu\n", addr->g.pg);
    printf("sector:%llu\n", addr->g.sec);
}
//寻找第一个为0的位置，与内核函数冲突吗？？
int find_next_zero_bit(unsigned char *bitmap)
{
    int i;
    for(i = 0; i < object_count; i++){
        if(bitmap[i] == 0)
            return i;
    }
}

struct nvm_addr obj_addr_to_oc_addr(struct nvm_dev* dev, int obj_id, uint64_t obj_offset)
{
    if(LUN_SUPERBLOCK){
        const struct nvm_geo *geo = nvm_dev_get_geo(dev);
        int plane_obj_count = geo->nblocks;
        int plane_id = obj_id / plane_obj_count;
        int plane_offset = obj_id - plane_id * plane_obj_count;
        int block_id = plane_offset;
    
    //在每个channel每个lun中每个block取96k作为一层
        int transfer_floor_unit_count = geo->nchannels * geo->nluns * TRANSFER_DATA_LAYOUT_UNIT_NUM;
        int transfer_floor = obj_offset / transfer_floor_unit_count;
        int transfer_floor_offset = obj_offset - transfer_floor * transfer_floor_unit_count;
    
        int channel_transfer_unit_count = geo->nluns * TRANSFER_DATA_LAYOUT_UNIT_NUM;
        int channel_id = transfer_floor_offset / channel_transfer_unit_count;
        int channel_offset = transfer_floor_offset - channel_id * channel_transfer_unit_count;
        int lun_id = channel_offset / TRANSFER_DATA_LAYOUT_UNIT_NUM;
        int lun_offset = channel_offset - lun_id * TRANSFER_DATA_LAYOUT_UNIT_NUM;
    
        int page_id = transfer_floor * (TRANSFER_DATA_LAYOUT_UNIT_NUM / geo->nsectors) + lun_offset / geo->nsectors;
        int sector_id = lun_offset % geo->nsectors;
        struct nvm_addr oc_addr;
        memset(&oc_addr, 0, sizeof(struct nvm_addr));
        oc_addr.g.ch = channel_id;
        oc_addr.g.lun = lun_id;
        oc_addr.g.pl = plane_id;
        oc_addr.g.blk = block_id;
        oc_addr.g.pg = page_id;
        oc_addr.g.sec = sector_id;
        return oc_addr;
    }
    if(PLANE_SUPERBLOCK){
        const struct nvm_geo *geo = nvm_dev_get_geo(dev);
        int block_id = obj_id;
    
        int transfer_floor_unit_count = geo->nchannels * geo->nluns * geo->nplanes * TRANSFER_DATA_LAYOUT_UNIT_NUM;
        int transfer_floor = obj_offset / transfer_floor_unit_count;
        int transfer_floor_offset = obj_offset - transfer_floor * transfer_floor_unit_count;
        int plane_unit_count_one_floor = geo->nchannels * geo->nluns * TRANSFER_DATA_LAYOUT_UNIT_NUM;
        int plane_id = transfer_floor_offset / plane_unit_count_one_floor;
        int plane_unit_floor_offset = transfer_floor_offset - plane_id * plane_unit_count_one_floor;
        int channel_id = plane_unit_floor_offset / (geo->nluns * TRANSFER_DATA_LAYOUT_UNIT_NUM);
        int channel_offset = plane_unit_floor_offset - channel_id * (geo->nluns * TRANSFER_DATA_LAYOUT_UNIT_NUM);
        int lun_id = channel_offset / TRANSFER_DATA_LAYOUT_UNIT_NUM;
        int lun_offset = channel_offset - lun_id * TRANSFER_DATA_LAYOUT_UNIT_NUM;
        int page_id = transfer_floor * (TRANSFER_DATA_LAYOUT_UNIT_NUM / geo->nsectors) + lun_offset / geo->nsectors;
        int sector_id = lun_offset % geo->nsectors;
        struct nvm_addr oc_addr;
        memset(&oc_addr, 0, sizeof(struct nvm_addr));
        oc_addr.g.ch = channel_id;
        oc_addr.g.lun = lun_id;
        oc_addr.g.pl = plane_id;
        oc_addr.g.blk = block_id;
        oc_addr.g.pg = page_id;
        oc_addr.g.sec = sector_id;
        //printf("222obj_id:%d\t obj_offset:%llu\n", obj_id, obj_offset);
        //print_oc_addr(&oc_addr);
        return oc_addr;
    }
    

}

int oc_addr_to_obj_addr(struct nvm_dev* dev, struct nvm_addr oc_addr, int *obj_id, uint64_t *obj_offset)
{
    if(LUN_SUPERBLOCK){
        const struct nvm_geo *geo = nvm_dev_get_geo(dev);
        int plane_id = oc_addr.g.pl;
        int block_id = oc_addr.g.blk;
        *obj_id = plane_id * geo->nblocks + block_id;
    
        int page_id = oc_addr.g.pg;
        int sector_id = oc_addr.g.sec;
        int block_offset = page_id * geo->nsectors + sector_id;
        int transfer_floor = block_offset / TRANSFER_DATA_LAYOUT_UNIT_NUM;
        int transfer_floor_block_offset = block_offset - transfer_floor * TRANSFER_DATA_LAYOUT_UNIT_NUM;
    
        int channel_id = oc_addr.g.ch;
        int lun_id = oc_addr.g.lun;
        *obj_offset = geo->nchannels * geo->nluns * TRANSFER_DATA_LAYOUT_UNIT_NUM * transfer_floor + channel_id * geo->nluns * TRANSFER_DATA_LAYOUT_UNIT_NUM + +lun_id * TRANSFER_DATA_LAYOUT_UNIT_NUM + transfer_floor_block_offset;
    }
    
    if(PLANE_SUPERBLOCK){
        const struct nvm_geo *geo = nvm_dev_get_geo(dev);
        *obj_id = oc_addr.g.blk;
    
        int channel_id = oc_addr.g.ch;
        int lun_id = oc_addr.g.lun;
        int plane_id = oc_addr.g.pl;
        int page_id = oc_addr.g.pg;
        int sector_id = oc_addr.g.sec;
        int block_offset = page_id * geo->nsectors + sector_id;
        int transfer_floor = block_offset / TRANSFER_DATA_LAYOUT_UNIT_NUM;
        int transfer_floor_block_offset = block_offset - transfer_floor * TRANSFER_DATA_LAYOUT_UNIT_NUM;
    
        *obj_offset = geo->nchannels * geo->nluns * geo->nplanes * transfer_floor * TRANSFER_DATA_LAYOUT_UNIT_NUM + geo->nchannels * geo->nluns * plane_id * TRANSFER_DATA_LAYOUT_UNIT_NUM + channel_id * geo->nluns * TRANSFER_DATA_LAYOUT_UNIT_NUM + lun_id * TRANSFER_DATA_LAYOUT_UNIT_NUM + transfer_floor_block_offset;
    }
    return 0;
}


int __obj_write(struct nvm_dev *dev, char *data, int obj_id, uint64_t obj_offset, int data_size)
{
    int naddrs = data_size;
    printf("write data size:%d\n", data_size);
    struct nvm_addr *oc_addr = (struct nvm_addr *)malloc(naddrs * sizeof(struct nvm_addr));
    int i;
    for(i = 0; i < naddrs; i++){
        oc_addr[i] = obj_addr_to_oc_addr(dev,obj_id, obj_offset + i);
        printf("obj_id:%d\tobj_offset:%llu\twrite:%d\n", obj_id, obj_offset + i, i);
        print_oc_addr(&(oc_addr[i]));
    }
    int ret = nvm_addr_write(dev, oc_addr, naddrs, data, NULL, 0x1, NULL);
    if(ret < 0){
        printf("write failed!\n");
        free(oc_addr);
        return -1;
    }
    free(oc_addr);
    return 0;
}
int __obj_read(struct nvm_dev *dev, char *data, int obj_id, uint64_t obj_offset, int data_size)
{
    int naddrs = data_size;
    printf("read data size:%d\n", data_size);
    struct nvm_addr *oc_addr = (struct nvm_addr *)malloc(naddrs * sizeof(struct nvm_addr));
    int i;
    for(i = 0; i < naddrs; i++){
        oc_addr[i] = obj_addr_to_oc_addr(dev, obj_id, obj_offset + i);
        printf("obj_id:%d\tobj_offset:%llu\tread:%d\n", obj_id, obj_offset + i, i);
        print_oc_addr(&(oc_addr[i]));
    }
    int ret = nvm_addr_read(dev, oc_addr, naddrs, data, NULL, 0x1, NULL);
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
    int naddrs;
    if(obj_offset % TRANSFER_UNIT_NUM == 0){
        char *data_buf_pointer = io->data;
        int data_transfer_size = io->data_size;
        int obj_transfer_offset = io->obj_off;
        while(data_transfer_size >= TRANSFER_UNIT_NUM){
             printf("1 transfer_size:%d\n", data_transfer_size);
            __obj_write(dev, data_buf_pointer, obj_id, obj_transfer_offset, TRANSFER_UNIT_NUM);
            data_buf_pointer += TRANSFER_UNIT_SIZE * TRANSFER_UNIT_NUM;
            data_transfer_size -= TRANSFER_UNIT_NUM;
            obj_transfer_offset += TRANSFER_UNIT_NUM;
            OBJ_TABLE[obj_id].obj_offset = obj_transfer_offset;
            printf("2 transfer_size:%d\n", data_transfer_size);
        }
        if(data_transfer_size > 0){
            __obj_write(dev, data_buf_pointer, obj_id, obj_transfer_offset, data_transfer_size);
            OBJ_TABLE[obj_id].obj_offset += data_transfer_size;
        }
    }
    else{
        char *data_buf_pointer = io->data;
        int data_transfer_size = io->data_size;
        int obj_transfer_offset = io->obj_off;
        int first_transfer_size = TRANSFER_UNIT_NUM - obj_offset % TRANSFER_UNIT_NUM;
        __obj_write(dev, data_buf_pointer, obj_id, obj_transfer_offset, first_transfer_size);
        data_buf_pointer += first_transfer_size * TRANSFER_UNIT_SIZE;
        data_transfer_size -= first_transfer_size;
        obj_transfer_offset += first_transfer_size;
        OBJ_TABLE[obj_id].obj_offset = obj_transfer_offset;
        while(data_transfer_size >= TRANSFER_UNIT_NUM){
            __obj_write(dev, data_buf_pointer, obj_id, obj_transfer_offset, TRANSFER_UNIT_NUM);
            data_buf_pointer += TRANSFER_UNIT_SIZE * TRANSFER_UNIT_NUM;
            data_transfer_size -= TRANSFER_UNIT_NUM;
            obj_transfer_offset += TRANSFER_UNIT_NUM;
            OBJ_TABLE[obj_id].obj_offset = obj_transfer_offset;
        }
        if(data_transfer_size > 0){
            __obj_write(dev, data_buf_pointer, obj_id, obj_transfer_offset, data_transfer_size);
            OBJ_TABLE[obj_id].obj_offset += data_transfer_size;
        }
    }
    return 0;
}
int obj_read(struct nvm_dev *dev, io_u *io)
{
    int obj_id = io->obj_id;
    int obj_offset = io->obj_off;
    if(obj_offset % TRANSFER_UNIT_NUM == 0){
        char *data_buf_pointer = io->data;
        int data_transfer_size = io->data_size;
        int obj_transfer_offset = io->obj_off;
        while(data_transfer_size >= TRANSFER_UNIT_NUM){
            printf("1 transfer_size:%d\n", data_transfer_size);
            __obj_read(dev, data_buf_pointer, obj_id, obj_transfer_offset, TRANSFER_UNIT_NUM);
            data_buf_pointer += TRANSFER_UNIT_SIZE * TRANSFER_UNIT_NUM;
            data_transfer_size -= TRANSFER_UNIT_NUM;
            obj_transfer_offset += TRANSFER_UNIT_NUM;
            printf("2 transfer_size:%d\n", data_transfer_size);
        }
        if(data_transfer_size > 0){
            __obj_read(dev, data_buf_pointer, obj_id, obj_transfer_offset, data_transfer_size);
        }
    }
    else{
        char *data_buf_pointer = io->data;
        int data_transfer_size = io->data_size;
        int obj_transfer_offset = io->obj_off;
        int first_transfer_size = TRANSFER_UNIT_NUM - obj_offset % TRANSFER_UNIT_NUM;
        __obj_read(dev, data_buf_pointer, obj_id, obj_transfer_offset, first_transfer_size);
        data_buf_pointer += first_transfer_size * TRANSFER_UNIT_SIZE;
        data_transfer_size -= first_transfer_size;
        obj_transfer_offset += first_transfer_size;
        OBJ_TABLE[obj_id].obj_offset = obj_transfer_offset;
        while(data_transfer_size >= TRANSFER_UNIT_NUM){
            __obj_read(dev, data_buf_pointer, obj_id, obj_transfer_offset, TRANSFER_UNIT_NUM);
            data_buf_pointer += TRANSFER_UNIT_SIZE * TRANSFER_UNIT_NUM;
            data_transfer_size -= TRANSFER_UNIT_NUM;
            obj_transfer_offset += TRANSFER_UNIT_NUM;
        }
        if(data_transfer_size > 0){
            __obj_write(dev, data_buf_pointer, obj_id, obj_transfer_offset, data_transfer_size);
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
    return 0;
}

int obj_delete(struct nvm_dev *dev, unsigned int obj_id)
{
    if(LUN_SUPERBLOCK){
        const struct nvm_geo *geo = nvm_dev_get_geo(dev);
        int plane_obj_count = geo->nblocks;
        int plane_id = obj_id / plane_obj_count;
        int plane_offset = obj_id - plane_id * plane_obj_count;
        int block_id = plane_offset;
        struct nvm_addr *oc_addr = (struct nvm_addr *)malloc(sizeof(struct nvm_addr));
        int channel_index, lun_index, ret;
        for(channel_index = 0; channel_index < geo->nchannels; channel_index++){
            for(lun_index = 0; lun_index < geo->nluns; lun_index++){
                memset(oc_addr, 0, sizeof(struct nvm_addr));
                oc_addr->g.ch = channel_index;
                oc_addr->g.lun = lun_index;
                oc_addr->g.pl = plane_id;
                oc_addr->g.blk = block_id;
                ret = nvm_addr_erase(dev, oc_addr, 1, 0x1, NULL);
                if(ret != 0){
                    printf("delete failed!\n");
                    return -1;
                }
            }
        }
        OBJ_TABLE[obj_id].created &= 0x0;
        OBJ_TABLE[obj_id].obj_offset = 0;
        obj_bitmap[obj_id] = 0;
        return 0;
    }

    if(PLANE_SUPERBLOCK){
        const struct nvm_geo *geo = nvm_dev_get_geo(dev);
        int block_id = obj_id;
        struct nvm_addr *oc_addr = (struct nvm_addr *)malloc(sizeof(struct nvm_addr));
        int channel_index, lun_index, plane_index, ret;
        for(channel_index = 0; channel_index < geo->nchannels; channel_index++){
            for(lun_index = 0; lun_index < geo->nluns; lun_index++){
                for(plane_index = 0; plane_index < geo->nplanes; plane_index++){
                    memset(oc_addr, 0, sizeof(struct nvm_addr));
                    oc_addr->g.ch = channel_index;
                    oc_addr->g.lun = lun_index;
                    oc_addr->g.pl = plane_index;
                    oc_addr->g.blk = block_id;
                    ret = nvm_addr_erase(dev, oc_addr, 1, 0x1, NULL);
                    if(ret != 0){
                        printf("delete failed!\n");
                        return -1;
                    }
                }
            }
        }
        OBJ_TABLE[obj_id].created &= 0x0;
        OBJ_TABLE[obj_id].obj_offset = 0;
        obj_bitmap[obj_id] = 0;
        return 0;
    }
}


struct nvm_dev* dev_open(const char * dev_path)
{
    if(LUN_SUPERBLOCK){
        struct nvm_dev *dev;
        dev = nvm_dev_open(dev_path);
    
        const struct nvm_geo *geo = nvm_dev_get_geo(dev);
        int obj_count = geo->nplanes * (geo->nblocks);
        object_count = obj_count;
        int obj_size = geo->nchannels * geo->nluns * geo->npages * geo->nsectors;
        OBJ_TABLE = (nvme_obj *)malloc(sizeof(nvme_obj) * obj_count);
        int i;
        //后续设计：读文件进行初始化
        for(i = 0; i < obj_count; i++){
            OBJ_TABLE[i].created &= 0x0;
            OBJ_TABLE[i].obj_id = i;
            OBJ_TABLE[i].obj_size =obj_size;
            OBJ_TABLE[i].obj_offset = 0;
        }
        obj_bitmap = (unsigned char *)malloc(sizeof(unsigned char) * obj_count);
        for(i = 0; i < obj_count; i++)
            obj_bitmap[i] = 0;
        for(i = 10; i < obj_count; i++)
            obj_bitmap[i] = 0;
        return dev;
    }
    if(PLANE_SUPERBLOCK){
        struct nvm_dev *dev;
        dev = nvm_dev_open(dev_path);
    
        const struct nvm_geo *geo = nvm_dev_get_geo(dev);
        int obj_count = geo->nblocks;
        object_count = obj_count;
        int obj_size = geo->nchannels * geo->nluns *geo->nplanes * geo->npages * geo->nsectors;
        OBJ_TABLE = (nvme_obj *)malloc(sizeof(nvme_obj) * obj_count);
        int i;
    //后续设计：读文件进行初始化
        for(i = 0; i < obj_count; i++){
            OBJ_TABLE[i].created &= 0x0;
            OBJ_TABLE[i].obj_id = i;
            OBJ_TABLE[i].obj_size =obj_size;
            OBJ_TABLE[i].obj_offset = 0;
        }
        obj_bitmap = (unsigned char *)malloc(sizeof(unsigned char) * obj_count);
        for(i = 0; i < 10; i++)
            obj_bitmap[i] = 1;
        for(i = 10; i < obj_count; i++)
            obj_bitmap[i] = 0;
        return dev;
    }
}
int dev_close(struct nvm_dev *dev)
{
    nvm_dev_close(dev);
    return 0;
}
