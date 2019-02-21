#include "queue.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
/**
 * create a queue
 * @retval NULL create failed
 * @retval q the pointer of queue
 */
Queue *CreateQueue()
{
    Queue *q = (Queue *)malloc(sizeof(Queue));
    if(!q)  {printf("created failed\n");  return NULL;}
    q->front = q->rear = -1;
    q->size = 0;
    pthread_mutex_init(&(q->mutex_lock), NULL);
    return q;
}

/**
 * judge the queue is full or not
 * @param q the pointer of queue
 * @retval 1 the queue is full
 * @retval 0 the queue is not full
 */
int IsFullQueue(Queue *q)
{
    pthread_mutex_lock(&(q->mutex_lock));
    int res = (q->size == MAXSIZE) ? 1 : 0;
    pthread_mutex_unlock(&(q->mutex_lock));
    return res;
}

/**
 * judge the queue is empty or not
 * @param q the pointer of q
 * @retval 1 the queue is empty
 * @retval 0 the queue is not empty
 */
int IsEmptyQueue(Queue *q)
{
    pthread_mutex_lock(&(q->mutex_lock));
    int res = (q->size == 0) ? 1 : 0;
    pthread_mutex_unlock(&(q->mutex_lock));
    return res;
}

/**
 * get the queue size
 * @param q the pointer of q
 * @retval the queue size
 */
int get_queue_size(Queue *q)
{
    pthread_mutex_lock(&(q->mutex_lock));
    int res = q->size;
    pthread_mutex_unlock(&(q->mutex_lock));
    return res;
}

/**
 * enter the queue
 * @param q the pointer of q
 * @param elem the element pointer
 * @retval 0 success
 * @retval -1 failed
 */
int EnQueue(Queue *q, ElemType *elem)
{
    //printf("enter the queue1\n");
    if(IsFullQueue(q))  {printf("The queue is full!!!\n");  return -1;}
    pthread_mutex_lock(&(q->mutex_lock));
    q->rear = (q->rear + 1) % MAXSIZE;
    q->size += 1;
    memcpy(&(q->data[q->rear]), elem, sizeof(ElemType));
    pthread_mutex_unlock(&(q->mutex_lock));
    //printf("enter the queue2\n");
    return 0;
}

/**
 * delete the queue
 * @param q the pointer of q
 * @param elem the element pointer
 * @retval 0 success
 * @retval -1 failed
 */
int DeQueue(Queue *q, ElemType *elem)
{
    //printf("out the queue1\n");
    if(IsEmptyQueue(q))  {printf("The queue is empty!!!\n");  return -1;}
    pthread_mutex_lock(&(q->mutex_lock));
    q->front = (q->front + 1) % MAXSIZE;
    q->size -= 1;
    memcpy(elem, &(q->data[q->front]), sizeof(ElemType));
    pthread_mutex_unlock(&(q->mutex_lock));
    //printf("out the queue2\n");
    return 0;
}
