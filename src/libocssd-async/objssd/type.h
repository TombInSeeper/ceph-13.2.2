//
//  type.h
//  
//
//  Created by jiawenqing on 2019/1/21.
//

#ifndef type_h
#define type_h

#include <linux/types.h>
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

typedef struct{
    unsigned int obj_id;
    unsigned long obj_off;
    void *data;
    __u64 data_size;
    req_tag io_req_tag;
    struct nvm_dev *dev;
    int op_type; //0-read, 1-write, 2-erase
    int *complete_bit_pointer;
}queue_node;

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

#endif /* type_h */
