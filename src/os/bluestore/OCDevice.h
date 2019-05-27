//
// Created by wuyue on 12/26/18.
//

#ifndef CEPH_OS_BLUESTORE_OCDEVICE_H
#define CEPH_OS_BLUESTORE_OCDEVICE_H

//Using std
#include <common/Thread.h>
#include <mutex>


#include "BlockDevice.h"




class OCDevice : public BlockDevice
{
  // aio_callack parameters:
  // @1 : aio_callback_priv = Bluestore*
  // @2 : ioc->priv = AioContext*

public:
  OCDevice(CephContext *cct, aio_callback_t cb, void *cbpriv, aio_callback_t d_cb, void *d_cbpriv) :
  BlockDevice(cct, cb, cbpriv),
  aio_thread(this)
  {

  }

private:


    bool                            trick = false;

    std::list<IOContext*>           aio_queue;
    std::condition_variable         aio_cv;
    std::mutex                      aio_submit_mtx;


    atomic_uint                     aio_queue_depth = {0};
    atomic_uint                     pre_alloc_seq = {0};
    atomic_uint                     submitted_seq = {0};
    bool                            aio_stop = false;



    struct AioThread : public Thread {
        OCDevice *ocDevice = nullptr;
    public:
        explicit AioThread(OCDevice *_ocDevice):ocDevice(_ocDevice)
        {

        }
        void *entry()
        {
          ocDevice->aio_thread_work();
          return NULL;
        }
        void init(){
          create("ocssd_wrt");
        }
        void shutdown() {
          join();
        }
    } aio_thread;

    //MOCK
    int                             fd  = -1;
    //OCSSD
    struct ocssd_t                  *ocssd = nullptr;

    void _aio_start();

    void _aio_stop();


public:

    //
    int open(const std::string &path) override;
    void close() override;
    void init_disk() override;

    //Async IO
    void aio_thread_work() ;
    uint32_t get_submit_seq(IOContext *ioc)  override;
    int aio_read(uint64_t off, uint64_t len, bufferlist *pbl, IOContext *ioc) override;
    int aio_write(uint64_t off, bufferlist &bl, IOContext *ioc, bool buffered) override;
    void aio_submit(IOContext *ioc) override;

    int read(uint64_t off, uint64_t len, bufferlist *pbl, IOContext *ioc, bool buffered) override;
    int read_random(uint64_t off, uint64_t len, char *buf, bool buffered) override;
    int write(uint64_t off, bufferlist &bl, bool buffered) override;

    //Garbage Collection
    int queue_discard(interval_set<uint64_t> &p) override;

    //Helpers
    uint64_t get_reserve_size() const  override { return 1 * OCSSD_SEG_SIZE; }
    void get_written_extents(interval_set<uint64_t> &p) override ;
    int  collect_metadata(const std::string &prefix, map<std::string, std::string> *pm) const override;

    //Do nothing
    int flush() override { return 0 ; }
    bool supported_bdev_label() override { return false; }
    int invalidate_cache(uint64_t off, uint64_t len) override { return 0 ; }
};
#endif //CEPH_OS_BLUESTORE_OCDEVICE_H
