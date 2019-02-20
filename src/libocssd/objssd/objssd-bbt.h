#ifndef bbt_h
#define bbt_h

#include "libnvm_full.h"
#include "type.h"

uint8_t **BBT;

void init_BBT(struct nvm_dev *dev);
void update_bbt(struct nvm_dev *dev);

#endif /* bbt_h */
