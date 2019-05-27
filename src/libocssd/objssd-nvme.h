#ifndef __OBJECT_SSD_H__
#define __OBJECT_SSD_H__
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
#include <stdbool.h>

#include "include/liblightnvm.h"

#define     OCSSD_MAX_BLK_NUM   (1500U)

struct ocssd_t {
    struct nvm_dev *dev;
    struct nvm_geo *geo;
    const  struct nvm_bbt  *g_bbt[8][32];
    struct ocssd_sb_summary_t{
        int nr_sblks;
        int sblk_map[OCSSD_MAX_BLK_NUM];
        struct ocssd_offset_t {
            unsigned int fin_ofst;
        } sblk_ofst[OCSSD_MAX_BLK_NUM];
    } pm_data;

    uint64_t per_seg_size;
};

struct debuginfo_t {
    char *debug_str;
};


/// DEBUG HELPER

void addr_print(struct nvm_addr *addrs, int n , char* buf);

/// function


struct ocssd_t *ocssd_open( const char *path) ;

int ocssd_reset( struct ocssd_t * ocssd);

void ocssd_close( struct ocssd_t* ocssd);


struct cmd_ctx*  ocssd_prepare_ctx(
    struct ocssd_t* ocssd ,
    uint64_t lba_off ,
    uint64_t lba_len ,
    char* data ,
    struct debuginfo_t *dg );

void ocssd_destory_ctx(struct cmd_ctx *ctx);


int ocssd_write(struct ocssd_t* ocssd , struct cmd_ctx *ctx);
int ocssd_read(struct ocssd_t* ocssd , struct cmd_ctx *ctx);

int ocssd_erase(struct ocssd_t* , uint32_t seg_id );




#endif
