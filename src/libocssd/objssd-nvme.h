#ifndef __OBJECTSSD_H__
#define __OBJECTSSD_H__
#include <fcntl.h>
#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <assert.h>
#include <linux/types.h>
#include <sys/ioctl.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <time.h>
#include <inttypes.h>
#include <string.h>
#include <malloc.h>
#include "./include/liblightnvm.h"
#include "./src/libnvm_full.h"


typedef struct req_tag{
    __u32 req_orig;
}req_tag;

/**
 * parameters of reading or writing
 */
typedef struct _io_u{
    __u32 obj_id;          /**< id of the object to operate */
    __u64 obj_off;         /**< the start offset to operate */
    void *data;            /**< the position to store reading data or write data */
    __u64 data_size;       /**< data size to transfer */
    req_tag io_req_tag;    /**< the tag which is passed from top */
}io_u;

/**
 *the struct to store information of one object
 */
typedef struct {
    unsigned int created : 1;    /**< the object is created or not */
    unsigned int obj_id;         /**< id of this object */
    unsigned int obj_size;       /**< size of this object */
    __u64 obj_offset;            /**< the writable offset of this object */
    unsigned int *block_bitmap;
} nvme_obj;

int obj_read(struct nvm_dev *dev, io_u *io);
int obj_write(struct nvm_dev *dev, io_u *io);
int obj_create(struct nvm_dev *dev, unsigned int *obj_id, unsigned int *obj_4k_size);
int obj_delete(struct nvm_dev *dev, unsigned int obj_id);
struct nvm_dev* dev_open(const char * dev_path);
int dev_close(struct nvm_dev *dev);
#endif
