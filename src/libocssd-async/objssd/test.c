#include "objssd-nvme.h"
#include "unistd.h"

int main()
{
    //sleep(30);
    struct nvm_dev *dev  = dev_open("/dev/nvme0n1");
    __u32 obj_id = 30;
    __u32 obj_size = 0;
    int ret;
    io_u *io = (io_u *)malloc(sizeof(io_u));
    char *rbuffer, *wbuffer;
    int io_size = 4096 * 32;
    wbuffer = (char *)malloc(io_size);
    rbuffer = (char *)malloc(io_size);
    int i;
    for(i = 0; i < io_size; i++)  {wbuffer[i] = 'c'; rbuffer[i] = 'd';}
    io->data = wbuffer;
    io->data_size = io_size / 4096;
    ret = obj_create(dev, &obj_id, &obj_size);
    printf("object_id:%d\tobject_size:%lld\n", obj_id, obj_size);
    io->obj_id = obj_id;
    struct timeval start, end;
    unsigned long duration;
    gettimeofday(&start, NULL);
    for(i = 0; i < 32 * 8 * 300; i = i + 32){
        io->obj_off = i;
        obj_write(dev, io);   
    }
    gettimeofday(&end, NULL);
    duration = 1000000 * (end.tv_sec - start.tv_sec) + end.tv_usec - start.tv_usec;
    
    printf("write duration time:%ld\n", duration);
    printf("transfer size:%d KB\n", 76800 * 4096);
    uint64_t size = (76800 * 4096) / ( 1024 *1024 );
    double duration_sec = duration / 1e6; 
    double s = size / duration_sec;
    printf("write dw:%lf MB /s\n", s);
    printf("write finished\n");
    /*io->data = rbuffer;
    //sleep(1);
    gettimeofday(&start, NULL);
    obj_read(dev, io);
    gettimeofday(&end, NULL);
    duration = 1000000 * (end.tv_sec - start.tv_sec) + end.tv_usec - start.tv_usec;
    
    printf("read duration time:%ld\n", duration);
    //printf("transfer size:%d KB\n", data_transfer_size * 4);
    size = (51200 * 4096) / ( 1024 *1024 );
    duration_sec = duration / 1e6; 
    s = size / duration_sec;
    printf("read dw:%lf MB /s\n", s);
    for(i = 0; i < 4096; i++) printf("%c", rbuffer[i]);*/
    dev_close(dev);
    return 0;
}
