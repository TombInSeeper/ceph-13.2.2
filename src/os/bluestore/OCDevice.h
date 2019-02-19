//
// Created by wuyue on 12/26/18.
//

#ifndef CEPH_OS_BLUESTORE_OCDEVICE_H
#define CEPH_OS_BLUESTORE_OCDEVICE_H


#include "libocssd/objssd-nvme.h"
#include "BlockDevice.h"

//Using std
#include <thread>
#include <mutex>

class SegmentBackEnd{
protected:
    CephContext *cct;
    std::string core        = "/tmp/ocssd.core";
    uint32_t segmentSize    = OCSSD_SEG_SIZE;
    uint32_t nr_reserved    = OCSSD_NR_SEG_RESERVE;   //Must be 1
    uint32_t nr_pre_create  = OCSSD_NR_SEG_USER;      //We erase all segs when mkfs
    uint32_t nr_user_total  = OCSSD_NR_SEG_USER;      //bdev->size

    //Dump seg_map to a file,this is a trick;
    void  core_dump();

    //Recover seg_map from a file,this is a trick;
    void  core_back();

    virtual int seg_create(uint32_t *seg_id) { return 0; }
public:
    struct Segment{
        enum Status{
            Unusable = 0x0,
            Usable   = 0x1
        };
        uint32_t id     =  0;
        uint8_t  status =  Unusable;
        uint32_t off    =  0;
        Segment() = default;
    };

    //emm....I think we don't need a lock here
    //gc_thread and io_thread unlikely access to the same Segment concurrently
    Segment *seg_map;
    static SegmentBackEnd* create(std::string backend_type,CephContext*cct, std::string path);

    //These helpers are called by OCDevice
    uint64_t get_seg_size() const  { return segmentSize; }
    uint64_t get_size() const { return (uint64_t)(nr_user_total) * segmentSize ; }
    uint64_t get_reserve_size() const { return nr_reserved * segmentSize;}
    void     get_written_segments(interval_set<uint64_t> &p ) {
      for(auto seg = seg_map ; seg < seg_map + nr_reserved + nr_user_total ; seg++){
        if(seg->status == Segment::Usable && seg->off > 0 ){
          auto lba_offset = (seg - seg_map) * segmentSize;
          p.insert(lba_offset,seg->off);
        }
      }
    }

    //.................................
    //These function recive logial obj_id
    // 4K_obj_off and 4K_data_size
    virtual int seg_noop(io_u* io) = 0;
    virtual int seg_read(io_u* io) = 0;
    virtual int seg_write(io_u *io) = 0;
    virtual int seg_erase(uint32_t seg_id) = 0;
    virtual ~SegmentBackEnd() = default;
};

class FileSegmentBackEnd : public SegmentBackEnd {
private:
    int direct_fd;
    uint32_t mock_seg_id;
public:
    explicit FileSegmentBackEnd(CephContext *cct, std::string path);
    ~FileSegmentBackEnd() override;
    int seg_erase(uint32_t seg_id) override;
    int seg_noop(io_u *io) override;
    int seg_read(io_u *io) override;
    int seg_write(io_u *io) override;
};

class OCSSDBackEnd : public SegmentBackEnd {
private:
    struct nvm_dev *dev;
    uint32_t mock_seg_id;
public:
    explicit OCSSDBackEnd(CephContext *cct, std::string path);
    ~OCSSDBackEnd() override;
    int seg_erase(uint32_t seg_id) override;
    int seg_noop(io_u *io) override;
    int seg_read(io_u *io) override;
    int seg_write(io_u *io) override;
};












class OCDevice : public BlockDevice
{
  // aio_callack parameters:
  // @1 : aio_callback_priv = Bluestore*
  // @2 : ioc->priv = AioContext*
  // discard_callback_parameters:
  // @1 : priv  = Bluestore*
  // @2 : priv2 = interval_set<uint64_t>*
public:
  OCDevice(CephContext *cct, aio_callback_t cb, void *cbpriv, aio_callback_t d_cb, void *d_cbpriv) :
  BlockDevice(cct, cb, cbpriv),
  dcb(d_cb),
  dcb_priv(d_cbpriv)
  {

  }

private:
    uint64_t    segmentSize = 0 ;
    std::string dev_path;           //sys link to
    aio_callback_t dcb = nullptr;
    void *dcb_priv = nullptr;       //first parameter of dcb;
    SegmentBackEnd *sbe = nullptr; //Initialize by open;


    //Using C++ std
    //Aio thread / queue
    enum {
        IO_NOOP   = 0x0,
        IO_READ   = 0x1,
        IO_WRITE  = 0x2
    };
    atomic_uint               pre_alloc_seq = {0};
    atomic_uint               submitted_seq = {0};
    std::list<IOContext*>     pending_io; //queue
    std::thread               aio_thread;  //thread
    std::mutex                aio_mtx;
    std::condition_variable   aio_cv;
    bool                      aio_stop = false;
    void _aio_thread_entry();
    int  _aio_rw(uint64_t off , uint32_t len , bufferlist *bl ,IOContext *ioc) ;


public:
    int open(const std::string &path) override;
    void close() override;

    //Async IO
    void aio_thread_work() ;
    uint32_t get_submit_seq(IOContext *ioc)  override;
    void aio_submit(IOContext *ioc) override;
    int read(uint64_t off, uint64_t len, bufferlist *pbl, IOContext *ioc, bool buffered) override;
    int read_random(uint64_t off, uint64_t len, char *buf, bool buffered) override;
    int aio_read(uint64_t off, uint64_t len, bufferlist *pbl, IOContext *ioc) override;
    int write(uint64_t off, bufferlist &bl, bool buffered) override;
    int aio_write(uint64_t off, bufferlist &bl, IOContext *ioc, bool buffered) override;

    //Garbage Collection
    int queue_discard(interval_set<uint64_t> &p) override;

    //Helpers
    uint64_t get_reserve_size() const  override { return sbe->get_reserve_size(); }
    void get_written_extents(interval_set<uint64_t> &p) override { sbe->get_written_segments(p); };
    int  collect_metadata(const std::string &prefix, map<std::string, std::string> *pm) const override;

    //Do nothing
    int flush() override { return 0 ; }
    bool supported_bdev_label() override { return false; }
    int invalidate_cache(uint64_t off, uint64_t len) override { return 0 ; }



};
#endif //CEPH_OS_BLUESTORE_OCDEVICE_H
