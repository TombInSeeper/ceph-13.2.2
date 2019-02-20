#include "objssd-map.h"

/**
 * change object ssd address(obj_id, obj_off) to open-channel ssd address
 * @param dev device pointer
 * @param addr the openchannel ssd address
 * @param obj_id object id
 * @param obj_off object offset
 */
int obj_addr_to_oc_addr(struct nvm_dev* dev, struct nvm_addr *addr, int obj_id, uint64_t obj_offset)
{
    const struct nvm_geo *geo = nvm_dev_get_geo(dev);
    //a suerblock means blocks from every plane
    unsigned int block_index = obj_id;
    int block_size = geo->npages * geo->nsectors;
    //because of bad blocks, so do not cover all blocks
    int block_num = OBJ_TABLE[obj_id].obj_size / block_size;
    
    int transfer_floor_unit_count = block_num * 12;
    int transfer_floor_index = obj_offset / transfer_floor_unit_count;
    int transfer_floor_offset = obj_offset % transfer_floor_unit_count;
    unsigned int lun_count = transfer_floor_offset / 24;
    int lun_offset = transfer_floor_offset % 24;
    unsigned int i = 0, lun_index = 0, channel_index = 0;
    while(i < lun_count){
        lun_index++;
        if(lun_index == geo->nluns){
            lun_index = 0;
            channel_index++;
        }
        if(BBT[channel_index * geo->nluns * geo->nplanes + lun_index * geo->nplanes][obj_id] == 0)
            i++;
    }
    int prog_num = lun_offset / 4;
    int prog_offset = lun_offset % 4;
    int plane_index = prog_num % 2;
    int floor = prog_num / 2;
    int sector_sum_count = transfer_floor_index * 12 + floor * 4 + prog_offset;
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
