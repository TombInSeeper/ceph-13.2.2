//
// Created by wuyue on 12/26/18.
//
#include "include/stringify.h"
#include "include/types.h"
#include "include/compat.h"
#include "common/align.h"
#include "common/errno.h"
#include "common/debug.h"
#include "common/perf_counters.h"
#include "common/io_priority.h"
#include <fstream>

#include "OCDevice.h"

#undef dout_context
#define dout_context g_ceph_context
#define dout_subsys ceph_subsys_bdev
#undef dout_prefix
#define dout_prefix *_dout << "OCDevice "

// Base BackEnd Factory Function
SegmentBackEnd *SegmentBackEnd::create(std::string backend_type, CephContext *cct, std::string path) {
  /*if(backend_type == "ocssd")
    return new OCSSDBackEnd(cct,path);*/
  if(backend_type == "mock")
    return new FileSegmentBackEnd(cct,path);
  if(backend_type == "ocssd")
    return new OCSSDBackEnd(cct,path);

  ceph_assert(nullptr == "Unsupported SegmentBackEnd");
  return nullptr;
}

void SegmentBackEnd::core_dump() {
  dout(0) << __func__ << " to " << core << dendl;
  auto begin = seg_map;
  auto end = seg_map + (nr_user_total + nr_reserved);
  auto n = static_cast<uint32_t>
      ( count_if(begin,end,[](const Segment& s){ return s.status == Segment::Usable ;}) );

  dout(0) << __func__ << " seg_map usable segs number: " << n << dendl;
  bufferlist bl;
  encode(n,bl);
  for(auto s = begin ; s != end ; s ++ ){
    if(s->status == Segment::Usable){
      encode((uint32_t)(s - begin),bl); //seg_lid
      encode(s->id,bl);     //seg_pid
      encode(s->off,bl);    //seg_off
    }
  }
  ofstream f(core, ios::binary);
  bl.write_stream(f);

  dout(20) << __func__ << " dump length =  " << bl.length() << dendl;
  dout(20) << __func__ << " dump buffer content = ";
  bl.hexdump(*_dout);
  *_dout << dendl;
}

void SegmentBackEnd::core_back() {
  dout(0) << __func__ << " recovery " << dendl;
  ifstream f(core.c_str(), ios::binary);
  ostringstream os;
  os << f.rdbuf();
  string s = os.str();
  dout(10) << __func__ << " dump file size probed by string s = " << s.size() << dendl;
  bufferlist b;
  b.append(s);
  bufferlist::iterator bl = b.begin();
  dout(10) << __func__ << " dump file size probed by bl = " << b.length() << dendl;
  uint32_t n;
  decode(n, bl);
  dout(0) << __func__ << " seg_map usable segs number: " << n << dendl;
  while (n--)
  {
    uint32_t seg_lid;
    decode(seg_lid, bl);
    decode(seg_map[seg_lid].id ,bl);
    decode(seg_map[seg_lid].off, bl);
    seg_map[seg_lid].status = Segment::Usable;
  }
  dout(0) << __func__ << " recovery End " << dendl;
}

//FileBackEnd
FileSegmentBackEnd::FileSegmentBackEnd(CephContext *cct, std::string path) {
  this->cct = cct;
  this->seg_map = (new Segment [nr_user_total + nr_reserved]);
  if( ( direct_fd = ::open(path.c_str(),O_RDWR | O_DIRECT) ) < 0 ){
    ceph_assert(nullptr =="File open error");
  }
  if (::access(core.c_str(), F_OK) != 0){
    dout(0) << __func__ << " ...mkfs..." << dendl;
    ceph_assert(nr_reserved < 30);
    //If the core file doesn't exist , initialize seg_map
    mock_seg_id = 30 - nr_reserved;
    //Erase all segs
    for(uint32_t i = 0 ; i < nr_reserved + nr_pre_create ; ++i){
      seg_map[i].id = mock_seg_id++;
      seg_erase(i);
      seg_map[i].off = 0;
      seg_map[i].status= Segment::Usable;
    }
    return;
  }
  //Else Replay core file
  core_back();
}

FileSegmentBackEnd::~FileSegmentBackEnd() {
  //
  ::close(direct_fd);
  //
  core_dump();
}

int FileSegmentBackEnd::seg_erase(uint32_t seg_id) {
  dout(0) << __func__ << " logical_id=" << seg_id << " physical_id=" << seg_map[seg_id].id << dendl;
  std::this_thread::sleep_for(chrono::operator""ms(1));
  return 0;
}

int FileSegmentBackEnd::seg_noop(io_u *io) {
  (void)io;
  return 0;
}

int FileSegmentBackEnd::seg_read(io_u *io) {
  auto seg = &seg_map[io->obj_id];
  io->obj_id = seg->id; // logical to physical

  ceph_assert(seg->status == Segment::Usable);

  auto lba_off = static_cast<uint32_t >(io->obj_id * segmentSize + io->obj_off * 0x1000);
  auto lba_len = static_cast<uint32_t >(io->data_size * 0x1000);
  //dout(20) << __func__ << std::hex << " off=0x" << lba_off << " len=0x" << lba_len << std::dec << dendl;

  ssize_t r = ::pread(direct_fd,io->data,lba_len,lba_off);

//  bufferlist  bl;
//  bl.append_zero(lba_len);
//  bl.copy_in(0, lba_len,(char*)io->data);
//  dout(20) << __func__ << " dump length =  " << bl.length() << dendl;
//  dout(20) << __func__ << " dump buffer content = ";
//  bl.hexdump(*_dout);
//  *_dout << dendl;
//
//  ofstream of("/tmp/seg_read.last",ios::binary);
//  bl.hexdump(of);

  ceph_assert( r == lba_len );
  return 0;
}

int FileSegmentBackEnd::seg_write(io_u *io) {
  auto seg = &seg_map[io->obj_id];
  io->obj_id = seg->id;
  ceph_assert(seg->status == Segment::Usable);
  auto lba_off = (uint64_t)(io->obj_id * segmentSize + io->obj_off * 0x1000);
  auto lba_len = (uint64_t)(io->data_size * 0x1000);
  /*if(seg->off != io->obj_off * 0x1000)
  {
    dout(0) << __func__ << std::hex << " seg->off=0x" << seg->off << " (io->obj_off*0x1000)=" << io->obj_off * 0x1000 << dendl;
    ceph_assert(seg->off == io->obj_off * 0x1000);
  }*/
  //dout(20) << __func__ << std::hex << " off=0x" << lba_off << " len=0x" << lba_len << std::dec << dendl;
  ssize_t r = ::pwrite(direct_fd,io->data,lba_len,(uint64_t)lba_off);
  ceph_assert( r == lba_len );
  seg->off += lba_len;

  //Don't forget
  delete (char*)(io->data);

//  bufferlist  bl;
//  bl.append_zero(lba_len);
//  bl.copy_in(0, lba_len,(char*)io->data);
//  dout(20) << __func__ << " dump length =  " << bl.length() << dendl;
//  dout(20) << __func__ << " dump buffer content = ";
//  bl.hexdump(*_dout);
//  *_dout << dendl;
//
//  ofstream of("/tmp/seg_write.last",ios::binary);
//  bl.hexdump(of);

  return 0;
}

//OCSSD BackEnd

int OCSSDBackEnd::seg_erase(uint32_t seg_id) {

  auto p_obj_id = seg_map[seg_id].id;
  obj_delete(this->dev,p_obj_id);
  dout(0) << __func__ << " Good, logical_id=" << seg_id << " physical_id=" << seg_map[seg_id].id << " erased successfully." << dendl;
  return 0;
}

OCSSDBackEnd::OCSSDBackEnd(CephContext *cct, std::string path) {
  this->cct = cct;
  this->seg_map = (new Segment [nr_user_total + nr_reserved]);

  char buf[129] = {0};
  ::readlink(path.c_str(),buf,128);

  //Open
  this->dev = dev_open(buf);
  ceph_assert(this->dev);

  if (::access(core.c_str(), F_OK) != 0){
    dout(0) << __func__ << " ...mkfs..." << dendl;
    ceph_assert(nr_reserved < 30);
    //If the core file doesn't exist , initialize seg_map
    mock_seg_id = 30 - nr_reserved;
    //Erase all segs
    for(uint32_t i = 0 ; i < nr_reserved + nr_pre_create ; ++i){
      seg_map[i].id = mock_seg_id++;
      seg_erase(i);
      seg_map[i].off = 0;
      seg_map[i].status= Segment::Usable;
    }
    return;
  }
  //Else Replay core file
  core_back();
}

OCSSDBackEnd::~OCSSDBackEnd() {
  //
  dev_close(this->dev);
  //
  core_dump();
}

int OCSSDBackEnd::seg_noop(io_u *io) {
  (void)(io);
  return 0;
}

int OCSSDBackEnd::seg_read(io_u *io) {

  auto seg = &seg_map[io->obj_id];
  io->obj_id = seg->id;
  ceph_assert(seg->status == Segment::Usable);

  int r = obj_read(this->dev,io);
  ceph_assert( r == 0 );

  return 0;
}

int OCSSDBackEnd::seg_write(io_u *io)  {
  auto seg = &seg_map[io->obj_id];
  io->obj_id = seg->id;
  ceph_assert(seg->status == Segment::Usable);
  auto lba_len = (uint32_t)(io->data_size * 0x1000);
  ceph_assert(seg->off == io->obj_off * 0x1000);

  int r = obj_write(this->dev,io);
  ceph_assert(r == 0);

  seg->off += lba_len;

  //Don't forget
  delete (char*)(io->data);

  return 0;
}


//OCDevice
int OCDevice::open(const std::string &path) {
  this->dev_path = path;
  this->sbe = SegmentBackEnd::create("mock",cct,dev_path);
  BlockDevice::size = sbe->get_size();
  BlockDevice::block_size = 0x1000;
  segmentSize = sbe->get_seg_size();
  dout(0) << __func__ << " bdev_size: " << byte_u_t(size) <<
        " block_size: " << byte_u_t(block_size) << dendl;


  //aio_thread startup
  {
    aio_thread = std::thread([this]() { this->aio_thread_work(); });
  }

  return 0;
}

void OCDevice::close() {
  //aio_thread stop
  {
    std::unique_lock<std::mutex> l(aio_mtx);
    aio_stop = true;
    l.unlock();
    aio_cv.notify_all();
    aio_thread.join();
  }
  delete sbe;
}

int OCDevice::collect_metadata(const std::string &prefix, map<std::string, std::string> *pm) const {
  (*pm)[prefix + "rotational"] = "0";
  (*pm)[prefix + "size"] = stringify(get_size());
  (*pm)[prefix + "block_size"] = stringify(get_block_size());
  (*pm)[prefix + "driver"] = "libocssd";
  (*pm)[prefix + "type"] = "OCSSD";
  (*pm)[prefix + "access_mode"] = "libocssd";
  return 0;
}

int OCDevice::read(uint64_t off, uint64_t len, bufferlist *pbl, IOContext *ioc, bool buffered) {
  (void)buffered;
  (void)ioc;
  //dout(0) << __func__ << std::hex << "...lba_off:" << "0x" << off << "...len:0x"<<  len << ""  << std::dec<< dendl;
  bufferptr p = buffer::create(len);
  char* buf   = new char[len];
  auto  buf1  = buf;
  auto  len1  = len;
  auto  off1  = off;
  while(len1){
    io_u io;
    io.data      = buf1;
    io.obj_off   = (off1 % segmentSize) / 0x1000;
    io.obj_id    = (uint32_t)(off1 / segmentSize);
    io.data_size = 1;
    // 4K read
    sbe->seg_read(&io);
    buf1 += 0x1000;
    len1 -= 0x1000;
    off1 += 0x1000;
  }
  //memmove(p.c_str(),buf,len);
  pbl->append(p);
  pbl->copy_in(0,len,buf);
  delete []buf;

 /* aio_read(off,len,pbl,ioc);
  aio_submit(ioc);
  ioc->aio_wait();*/

  ceph_assert(ioc->num_pending == 0);
  ceph_assert(ioc->num_running == 0);

  //ofstream of("/tmp/read.last",ios::binary);
  //pbl->hexdump(of);

  return 0;
}

int OCDevice::read_random(uint64_t off, uint64_t len, char *buf, bool buffered) {
  dout(0) << __func__ << ".." << dendl;
  (void)buffered;
  bufferlist bl;
  read(off,len,&bl, nullptr,false);
  memmove(buf,bl.c_str(),len);
  return 0;
}

int OCDevice::write(uint64_t off, bufferlist &bl, bool buffered) {
  (void)buffered;
  dout(0) << __func__ << std::hex << "...off:" << "0x" << off << "...len:" << "0x" <<  bl.length() << std::dec<< dendl;
  char* buf   = bl.c_str();
  auto  len1  = bl.length();
  auto  off1  = off;
  while(len1){
    io_u io;
    io.data = buf;
    io.obj_off  = (off1 % segmentSize) / 0x1000;
    io.obj_id   = static_cast<uint32_t>(off1 / segmentSize);
    io.data_size = 1;
    // 4K append

    sbe->seg_write(&io);

    buf  += 0x1000;
    len1 -= 0x1000;
    off1 += 0x1000;
  }
  return 0;
}

int OCDevice::aio_read(uint64_t off, uint64_t len, bufferlist *pbl, IOContext *ioc) {
  //dout(0) << __func__ << std::hex << "...off:" << "0x" << off << "...len:" << "0x" <<  len << std::dec<< dendl;
  //return read(off,len,pbl,ioc,false);
  ioc->ocssd_io_type = IO_READ;
  bufferptr p = buffer::create(len);
  pbl->append(p);
  dout(10) << __func__ << std::hex << "...off:" << "0x" << off << "...len:" << "0x" <<  len << std::dec<< dendl;
  int r = _aio_rw(off,(uint32_t)len, pbl,ioc);
  //int r = read(off,len,pbl,ioc,false);
  while(!ioc->ocssd_io_queue.empty())
  {
    io_u *io = (io_u*)(ioc->ocssd_io_queue.front());
    r = sbe->seg_read(io);
    ceph_assert( r == 0 );
    delete io;
    ioc->ocssd_io_queue.pop_front();
  }
  //p.copy_in(0,len,ioc->ocssd_buf);
  //delete ioc->ocssd_buf;
  ioc->num_pending = 0;
  ioc->num_running = 0;
  return r;
}

int OCDevice::aio_write(uint64_t off, bufferlist &bl, IOContext *ioc, bool buffered) {
  //dout(0) << __func__ << std::hex << "...off:" << "0x" << off << "...len:" << "0x" <<  bl.length() << std::dec<< dendl;
  //return write(off,bl,buffered);
  (void)buffered;
  /*dout(10) << __func__ << std::hex <<
    "...off:" << "0x" << off << "...len:" << "0x" <<  bl.length() << std::dec <<
    " num_pengding=" << ioc->num_pending.load() <<
    dendl;*/
  ioc->ocssd_io_type = IO_WRITE;
  int r = _aio_rw(off,bl.length(),&bl,ioc);
  return r;
}

int OCDevice::queue_discard(interval_set<uint64_t> &p) {
  dout(0) << std::hex << __func__ << " p=" << p << " ,size :" << p.size() << dendl;
  if(!p.empty()){
    auto it = p.begin();
    auto off = it.get_start();
    ceph_assert(it.get_len() == segmentSize);
    auto lid = off / segmentSize;
    sbe->seg_erase(lid);
  }
  return 0;
}

int OCDevice::_aio_rw(uint64_t off, uint32_t len, bufferlist *pbl, IOContext *ioc) {
  //Split to 4K Segs
//  auto  off1  = off;
//  auto  len1 =

  /*while(len1){
    io_u *io     = new io_u;
    io->data     = buf;
    if(ioc->ocssd_io_type == IO_WRITE){
       io->data = new char[0x1000];
       memmove(io->data,buf,0x1000);
    }
    io->obj_off   = (off1 % segmentSize) / 0x1000;
    io->obj_id    = static_cast<uint32_t>(off1 / segmentSize);
    io->data_size = 1;
    // 4K append
    ioc->ocssd_io_queue.push_back(io);
    buf  += 0x1000;
    len1 -= 0x1000;
    off1 += 0x1000;
    count++;
  }*/
  bool one = (off / segmentSize) == ((off + len) / segmentSize ) && (len !=segmentSize);
  char *buf = nullptr , *buf2 = nullptr;
  auto  count = 0U;

  ioc->ocssd_bufferptr = pbl;
  ioc->ocssd_io_len = len;
  if(one){
    if(ioc->ocssd_io_type == IO_WRITE){
      buf = new char[len];
      pbl->copy(0, len , buf);
    }
    else
    {
      /*ioc->ocssd_buf = new char[len];
      buf = ioc->ocssd_buf;*/
      buf = pbl->c_str();
    }
    io_u *_1 = new io_u;
    _1->obj_id =  static_cast<uint32_t>( (off / segmentSize));
    _1->obj_off = static_cast<uint32_t>((off % segmentSize) / 0x1000);
    _1->data_size = len / 0x1000 ;
    _1->data = buf;
    ioc->ocssd_io_queue.push_back(_1);
    count += 1 ;
  }
  else
  {
    io_u * _1 = new io_u , *_2 = new io_u;
    _1->obj_id = static_cast<uint32_t>( (off / segmentSize));
    _2->obj_id = static_cast<uint32_t>( ( (off+len) / segmentSize));
    _1->obj_off = (off % segmentSize) / 0x1000;
    _2->obj_off = 0;
    _1->data_size = segmentSize / 0x1000 - _1->obj_off;
    _2->data_size = len / 0x1000 - _1->data_size;
    auto len1 = static_cast<uint32_t>(_1->data_size * 0x1000);
    auto len2 = static_cast<uint32_t>(_2->data_size * 0x1000);
    if(ioc->ocssd_io_type == IO_WRITE){
      buf = new char[len1];
      buf2 = new char[len2];
      pbl->copy(0,(len1),buf);
      pbl->copy((len1),(len2),buf2);
    }
    else
    {
      /*ioc->ocssd_buf = new char[len];
      buf = ioc->ocssd_buf;*/
      buf = pbl->c_str();
      buf2 = buf + len1;
    }
    _1->data = buf;
    _2->data = buf2;
    ioc->ocssd_io_queue.push_back(_1);
    ioc->ocssd_io_queue.push_back(_2);
    count += 2;
  }
  ioc->num_pending += count;
  return 0;
}

void OCDevice::_aio_thread_entry() {
  std::list<IOContext*> running_io;
  using IOFunction = int (SegmentBackEnd::*)(io_u *);
  IOFunction  ioFunction[] = {
      &SegmentBackEnd::seg_noop,
      &SegmentBackEnd::seg_read,
      &SegmentBackEnd::seg_write
  };
  const char* fname[] = {
      "NOOP",
      "READ",
      "WRITE"
  };
  auto for_each_io_u = [](IOContext *ioctx, SegmentBackEnd*sbe, IOFunction f){
      while(!ioctx->ocssd_io_queue.empty())
      {
        io_u *io = (io_u*)(ioctx->ocssd_io_queue.front());
        int r = (sbe->*f)(io);
        ceph_assert( r == 0 );
        delete io;
        ioctx->ocssd_io_queue.pop_front();
      }
  };

  //cond_variable pred
  /*auto wait_pred = [&](){
      return !pending_io.empty() ;
  };*/

  std::unique_lock<std::mutex> l(aio_mtx);
  while (!aio_stop){
    aio_cv.wait(l);
    //Swap and Unlock
    if(!pending_io.empty())
    {
      //dout(0) << __func__ << " queue depth: "  << pending_io.size() << dendl;
      running_io.swap(pending_io);
      l.unlock();
    }
    while(!running_io.empty())
    {
      IOContext *ioctx = running_io.front();
      running_io.pop_front();
      for_each_io_u(ioctx,sbe,ioFunction[ioctx->ocssd_io_type]);
      if(likely(ioctx->priv != NULL))
      {
        //for aio_write
        ioctx->num_running = 0;
        aio_callback(aio_callback_priv,ioctx->priv);
      }
      else
      {
        //for aio_read
        ioctx->num_running = 1;
        /*{
          bufferptr p = buffer::create(ioctx->ocssd_io_len);
          p.copy_in(0,ioctx->ocssd_io_len,ioctx->ocssd_buf);
          ((bufferlist*)(ioctx->ocssd_bufferptr))->append(p);
          delete ioctx->ocssd_buf;
        }*/
        ioctx->try_aio_wake();
      }
      //dout(0) << __func__ << " io_type:" << fname[(int)(ioctx->ocssd_io_type)] << " complete" << dendl;
    }
    //Relock
    l.lock();
  }
  //Stop
  l.unlock();
}

void OCDevice::aio_thread_work() {
  dout(0) << __func__ << "...Startup..." << dendl;
  _aio_thread_entry();
  dout(0) << __func__ << "...Shutdown..." << dendl;
}

void OCDevice::aio_submit(IOContext *ioc) {
  switch (ioc->ocssd_io_type){
    case(IO_NOOP):
    case(IO_READ):
    {
      dout(10) << __func__ << " read: WAITING for aio_mtx " << dendl;
      {
        std::lock_guard<std::mutex> l(aio_mtx);
        dout(10) << __func__ << " GET aio_mtx, pid=" << getpid() << " io_type = read , current queue depth= " << pending_io.size()
                << std::dec << dendl;
        pending_io.push_back(ioc);

        ioc->num_running = ioc->num_pending.load();
        ioc->num_pending = 0;

        //wake up aio_thread
        aio_cv.notify_all();

      }
      break;
    }
    case(IO_WRITE):
    {
      //Polling here
      while(ioc->ocssd_submit_seq != submitted_seq.load())
                      ;
      ++submitted_seq;
      dout(10) << __func__ << " write: WAITING for aio_mtx " << dendl;
      {
        dout(10) << __func__ << " GET aio_mtx, pid=" << getpid()
                 << " io_type = write , current queue depth= " << pending_io.size()
                 << std::dec << dendl;
        std::lock_guard<std::mutex> l(aio_mtx);
        pending_io.push_back(ioc);

        ioc->num_running = ioc->num_pending.load();
        ioc->num_pending = 0;

        //wake up aio_thread
        aio_cv.notify_all();
      }
      break;
    }
    default:
      break;
  }

}

uint32_t OCDevice::get_submit_seq(IOContext * ioc){
  auto id = pre_alloc_seq.load();
  ++pre_alloc_seq;
  return id;
}


////// THIS function is called by Bluestore::_open_alloc
////// Allocator will compare FreeList and WrittenList to know what extents are invalid
////void OCDevice::get_written_extents(interval_set<uint64_t> &p)
////{
////  ceph_assert(segmentManager);
////  segmentManager->get_written_segments(p);
////}
////
////uint64_t OCDevice::get_reserve_size() const
////{
////  return this->segmentManager->segment_size;
////}
////
////int OCDevice::open(const std::string &path)
////{
////  this->dev_path = path;
////  int r = 0;
////
////  segmentManager->backend = cct->_conf->bdev_ocssd_backend;
////  dout(0) << " OCDevice:" << __func__ << "backend: " << cct->_conf->bdev_ocssd_backend << dendl;
////  if (cct->_conf->bdev_ocssd_backend == "mock")
////  {
////    this->fd = ::open(path.c_str(), O_RDWR|O_DIRECT);
////    if (fd < 0)
////    {
////      r = -errno;
////      derr << __func__ << " got:" << cpp_strerror(r) << dendl;
////      return r;
////    }
////  }
////  else if (cct->_conf->bdev_ocssd_backend == "ocssd")
////  {
////    //Hard Code Path to "/dev/nvme0n1"
////    this->dev = dev_open("/dev/nvme0n1");
////    if (!this->dev)
////    {
////      return -1;
////    }
////    segmentManager->dev = this->dev;
////	dout(0) << "OCDevice:" << __func__ << "mark created obj_id to LibOCSSD" << dendl;
////    segmentManager->replay();
////  }
////  else
////  {
////    return -1;
////  }
////  BlockDevice::size = segmentManager->nr_lba_segments * segmentManager->segment_size;
////  BlockDevice::block_size = segmentManager->flash_page_size;
////  ceph_assert(block_size == cct->_conf->bdev_block_size);
////
////  return 0;
////}
////
////void OCDevice::close()
////{
////  dout(0) << " OCDevice: " << __func__ << dendl;
////  delete segmentManager;
////
////  if (fd != -1)
////    ::close(fd);
////
////  if (dev)
////    dev_close(this->dev);
////}
////int OCDevice::invalidate_cache(uint64_t off, uint64_t len)
////{
////  return 0;
////}
////int OCDevice::flush()
////{
////  return 0;
////}
////
////void OCDevice::aio_submit(IOContext *ioc)
////{
////  assert(ioc->num_pending.load() == 0 && ioc->num_running.load() == 0);
////  aio_callback(aio_callback_priv, ioc->priv);
////}
////
////int OCDevice::read(uint64_t off, uint64_t len, bufferlist *pbl,
////                   IOContext *ioc,
////                   bool buffered)
////{
////  (void)buffered;
////  (void)ioc;
////
////  bufferptr p = buffer::create_page_aligned(len);
////  char *buf = p.c_str();
////  auto l = 0UL;
////  auto off1 = off;
////  int r = 0;
////  {
////    auto [s1, s2] = segmentManager->get_segment(off, len);
////    std::vector<Segment *> sv = {s1, s2};
////    if(s1 && s2 ){
////	dout(-1) << "OCDevice:"<< __func__ << "OverLap Two Segments" << dendl;
////    }
////    for (auto s : sv)
////    {
////      if (s)
////      {
////		dout(10) << "OCDevice : " <<   __func__  << ": " << std::hex << "off:0x" << off1
////		<<  " len:0x " << len
////		<< std::dec << dendl;
////        if (segmentManager->backend == "mock")
////          l = s->read(fd, buf + l, off1 % s->size, len);
////        else if (segmentManager->backend == "ocssd")
////          l = s->read(dev, buf + l, off1 % s->size, len);
////        else
////        {
////          ceph_assert(0);
////        }
////        off1 += l;
////        len -= l;
////      }
////    }
////    ceph_assert(len == 0);
////  }
////
////  pbl->clear();
////  pbl->push_back(std::move(p));
////
////  dout(20) << __func__ << " dump length =  " << pbl->length() << dendl;
////  dout(20) << __func__ << " dump buffer content = ";
////  pbl->hexdump(*_dout);
////  *_dout << dendl;
////
////  return 0;
////}
////
////int OCDevice::read_random(uint64_t off, uint64_t len, char *buf, bool buffered)
////{
////
////  (void)buffered;
////  bufferlist bl;
////  read(off, len, &bl, nullptr, false);
////
////  memmove(buf, bl.c_str(), len);
////
////  return 0;
////}
////
////int OCDevice::aio_read(uint64_t off, uint64_t len, bufferlist *pbl, IOContext *ioc)
////{
////  dout(30) << " aio_read data from a xfs file" << dendl;
////  return read(off, len, pbl, ioc, false);
////}
////int OCDevice::write(uint64_t off, bufferlist &bl, bool buffered)
////{
////  (void)buffered;
////  bl.rebuild_page_aligned();
////  auto len = bl.length();
////  ceph_assert(len % segmentManager->flash_page_size == 0);
////  dout(10) << " OCDevice::write "
////           << " buffer is contiguous :" << bl.is_contiguous() << dendl;
////
////  if (bl.is_contiguous())
////    dout(10) << " OCDevice::write "
////             << "Good , the data buffer is contiguous, no copy " << dendl;
////  else
////    dout(10) << " OCDevice::write "
////             << "Bad , the data buffer is contiguous, copy triggered" << dendl;
////
////  dout(20) << __func__ << " dump length =  " << bl.length() << dendl;
////  dout(20) << __func__ << " dump buffer content = ";
////  bl.hexdump(*_dout);
////  *_dout << dendl;
////
////  const char *data = bl.c_str();
////  auto [s1, s2] = segmentManager->get_segment(off, len);
////
////  if (s2 == nullptr)
////  {
////    dout(10) << " OCDevice::write "
////             << "I'm now tring to append data to ONE superblock"
////             << " obj_physical_id = " << std::hex << s1->nvm_obj_id << " obj_logical_id = " << s1->bdev_lba_offset / (s1->size)  << " obj_bdev_lba_off = " << s1->bdev_lba_offset << " obj_nvm_off = " << s1->nvm_obj_off << " blue_offset = " << (off) << " data length  = " << bl.length() << std::dec
////             << dendl;
////    dout(10) << std::hex << " off % s1->size = 0x" << off % s1->size << " s1->nvm_obj_off = 0x" << s1->nvm_obj_off
////             << std::dec
////             << dendl;
////    ceph_assert(off % s1->size == s1->nvm_obj_off);
////    if (segmentManager->backend == "mock")
////      s1->append(fd, (void *)data, len);
////    else if (segmentManager->backend == "ocssd")
////      s1->append(dev, (void *)data, len);
////    else
////    {
////      ceph_assert( 0 == "Unkown ocdevice backend");
////    }
////    //MOCK , must persist meta data of device
////    //segmentManager->_mock_coredump();
////    return 0;
////  }
////  else
////  {
////    void *data1 = (void *)data;
////    auto l1 = s1->size - s1->nvm_obj_off;
////    dout(10)  << " OCDevice::write "
////             << "I'm now tring to append data to TWO superblocks." << dendl;
////    dout(10)  << std::hex <<  " The first one: {"
////             << " obj_physical_id = " << s1->nvm_obj_id << " obj_logical_id = " << s1->bdev_lba_offset / (s1->size) << " obj_bdev_lba_off = " << s1->bdev_lba_offset << " obj_nvm_off = " << s1->nvm_obj_off << " blue_offset = " << (off) << " data length  = " << l1 << "}"
////             << std::dec << dendl;
////
////    void *data2 = (void *)(data + l1);
////    auto l2 = len - l1;
////
////    dout(10) << " The second one: {"
////             << std::hex << " obj_physical_id = " << s2->nvm_obj_id << " obj_logical_id = " << s2->bdev_lba_offset / (s2->size) << " obj_bdev_lba_off = " << s2->bdev_lba_offset << " obj_nvm_off = " << s2->nvm_obj_off << " blue_offset = " << (off + l1) << " data length  = " << l2 << "}"
////             << std::dec << dendl;
////
////    ceph_assert(s2->nvm_obj_off == 0);
////    if (segmentManager->backend == "mock")
////    {
////      s1->append(fd, data1, l1);
////      s2->append(fd, data2, l2);
////    }
////    else if (segmentManager->backend == "ocssd")
////    {
////      s1->append(dev, data1, l1);
////      s2->append(dev, data2, l2);
////    }
////    else
////    {
////      ceph_assert( 0 == "Unkown ocdevice backend");
////    }
////
////    //MOCK , must persist meta data of device
////    //segmentManager->_mock_coredump();
////    return 0;
////  }
////
////  return 0;
////}
////int OCDevice::aio_write(uint64_t off, bufferlist &bl,
////                        IOContext *ioc,
////                        bool buffered)
////{
////  dout(10) << " aio_write == write" << dendl;
////  (void)ioc;
////  (void)buffered;
////  return write(off, bl, false);
////}
////
////
////
////int OCDevice::collect_metadata(const string &prefix, map<string, string> *pm) const
////{
////  (*pm)[prefix + "rotational"] = "0";
////  (*pm)[prefix + "size"] = stringify(get_size());
////  (*pm)[prefix + "block_size"] = stringify(get_block_size());
////  (*pm)[prefix + "driver"] = "libobj";
////  (*pm)[prefix + "type"] = "OCSSD";
////  (*pm)[prefix + "access_mode"] = "libobj";
////  return 0;
////}
////
////int OCDevice::discard(uint64_t offset, uint64_t len)
////{
////
////  dout(30) << " " << __func__ << " off: " << offset << "len: " << len << dendl;
////  return 0;
////}
////
////int OCDevice::queue_discard(interval_set<uint64_t> &p)
////{
////  dout(10) << __func__ << " interval_set: " << p << dendl;
////  interval_set<uint64_t> free;
////  //segmentManager->segment_discard(p, &free);
////  if (!free.empty())
////  {
////    dout(0) << __func__ << std::hex << " GET BACK " << free << std::dec << dendl;
////    dcb(dcb_priv, &free);
////  }
////  else
////  {
////    dout(10) << __func__ << std::hex << " NO BACK " << std::dec << dendl;
////  }
////  return 0;
////}
////
////
////
////
////
//////Begin-SegMsgr
////int SegmentManager::new_nvm_obj(uint32_t *obj_id, uint32_t *obj_size)
////{
////  if (backend == "mock")
////  {
////    *obj_id = mock_obj_id.load();
////    *obj_size = segment_size;
////    ++mock_obj_id;
////    return 0;
////  }
////  else if (backend == "ocssd")
////  {
////    unsigned int id = 0, size = 0;
////    int r = obj_create(dev, &id, &size);
////    ceph_assert(r == 0);
////    ceph_assert(size == segment_size / 4096);
////    *obj_id = id;
////    *obj_size = size * 4096;
////    return 0;
////  }
////  else
////  {
////    return -1;
////  }
////}
////
////bool SegmentManager::is_fall_within_the_same_segment(uint64_t offset, uint32_t length)
////{
////  auto end = offset + length;
////  return (offset / segment_size == (end - 1) / segment_size &&
////          (length != segment_size));
////}
////
////std::string SegmentManager::dump_seg_map()
////{
////  std::stringstream s;
////  s << "<";
////  for (auto k : seg_map)
////  {
////    s << "{ seg_id = " << k.first << "," << *(k.second) << "}";
////  }
////  s << ">";
////  return s.str();
////}
////
////std::tuple<Segment *, Segment *> SegmentManager::get_segment(uint64_t offset, uint32_t length)
////{
////  SpinLock spinLock(&s);
////  uint32_t new_id = -1;
////  uint32_t obj_size;
////  if (likely(is_fall_within_the_same_segment(offset, length)))
////  {
////    uint64_t seg_id = offset / segment_size;
////    if (seg_map.count(seg_id) < 1)
////    {
////      auto bdev_lba_aligned = seg_id * segment_size;
////      new_nvm_obj(&new_id, &obj_size);
////      Segment *segment = new Segment(bdev_lba_aligned, new_id, segment_size);
////
////	    dout(0) << std::hex << "OCDevice:" << __func__ << " New seg " << *segment
////	      << std::dec << dendl;
////
////	    seg_map.insert({seg_id, segment});
////    }
////    return {seg_map[seg_id], nullptr};
////  }
////  else
////  {
////    uint64_t seg_id1 = offset / segment_size;
////    uint64_t seg_id2 = (offset + length) / (segment_size);
////    ceph_assert( seg_map.count(seg_id1) );
////    if(seg_map.count(seg_id2) < 1)
////    {
////      auto bdev_lba_aligned = seg_id2 * segment_size;
////      uint32_t new_id = -1;
////      new_nvm_obj(&new_id, &obj_size);
////      Segment *segment = new Segment(bdev_lba_aligned, new_id, segment_size);
////      seg_map[seg_id2] = segment;
////	    dout(0) << std::hex << "OCDevice:" << __func__ << " New seg " << *segment <<
////	      std::dec << dendl;
////    }
////    return {seg_map[seg_id1], seg_map[seg_id2]};
////  }
////}
////
////void SegmentManager::_segment_discard_small(uint64_t offset, uint32_t length, interval_set<uint64_t> *free)
////{
////  dout(10) << __func__ << std::hex << " bdev_lba_off: 0x" << offset << " len: 0x" << length << std::dec << dendl;
////
////  auto obj_logical_id = offset / segment_size;
////  auto obj_internal_offset = offset % segment_size;
////  auto obj_internal_lengh = length;
////
////  ceph_assert(seg_map.count(obj_logical_id) > 0);
////  auto segment = seg_map[obj_logical_id];
////
////  ceph_assert(segment_size == segment->size);
////  ceph_assert(obj_internal_offset == (offset - segment->bdev_lba_offset));
////
////  segment->discard(obj_internal_offset, obj_internal_lengh);
////  if (segment->invalid_bitmap.all())
////  {
////    segment->erase();
////    free->insert(segment->bdev_lba_offset, segment->size);
////    delete segment;
////    seg_map.erase(obj_logical_id);
////  }
////}
////
////void SegmentManager::_segment_discard_big(uint64_t offset, uint32_t length, interval_set<uint64_t> *free)
////{
////  dout(10) << __func__ << std::hex << " bdev_lba_off: 0x" << offset << " len: 0x" << length << std::dec << dendl;
////
////  auto sid_bg = offset / segment_size;
////  auto sid_end = (offset + length) / (segment_size);
////  ceph_assert(offset % segment_size == 0);
////  ceph_assert(length % segment_size == 0);
////  for (auto sid = sid_bg; sid != sid_end; ++sid)
////  {
////    if (seg_map.count(sid) < 1)
////    {
////      continue;
////    }
////    ceph_assert(seg_map[sid]->size == segment_size);
////    seg_map[sid]->discard(0, segment_size);
////    ceph_assert(seg_map[sid]->invalid_bitmap.all());
////    auto segment = seg_map[sid];
////    {
////      free->insert(segment->bdev_lba_offset, segment->size);
////      delete segment;
////      seg_map.erase(sid);
////    }
////  }
////}
////
////void SegmentManager::_segment_discard(uint64_t offset, uint32_t length, interval_set<uint64_t> *free)
////{
////  if (likely(is_fall_within_the_same_segment(offset, length)))
////  {
////    _segment_discard_small(offset, length, free);
////  }
////  // overlap more than one  segs
////  else
////  {
////    uint64_t end = offset + length;
////    uint64_t head_offset, head_length;
////    uint64_t middle_offset, middle_length;
////    uint64_t tail_offset, tail_length;
////
////    head_offset = offset;
////    if(head_offset % segment_size == 0 )
////	head_length = 0;
////    else
////	head_length = segment_size - (head_offset) % segment_size;
////
////    tail_offset = (end / segment_size) * segment_size;
////    tail_length = (end - tail_offset);
////
////    middle_offset = head_offset + head_length;
////    middle_length = length - head_length - tail_length;
////
////    if (head_length)
////    {
////      _segment_discard_small(head_offset, head_length, free);
////    }
////    if (middle_length)
////    {
////      _segment_discard_big(middle_offset, middle_length, free);
////    }
////    if (tail_length)
////    {
////      _segment_discard_small(tail_offset, tail_length, free);
////    }
////  }
////}
////
////void SegmentManager::segment_discard(interval_set<uint64_t> &p, interval_set<uint64_t> *free)
////{
////  SpinLock spinLock(&s);
////  for (auto it = p.begin(); it != p.end(); it++)
////  {
////    _segment_discard(it.get_start(), it.get_len(), free);
////  }
////}
////
////SegmentManager::SegmentManager()
////{
////  _mock_coreback();
////}
////
////SegmentManager::~SegmentManager()
////{
////  dout(0) << " generate ocssd core dump file.. " << dendl;
////  _mock_coredump();
////  for (auto item : seg_map)
////  {
////    delete item.second;
////  }
////}
////
////void SegmentManager::_mock_coredump()
////{
////#ifdef MOCK_TEST
////  SpinLock spinLock(&s);
////  dout(10) << __func__ << " dump meta " << dendl;
////  bufferlist bl;
////  dout(0) << __func__ << " seg_map size = " << seg_map.size() << " seg_map= " << this->dump_seg_map() << " sizeof(seg_map size) = " << sizeof(seg_map.size()) << dendl;
////  encode(mock_obj_id.load(),bl);
////  encode(seg_map.size(), bl);
////  for (auto k : seg_map)
////  {
////    auto s = k.second;
////    encode(s->bdev_lba_offset, bl);
////    encode(s->nvm_obj_id, bl);
////    encode(s->nvm_obj_off, bl);
////    encode(s->size, bl);
////  }
////
////  ofstream f(corefile, ios::binary);
////  bl.write_stream(f);
////  f.close();
////
////  dout(20) << __func__ << " dump length =  " << bl.length() << dendl;
////  dout(20) << __func__ << " dump buffer content = ";
////  bl.hexdump(*_dout);
////  *_dout << dendl;
////
////#endif
////}
////
////void SegmentManager::replay()
////{
////  SpinLock spinLock(&s);
////	int count = 0 ;
////	for ( auto k : seg_map ) {
////		auto id = (k.second)->nvm_obj_id;
////		dout(0) << "OCDevice:" <<__func__ << "  mark " << id << " to used " << dendl;
////		mark_created(id);
////		count++;
////	}
////	if(count == 0 )
////		dout(0) << "OCDevice:" << __func__ << " Nothing to mark " << dendl;
////}
////
////void SegmentManager::_mock_coreback()
//{
//#ifdef MOCK_TEST
//  if (::access(corefile.c_str(), F_OK) != 0)
//    return;
//
//  dout(0) << __func__ << " recovery " << dendl;
//  SpinLock spinLock(&s);
//  ifstream f(corefile, ios::binary);
//  ostringstream os;
//  os << f.rdbuf();
//  string s = os.str();
//  f.close();
//  dout(10) << __func__ << " dump file size probed by string s = " << s.size() << dendl;
//  if (s.size() == 0)
//  {
//    ceph_assert(false);
//  }
//  bufferlist b;
//  b.append(s);
//  bufferlist::iterator bl = b.begin();
//
//  dout(10) << __func__ << " dump file size probed by bl = " << b.length() << dendl;
//  uint32_t last_id;
//  decltype(seg_map.size()) n;
//
//  decode(last_id,bl);
//  decode(n, bl);
//  dout(0) << __func__ << " map size: " << n << dendl;
//
//  Segment zom(0, 0, 0);
//  decltype(zom.size) size;
//  decltype(zom.bdev_lba_offset) bloff;
//  decltype(zom.nvm_obj_id) obj_id;
//  decltype(zom.nvm_obj_off) obj_off;
//
//  mock_obj_id = last_id;
//
//  while (n--)
//  {
//    decode(bloff, bl);
//    decode(obj_id, bl);
//    decode(obj_off, bl);
//    decode(size, bl);
//    auto idx = bloff / segment_size;
//    dout(0) << __func__ << " prepare to recovery: " << obj_id << dendl;
//    seg_map[idx] = new Segment(bloff, obj_id, size);
//    seg_map[idx]->nvm_obj_off = obj_off;
//  }
//  dout(0) << __func__ << " existed obj " << this->dump_seg_map() << dendl;
//
//
//#endif
//}

