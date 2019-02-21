#ifndef thread_h
#define thread_h

#include "libnvm_full.h"
#include "type.h"
#include "objssd-map.h"
#include "queue.h"


extern pthread_t *thread;
extern int *thread_id;
extern Queue **queue_table;

int send_request(queue_node node_t);
void process_request(void *args);

#endif /* bbt_h */
