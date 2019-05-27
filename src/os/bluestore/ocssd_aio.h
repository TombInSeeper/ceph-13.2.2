//
// Created by root on 2/25/19.ocssd_aio_t
//

#ifndef CEPH_OCSSD_AIO_H
#define CEPH_OCSSD_AIO_H

#include "include/buffer.h"
#include "include/types.h"


#define     OCSSD_IO_READ       (0x1)
#define     OCSSD_IO_WRITE      (0x2)
#define     OCSSD_MAX_IO_SIZE   (32*1024)

struct ocssd_aio_t{
    //low-level ctx
    void* ocssd_ctx;

    //FOR DEBUG
    std::string dg_str;

    //Set by caller
    uint8_t  io_type;
    uint8_t  io_depth;
    uint64_t lba_off;
    uint64_t lba_len;
    bufferlist bl;
    void    *priv;
};








#endif //CEPH_OCSSD_AIO_H
