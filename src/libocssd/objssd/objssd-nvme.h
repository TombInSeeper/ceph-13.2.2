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
#include <sys/time.h>
#include <fcntl.h>
#include <time.h>
#include <inttypes.h>
#include <string.h>
#include <malloc.h>
#include <pthread.h>
#include "libnvm_full.h"
#include "type.h"

int obj_read(struct nvm_dev *dev, io_u *io);
int obj_write(struct nvm_dev *dev, io_u *io);
int obj_create(struct nvm_dev *dev, unsigned int *obj_id, unsigned int *obj_4k_size);
int obj_delete(struct nvm_dev *dev, unsigned int obj_id);
struct nvm_dev* dev_open(const char * dev_path);
int dev_close(struct nvm_dev *dev);
int obj_close(struct nvm_dev * dev, int obj_id);


//----------------
int mark_created(unsigned int obj_id);
#endif
