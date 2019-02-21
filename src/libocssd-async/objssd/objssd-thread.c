//
//  objssd-thread.c
//  
//
//  Created by jiawenqing on 2019/1/21.
//

#include "objssd-thread.h"
#include "queue.h"
#include <stdio.h>


void print_oc_addr(struct nvm_addr *addr)
{
    printf("channel:%llu ", addr->g.ch);
    printf("lun:%llu ", addr->g.lun);
    printf("plane:%llu ", addr->g.pl);
    printf("block:%llu ", addr->g.blk);
    printf("page:%llu ", addr->g.pg);
    printf("sector:%llu\n", addr->g.sec);
}

/**
 * send the request to nvme driver
 * @param node_t the queue node which contains information of one request
 * @retval 0 success
 * @retval -1 failed
 */
int send_request(queue_node node_t)
{
    struct nvm_addr *addr = (struct nvm_addr *)malloc(sizeof(struct nvm_addr) * node_t.data_size);
    unsigned int i; 
    int ret;
    // init the addresses of data
    for(i = 0; i < node_t.data_size; i++){
        obj_addr_to_oc_addr(node_t.dev, &(addr[i]), node_t.obj_id, node_t.obj_off + i);
    }
    /////////////////////////////
    printf("type:%s\n", (node_t.op_type == 0) ? "read" : "write");
    for(i = 0; i < node_t.data_size; i++){
        print_oc_addr(&(addr[i]));
    }
    /////////////////////////////
    //recall read or write function according to op_type
    if(node_t.op_type == 0)
        ret = nvm_addr_read(node_t.dev, addr, node_t.data_size, node_t.data, NULL, 0x0, NULL);
    else if(node_t.op_type == 1)
        ret = nvm_addr_write(node_t.dev, addr, node_t.data_size, node_t.data, NULL, 0x0, NULL);
    if(ret != 0){
        printf("write failed\n");
        return -1;
    }
    (*(node_t.complete_bit_pointer)) = 1;
    free(addr);
    return 0;
}

/**
 * main process function of every thread
 * @param thread_index the index of thread
 */
void process_request(void *args)
{
    int thread_index = (int)(*((int *) args));
    free(args);
    while(1){
        int i, j;
        //one thread handle four luns
        for(i = 0; i < 4; i++){
            Queue *q = queue_table[thread_index * 4 + i];
            //fetch 10 requests each if num > 10, otherwise, fetch all
            if(get_queue_size(q) > 10){
                for(j = 0; j < 10; j++){
                    queue_node node_t;
                    DeQueue(q, &node_t);
                    send_request(node_t);
                }
            }
            else{
                int current_size = get_queue_size(q);
                for(j = 0; j < current_size; j++){
                    queue_node node_t;
                    DeQueue(q, &node_t);
                    send_request(node_t);
                }
            }
        }
    }
}
