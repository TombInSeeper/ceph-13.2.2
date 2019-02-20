//
//  objssd-rw.c
//  
//
//  Created by jiawenqing on 2019/1/21.
//

#include "libnvm_full.h"
#include "type.h"
#include "objssd-map.h"
#include <linux/types.h>
#include <unistd.h>
#include <pthread.h>
#include "queue.h"
#include <string.h>
#include <stdio.h>

extern nvme_obj *OBJ_TABLE;
extern pthread_mutex_t OBJ_TABLE_LOCK;
extern Queue **queue_table;


/**
 * init the queue node
 */
void init_queue_node(queue_node *node_t, __u32 obj_id, __u64 obj_off, void *data, __u64 data_size,
                     req_tag io_req_tag, struct nvm_dev *dev, int op_type, int *complete_bit_pointer)
{
    memset(node_t, 0, sizeof(queue_node));
    node_t->dev = dev;
    node_t->data_size = data_size;
    node_t->data = data;
    node_t->op_type = op_type;
    //printf("debug op_type:%d\t%d\n", op_type, node_t->op_type);
    node_t->complete_bit_pointer = complete_bit_pointer;
    node_t->obj_id = obj_id;
    node_t->obj_off = obj_off;
}

/**
 * insert the read or write request to the queue
 * @param dev device pointer
 * @param io  io parameters
 * @param op_type read operation or write operation
 * @retval 0 insert the queue successfully
 */
int __obj_rw(struct nvm_dev *dev, io_u *io, int op_type)
{

    printf("debug in ___obj_rw\n");
    const struct nvm_geo *geo = nvm_dev_get_geo(dev);
    int cmd_num = 0;  // count of commands
    int data_size = io->data_size;
    int max_complete_bit_num = data_size / 8 + 2; //max commands count
    int *complete_bit = (int *)malloc(sizeof(int) * max_complete_bit_num); //mark the completions
    
    queue_node *node_t = (queue_node *)malloc(sizeof(queue_node));
    struct nvm_addr addr_t;
    //first step: send the requests of first lun
    int first_step_size = 24 - io->obj_off % 24;
    first_step_size = (first_step_size == 24) ? 0 : first_step_size;
    int i = 0;
    for(i = 0; (i + 8) < first_step_size; i = i + 8){
        init_queue_node(node_t, io->obj_id, io->obj_off, (void *)(io->data + i * 4096), 8, io->io_req_tag, dev, op_type, complete_bit + 5);
        //calculate the lun it belongs to
        obj_addr_to_oc_addr(dev, &addr_t, io->obj_id, io->obj_off + i);
        int lun_index = addr_t.g.ch * geo->nluns + addr_t.g.lun;
        //maybe the queue is full, wait until the queue has free entry
        while(1){  
            if(EnQueue(queue_table[lun_index], node_t) == 0) 
                break;
            usleep(2000);
        }
    }
    if(i != first_step_size){
        init_queue_node(node_t, io->obj_id, io->obj_off, io->data + i * 4096, first_step_size - i, io->io_req_tag, dev, op_type, &(complete_bit[cmd_num ++]));
        obj_addr_to_oc_addr(dev, &addr_t, io->obj_id, io->obj_off + i);
        int lun_index = addr_t.g.ch * geo->nluns + addr_t.g.lun;
        while(1){  
            if(EnQueue(queue_table[lun_index], node_t) == 0) 
                break;
            usleep(2000);
        }
    }
    //second step(if exist): send the remaining requests
    if(first_step_size < data_size){
        int second_begin_offset = io->obj_off + first_step_size;
        int second_step_size = data_size - first_step_size;
        for(i = 0; (i + 8) < second_step_size; i = i + 8){
            obj_addr_to_oc_addr(dev, &addr_t, io->obj_id, io->obj_off + i + first_step_size);
            init_queue_node(node_t, io->obj_id, io->obj_off + i + first_step_size, io->data + (i + first_step_size) * 4096, 8, io->io_req_tag, dev, op_type, &(complete_bit[cmd_num ++]));
            int lun_index = addr_t.g.ch * geo->nluns + addr_t.g.lun;
            //printf("debug:i:%d\n", i);
            while(1){  
                if(EnQueue(queue_table[lun_index], node_t) == 0) 
                    break;
                usleep(200);
            }
        }
        if(i != second_step_size){
            obj_addr_to_oc_addr(dev, &addr_t, io->obj_id, io->obj_off + i + first_step_size);
            init_queue_node(node_t, io->obj_id, io->obj_off + i + first_step_size, io->data + i * 4096, second_step_size - i, io->io_req_tag, dev, op_type, &(complete_bit[cmd_num ++]));
            int lun_index = addr_t.g.ch * geo->nluns + addr_t.g.lun;
            while(1){  
                if(EnQueue(queue_table[lun_index], node_t) == 0) 
                    break;
                usleep(200);
            }
        }
    }
    i = 0;
    while(i < cmd_num){
        if(complete_bit[i] != 1)  continue;
        i = i + 1;
    }
    if(op_type == 1){
        pthread_mutex_lock(&OBJ_TABLE_LOCK);
        OBJ_TABLE[io->obj_id].obj_offset += io->data_size;
        pthread_mutex_unlock(&OBJ_TABLE_LOCK);
    }
    free(complete_bit);
    free(node_t);
    return 0;
}

int obj_write(struct nvm_dev* dev, io_u *io)
{
    return __obj_rw(dev, io, 1);
}
int obj_read(struct nvm_dev *dev, io_u *io)
{
    return __obj_rw(dev, io, 0);
}
int obj_close(struct nvm_dev * dev, int obj_id)
{
    uint64_t obj_offset = OBJ_TABLE[obj_id].obj_offset;
    if(obj_offset % 24 != 0){
        uint64_t data_align = 24 - (obj_offset % 24);
        char *wbuffer = (char *)malloc(data_align * 4096);
        memset(wbuffer, 0, data_align * 4096);
        io_u io;
        io.obj_id = obj_id;
        io.obj_off = obj_offset;
        io.data_size = data_align;
        io.data = wbuffer;
        obj_write(dev, &io);
        free(wbuffer);
    }
    return 0;
}
