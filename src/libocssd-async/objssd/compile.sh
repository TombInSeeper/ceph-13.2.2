gcc -o test test.c objssd-nvme.c objssd-bbt.c objssd-map.c objssd-rw.c objssd-thread.c queue.c liblightnvm.a -laio -lpthread -lrt 
