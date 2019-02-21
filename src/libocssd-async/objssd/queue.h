//
//  queue.h
//  
//
//  Created by jiawenqing on 2019/1/20.
//

#ifndef queue_h
#define queue_h

#include "type.h"
#include <pthread.h>
#define ElemType queue_node
#define MAXSIZE 64

typedef struct{
    ElemType data[MAXSIZE];
    int front;
    int rear;
    unsigned int size;
    pthread_mutex_t mutex_lock;
}Queue;

Queue *CreateQueue();
int IsFullQueue(Queue *q);
int IsEmptyQueue(Queue *q);
int EnQueue(Queue *q, ElemType *elem);
int DeQueue(Queue *q, ElemType *elem);
int get_queue_size(Queue *q);

#endif /* queue_h */
