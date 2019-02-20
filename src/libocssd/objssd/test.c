#include "objssd-nvme.h"

int main()
{
    struct nvm_dev *dev  = dev_open("/dev/nvme0n1");
    __u32 obj_id = 30;
    __u32 obj_size = 0;
    int ret;
    io_u *io = (io_u *)malloc(sizeof(io_u));
    char *rbuffer, *wbuffer;
    int io_size = 4096 * 960;
    wbuffer = (char *)malloc(io_size);
    rbuffer = (char *)malloc(io_size);
    int i;
    for(i = 0; i < io_size; i++)  {wbuffer[i] = 'c'; rbuffer[i] = 'd';}
    io->data = wbuffer;
    io->data_size = io_size / 4096;
    ret = obj_create(dev, &obj_id, &obj_size);
    printf("object_id:%d\tobject_size:%lld\n", obj_id, obj_size);
    io->obj_id = obj_id;
    io->obj_off = 0;
    obj_write(dev, io);
    printf("write finished\n");
    io->data = rbuffer;
    obj_read(dev, io);
    for(i = 0; i < io_size / 10; i++) printf("%c", rbuffer[i]);
    dev_close(dev);
    return 0;
}
