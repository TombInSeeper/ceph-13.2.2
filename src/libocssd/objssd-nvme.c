#include "objssd-nvme.h"

#define TRANSFER_UNIT_SIZE 4096
#define PROG_GRANULARITY 4

#define PLANE_SUPERBLOCK 1

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
}

int obj_addr_to_oc_addr(struct nvm_dev* dev, struct nvm_addr *addr, int obj_id, uint64_t obj_offset)
{
    const struct nvm_geo *geo = nvm_dev_get_geo(dev);
    int block_index = obj_id;
    
    int transfer_floor_unit_count = geo->nchannels * geo->nluns * geo->nplanes * PROG_GRANULARITY;
    int transfer_floor_index = obj_offset / transfer_floor_unit_count;
    int transfer_floor_offset = obj_offset % transfer_floor_unit_count;
    
    int floor_channel_unit_count = geo->nluns * geo->nplanes * PROG_GRANULARITY;
    int channel_index = transfer_floor_offset / floor_channel_unit_count;
    int floor_channel_offset = transfer_floor_offset % floor_channel_unit_count;
    int floor_lun_unit_count = geo->nplanes * PROG_GRANULARITY;
    int lun_index = floor_channel_offset / floor_lun_unit_count;
    int floor_lun_offset = floor_channel_offset % floor_lun_unit_count;
    int floor_plane_unit_count = PROG_GRANULARITY;
    int plane_index = floor_lun_offset / floor_plane_unit_count;
    int plane_offset = floor_lun_offset % floor_plane_unit_count;
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
    print_oc_addr(oc_addr);
    int ret = nvm_addr_write(dev, oc_addr, 1, data, NULL, 0x1, NULL);
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
    print_oc_addr(oc_addr);
    int ret = nvm_addr_read(dev, oc_addr, 1, data, NULL, 0x1, NULL);
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
    for(i = 0; i < data_transfer_size; i++){
        printf("write :%d\n", i);
        __obj_write(dev, data_buffer_pointer + i * 4096, obj_id, obj_offset + i);
    }
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
        printf("read :%d\n", i);
        __obj_read(dev, data_buffer_pointer + i * 4096, obj_id, obj_offset + i);
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
    if(1){
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
    if(1){
        struct nvm_dev *dev;
        dev = nvm_dev_open(dev_path);
    
        const struct nvm_geo *geo = nvm_dev_get_geo(dev);
        int obj_count = geo->nblocks;
        object_count = obj_count;
        int obj_size = geo->nchannels * geo->nluns *geo->nplanes * geo->npages * geo->nsectors;
        OBJ_TABLE = (nvme_obj *)malloc(sizeof(nvme_obj) * obj_count);
        int i;
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
