//
// Created by root on 2/25/19.ocssd_aio_t
//

#ifndef CEPH_OCSSD_AIO_H
#define CEPH_OCSSD_AIO_H

extern "C" {
    #include "libocssd/include/liblightnvm.h"
}

#include "include/buffer.h"
#include "include/types.h"



#define     OCSSD_MAX_BLK_NUM   (1500U)
#define     OCSSD_MAX_IO_SIZE   (16*4096UL)
#define     OCSSD_IO_READ       (0x1)
#define     OCSSD_IO_WRITE      (0x2)


struct ocssd_offset_t {
    unsigned int fin_ofst;
};


struct ocssd_sb_summary_t{
    int nr_sblks;
    int sblk_map[OCSSD_MAX_BLK_NUM];
    ocssd_offset_t sblk_ofst[OCSSD_MAX_BLK_NUM];
};


struct ocssd_aio_t{
    //Set by me
    struct cmd_ctx  ctx;
    struct nvm_addr addrs[32];
    //Set by caller
    uint8_t  io_type;
    uint8_t  io_depth;
    uint64_t lba_off;
    uint64_t lba_len;
    bufferlist bl;
    void    *priv;
};

typedef ocssd_aio_t io_ctrl;
typedef ocssd_sb_summary_t pm_data_t;
#endif //CEPH_OCSSD_AIO_H
