//
// Created by wuyue on 12/26/18.
//

#ifndef CEPH_OS_BLUESTORE_OCDEVICE_H
#define CEPH_OS_BLUESTORE_OCDEVICE_H

extern "C"
{
//Must ADD extern "C"
#include "libocssd/objssd-nvme.h"
}

#include "include/interval_set.h"
#include "include/intarith.h"
#include "common/debug.h"
#include "common/errno.h"
#include "include/assert.h"
#include "BlockDevice.h"
#include "include/denc.h"
#include <map>
#include <bitset>
#include <fstream>

#ifdef dout_context
#undef dout_context
#endif
#define dout_context g_ceph_context
#define dout_subsys ceph_subsys_bdev

#define MOCK_TEST

class SegmentManager;
class Segment
{
public:
  uint64_t bdev_lba_offset; //bdev_lba_offset / segmentsize = obj_logical_id
  uint32_t nvm_obj_id;      //nvm_obj_id , get by obj_create = obj_physical_id
  uint32_t nvm_obj_off = 0; //
  uint32_t size;

  std::bitset<96 * 1024> invalid_bitmap;

  Segment(uint64_t bdev_lba_offset, uint32_t nvm_obj_id, uint32_t _size) : bdev_lba_offset(bdev_lba_offset),
                                                                           nvm_obj_id(nvm_obj_id), size(_size)
  {
    //clear
    invalid_bitmap.reset();
  }

  uint64_t append(int fd, void *buf, uint32_t len)
  {
    dout(10) << std::hex << " segment append length: 0x" << len << std::dec << dendl;

    int l = 0;
    l = pwrite(fd, buf, len, bdev_lba_offset + nvm_obj_off);
    ceph_assert(l >= 0);
    ceph_assert(l == len);

    nvm_obj_off += l;
    return len;
  }

  uint64_t read(int fd, void *buf, uint32_t off, uint32_t len)
  {
    dout(10) << std::hex << " segment read off: 0x" << off
             << " length: 0x" << len << std::dec << dendl;
    if (off + len > size)
      len = size - off;
    uint64_t l = 0;
    l = pread(fd, buf, len, bdev_lba_offset + off);
    ceph_assert(l == len);
    return len;
  }

  void discard(uint64_t ioff, uint32_t ilen)
  {
    //Don't do any check
    for (auto pos = ioff / 4096; pos < (ioff + ilen) / 4096; pos++)
    {
      invalid_bitmap.set(pos);
    }
  }

  uint64_t append(struct nvm_dev *dev, void *buf, uint32_t len)
  {
    io_u io;
    io.data = buf;
    io.data_size = len / 4096;
    io.obj_id = this->nvm_obj_id;
    io.obj_off = this->nvm_obj_off / 4096;
    int r = obj_write(dev, &io);
    ceph_assert(r == 0);
    nvm_obj_off += len;
    return len;
  }
  uint64_t read(struct nvm_dev *dev, void *buf, uint32_t off, uint32_t len)
  {

    dout(10) << "OCDevice:read" << std::hex << "__off:" << off << " __len:" << len << std::dec << dendl;
    io_u io;
    io.data = buf;
    io.data_size = len / 4096;
    io.obj_id = this->nvm_obj_id;
    io.obj_off = off / 4096;
    int r = obj_read(dev, &io);
    ceph_assert(r == 0);
    return len;
  }

  void erase()
  {
    //TODO
  }

  ///////////////TOOL FUNCTIONS//////////////////////////////////
  friend ostream &operator<<(ostream &o, const Segment &seg)
  {
    o << "["
      << " bdev_lba_offset= " << (seg.bdev_lba_offset / (1024 * 1024)) << "MiB"
      << " obj_logical_id= " << seg.bdev_lba_offset / seg.size
      << " nvm_obj_id= " << seg.nvm_obj_id
      << " nvm_obj_off= " << seg.nvm_obj_off
      << " size= " << (byte_u_t(seg.size))
      << " invalid bytes= " << (seg.invalid_bitmap.count()) * 4 << "KiB"
      << "]";

    return o;
  }
};

class SegmentManager
{

  class SpinLock
  {
  public:
    ceph::spinlock *_s;
    explicit SpinLock(ceph::spinlock *s)
    {
      _s = s;
      _s->lock();
    }
    ~SpinLock()
    {
      _s->unlock();
    }
  };

private:
  ceph::spinlock s;
  std::mutex seg_map_lock;
  std::map<uint64_t, Segment *> seg_map; // offset / seg_size = seg_id; mapping seg_id => Seg
  atomic_uint32_t mock_obj_id = {1};

  //Because objssd now cannot persist meta data of objs, this is a trick
  std::string corefile = "/tmp/ocssd.core";

public:
  void _mock_coredump();
  void _mock_coreback();

public:
  string backend = "mock";
  uint64_t flash_page_size = 4096;             // 4KiB
  uint32_t segment_size = 312 * (1024 * 1024); // 384MiB
  uint64_t nr_reserved_segments = 1;
  uint64_t nr_lba_segments = 1000;
  struct nvm_dev *dev = nullptr; //nvm_dev

  int new_nvm_obj(uint32_t *obj_id, uint32_t *obj_size);

  bool is_fall_within_the_same_segment(uint64_t offset, uint32_t length);

  std::string dump_seg_map();

  //We make sure a write operation never overlap more than 2 segments
  std::tuple<Segment *, Segment *>
  get_segment(uint64_t offset, uint32_t length);

  //But a discard operation may overlap random numbers segments
  //We must handle this case
  void _segment_discard_small(uint64_t offset, uint32_t length, interval_set<uint64_t> *free);

  void _segment_discard_big(uint64_t offset, uint32_t length, interval_set<uint64_t> *free);

  void _segment_discard(uint64_t offset, uint32_t length, interval_set<uint64_t> *free);

  void segment_discard(interval_set<uint64_t> &p, interval_set<uint64_t> *free);

  void get_written_segments(interval_set<uint64_t> &p)
  {

    int unclosed_seg_count = 0;
    for (auto kv : seg_map)
    {
      auto off = kv.second->bdev_lba_offset;
      auto len = kv.second->nvm_obj_off;
      if (len != kv.second->size)
        unclosed_seg_count++;
      p.insert(off, len);
    }
    dout(10) << __func__
             << "  unclosed_seg_count= " << unclosed_seg_count
             << std::hex
             << " written_seg_set= " << p
             << std::dec
             << dendl;

    if (unclosed_seg_count > 1)
    {
      dout(0) << __func__ << " WARNNING: "
              << " MORE THAN ONE unclosed_seg_count "
              << dendl;
    }
  }

  SegmentManager();

  ~SegmentManager();
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
  OCDevice(CephContext *cct, aio_callback_t cb, void *cbpriv, aio_callback_t d_cb, void *d_cbpriv) : BlockDevice(cct, cb, cbpriv),
                                                                                                     dcb(d_cb),
                                                                                                     dcb_priv(d_cbpriv)
  {
    BlockDevice::rotational = false;
    segmentManager = new SegmentManager();
  }

private:
  std::string dev_path = "";     //sys link to
  int fd = -1;                   //ocssd device fd , for mock backend
  struct nvm_dev *dev = nullptr; //nvm_dev,for ocssd backend
  aio_callback_t dcb = nullptr;
  void *dcb_priv = nullptr; //first parameter of dcb;

  SegmentManager *segmentManager = nullptr;

public:
  void aio_submit(IOContext *ioc) override;

  int collect_metadata(const std::string &prefix, map<std::string, std::string> *pm) const override;

  int read(uint64_t off, uint64_t len, bufferlist *pbl,
           IOContext *ioc,
           bool buffered) override;
  int aio_read(uint64_t off, uint64_t len, bufferlist *pbl,
               IOContext *ioc) override;

  int read_random(uint64_t off, uint64_t len, char *buf, bool buffered) override;
  int write(uint64_t off, bufferlist &bl, bool buffered) override;
  int aio_write(uint64_t off, bufferlist &bl,
                IOContext *ioc,
                bool buffered) override;
  int flush() override;

  // for managing buffered readers/writers
  int invalidate_cache(uint64_t off, uint64_t len) override;
  int open(const std::string &path) override;
  void close() override;

  int discard(uint64_t offset, uint64_t len) override;
  int queue_discard(interval_set<uint64_t> &p) override;

  uint64_t get_reserve_size() const override;
  void get_written_extents(interval_set<uint64_t> &p) override;
  bool supported_bdev_label() override { return false; }
};

#endif //CEPH_OS_BLUESTORE_OCDEVICE_H
