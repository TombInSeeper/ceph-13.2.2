//
// Created by wuyue on 12/26/18.
//


#include <common/debug.h>
#include "common/errno.h"

#include "include/stringify.h"
#include "OCDevice.h"






uint64_t OCDevice::get_reserve_size() const {
  return this->segmentManager->segment_size;
}


int OCDevice::open(const std::string &path) {
  this->dev_path = path;
  int r = 0;
  this->fd = ::open(path.c_str(), O_RDWR );
  if (fd < 0) {
    r = -errno;
    derr << __func__ << " got:" << cpp_strerror(r) << dendl;
    return r;
  }

  segmentManager = new SegmentManager();
  BlockDevice::size = segmentManager->nr_lba_segments * segmentManager->segment_size;
  BlockDevice::block_size = segmentManager->flash_page_size;
  ceph_assert(block_size == cct->_conf->bdev_block_size);


  return 0;
}

void OCDevice::close(){


  dout(0) << " OCDevice: " << __func__ << dendl;
  delete segmentManager;

  int r = ::close(fd);
  if (r < 0) {
    r = -errno;
    derr << __func__ << " got:" << cpp_strerror(r) << dendl;
    return;
  }
}
int OCDevice::invalidate_cache(uint64_t off , uint64_t len){
  return 0;
}
int OCDevice::flush(){
  return 0;
}

void OCDevice::aio_submit(IOContext *ioc){
  assert(ioc->num_pending.load() == 0 && ioc->num_running.load() == 0);
  aio_callback(aio_callback_priv,ioc->priv);
}

int OCDevice::read(uint64_t off, uint64_t len, bufferlist *pbl,
         IOContext *ioc,
         bool buffered)
{
  (void)buffered;
  (void)ioc;

  bufferptr p = buffer::create_page_aligned(len);
  char *buf = p.c_str();
  auto l = 0UL;
  auto off1 = off;
  int r = 0;
  {
    auto [ s1 , s2 ] = segmentManager->get_segment(off,len);
    std::vector<Segment*> sv= { s1 ,s2 };
    for(auto s : sv)
    {
      if(s){
        l = s->read(fd, buf + l, off1 % s->size ,len);
        off1 += l;
        len -= l;
      }
    }
    ceph_assert( len == 0);
  }

  pbl->clear();
  pbl->push_back(std::move(p));

  return 0;
}

int OCDevice::read_random(uint64_t off, uint64_t len, char *buf, bool buffered) {

  (void)buffered;
  bufferlist bl;
  read(off,len,&bl,nullptr,false);

  memmove(buf,bl.c_str(),len);


  return 0;
}

int OCDevice::aio_read(uint64_t off,uint64_t len ,bufferlist *pbl,IOContext *ioc)
{
  dout(30) << " aio_read data from a xfs file" << dendl;
  return read(off,len,pbl,ioc,false);
}
int OCDevice::write(uint64_t off, bufferlist& bl, bool buffered)
{
  (void)buffered;

  bl.rebuild_page_aligned();
  auto len = bl.length();

  ceph_assert( len % segmentManager->flash_page_size == 0);

  dout(10) << " OCDevice::write " << " buffer is contiguous :" << bl.is_contiguous() << dendl;

  if(bl.is_contiguous())
    dout(10) << " OCDevice::write " << "Good , the data buffer is contiguous, no copy " << dendl;
  else
    dout(10) << " OCDevice::write " << "Bad , the data buffer is contiguous, copy triggered" << dendl;


  const char *data = bl.c_str();
  auto  [s1,s2]  = segmentManager->get_segment(off,len);

  if(s2 == nullptr){
    dout(10) << " OCDevice::write " << "I'm now tring to append data to ONE superblock" <<
      " obj_physical_id = " << s1->nvm_obj_id <<
      " obj_logical_id = " << s1->bdev_lba_offset / (s1->size) <<
      " obj_bdev_lba_off = " << s1->bdev_lba_offset  <<
      " obj_nvm_off = " << s1->nvm_obj_off  <<
      " blue_offset = " << ( off ) <<
      " data length  = " << bl.length()
      << dendl;

    dout(10) <<
             " off % s1->size = " << off % s1->size <<
             " s1->nvm_obj_off = " << s1->nvm_obj_off
             << dendl;

    ceph_assert(off % s1->size == s1->nvm_obj_off);
    s1->append(fd, (void *)data , len);
    return 0;
  }
  else
  {

    void *data1 = (void *)data;
    auto l1 = s1->size - s1->nvm_obj_off;
    dout(10) << " OCDevice::write " << "I'm now tring to append data to TWO superblocks" <<
             " The first one: {" <<
             " obj_physical_id = " << s1->nvm_obj_id <<
             " obj_logical_id = " << s1->bdev_lba_offset / (s1->size) <<
             " obj_bdev_lba_off = " << s1->bdev_lba_offset  <<
             " obj_nvm_off = " << s1->nvm_obj_off  <<
             " blue_offset = " << ( off ) <<
             " data length  = " << l1 <<
             "}"
             << dendl;

    void *data2 = (void *)(data + l1 );
    auto l2 = len - l1;

    dout(10) << " The second one: {" <<
             " obj_physical_id = " << s2->nvm_obj_id <<
             " obj_logical_id = " << s2->bdev_lba_offset / (s2->size) <<
             " obj_bdev_lba_off = " << s2->bdev_lba_offset  <<
             " obj_nvm_off = " << s2->nvm_obj_off  <<
             " blue_offset = " << ( off+l1 ) <<
             " data length  = " << l2 <<
             "}"
             << dendl;

    ceph_assert(s2->nvm_obj_off == 0);
    s1->append(fd , data1, l1);
    s2->append(fd , data2 ,l2);

    return 0;
  }




  return 0;
}
int OCDevice::aio_write(uint64_t off, bufferlist& bl,
                        IOContext *ioc,
                        bool buffered)
{
  dout(10) << " aio_write == write" << dendl;
  (void)ioc;
  (void)buffered;
  return write(off,bl,false);
}


int OCDevice::collect_metadata(const string& prefix, map<string,string> *pm) const
{
  (*pm)[prefix + "rotational"] = "0";
  (*pm)[prefix + "size"] = stringify(get_size());
  (*pm)[prefix + "block_size"] = stringify(get_block_size());
  (*pm)[prefix + "driver"] = "libobj";
  (*pm)[prefix + "type"] = "nvme";
  (*pm)[prefix + "access_mode"] = "libobj";
  return 0;
}

int OCDevice::discard(uint64_t offset, uint64_t len) {

  dout(30) << " " <<  __func__ << " off: " << offset << "len: " << len <<  dendl;


  if(false){
    interval_set<uint64_t > release_set;
    release_set.insert(offset,len);
    dcb(dcb_priv, static_cast<void*>(&release_set));
  }

  return 0;
}


