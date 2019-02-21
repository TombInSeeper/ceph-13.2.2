//
//  objssd-bbt.c
//  
//
//  Created by jiawenqing on 2019/1/21.
//

#include "objssd-bbt.h"
#include "stdio.h"
#include "stdlib.h"
#include "string.h"

/**
 * get the bbt from firmware and init the bbt in memory
 * @param dev the device pointer
 */
void init_BBT(struct nvm_dev *dev)
{
    unsigned int i, j;
    const struct nvm_geo *geo = nvm_dev_get_geo(dev);
    //malloc the space of BBT
    BBT = (uint8_t **)malloc(sizeof(uint8_t *) * geo->nchannels * geo->nluns * geo->nplanes);
    for(i = 0; i < geo->nchannels * geo->nluns * geo->nplanes; i++){
        BBT[i] = (uint8_t *)malloc(sizeof(uint8_t) * geo->nblocks);
    }
    //get the bbt of every lun
    struct nvm_addr *oc_addr = (struct nvm_addr *)malloc(sizeof(struct nvm_addr));
    unsigned int channel_index, lun_index, plane_index;
    for(channel_index = 0; channel_index < geo->nchannels; channel_index++){
        for(lun_index = 0; lun_index < geo->nluns; lun_index++){
            memset(oc_addr, 0, sizeof(struct nvm_addr));
            oc_addr->g.ch = channel_index;
            oc_addr->g.lun = lun_index;
            const struct nvm_bbt *bbt;
            bbt = nvm_bbt_get(dev, *oc_addr, NULL);
            int base_index = channel_index * geo->nluns * geo->nplanes + lun_index * geo->nplanes;
            //init the BBT in memory
            for(j = 0; j < geo->nblocks; j++){
                BBT[base_index][j] = bbt->blks[2 * j];
                BBT[base_index + 1][j] = bbt->blks[2 * j + 1];
            }
        }
    }
    free(oc_addr);
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
