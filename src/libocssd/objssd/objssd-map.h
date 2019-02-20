//
//  objssd-map.h
//  
//
//  Created by jiawenqing on 2019/1/21.
//

#ifndef objssd_map_h
#define objssd_map_h

#include "libnvm_full.h"
#include "type.h"

extern nvme_obj  *OBJ_TABLE;
extern uint8_t **BBT;

int obj_addr_to_oc_addr(struct nvm_dev* dev, struct nvm_addr *addr, int obj_id, uint64_t obj_offset);

#endif /* objssd_map_h */
