//
// Created by wuyue on 12/26/18.
//
#include "include/stringify.h"
#include "OCDevice.h"

// THIS function is called by Bluestore::_open_alloc
// Allocator will compare FreeList and WrittenList to know what extents are invalid
void OCDevice::get_written_extents(interval_set<uint64_t> &p)
{
  ceph_assert(segmentManager);
  segmentManager->get_written_segments(p);
}

uint64_t OCDevice::get_reserve_size() const
{
  return this->segmentManager->segment_size;
}

int OCDevice::open(const std::string &path)
{
  this->dev_path = path;
  int r = 0;

  segmentManager->backend = cct->_conf->bdev_ocssd_backend;
  dout(0) << " OCDevice:" << __func__ << "backend: " << cct->_conf->bdev_ocssd_backend << dendl;
  if (cct->_conf->bdev_ocssd_backend == "mock")
  {
    this->fd = ::open(path.c_str(), O_RDWR);
    if (fd < 0)
    {
      r = -errno;
      derr << __func__ << " got:" << cpp_strerror(r) << dendl;
      return r;
    }
  }
  else if (cct->_conf->bdev_ocssd_backend == "ocssd")
  {
    //Hard Code Path to "/dev/nvme0n1"
    this->dev = dev_open("/dev/nvme0n1");
    if (!this->dev)
    {
      return -1;
    }
    segmentManager->dev = this->dev;
  }
  else
  {
    return -1;
  }
  BlockDevice::size = segmentManager->nr_lba_segments * segmentManager->segment_size;
  BlockDevice::block_size = segmentManager->flash_page_size;
  ceph_assert(block_size == cct->_conf->bdev_block_size);

  return 0;
}

void OCDevice::close()
{
  dout(0) << " OCDevice: " << __func__ << dendl;
  delete segmentManager;

  if (fd != -1)
    ::close(fd);

  if (dev)
    dev_close(this->dev);
}
int OCDevice::invalidate_cache(uint64_t off, uint64_t len)
{
  return 0;
}
int OCDevice::flush()
{
  return 0;
}

void OCDevice::aio_submit(IOContext *ioc)
{
  assert(ioc->num_pending.load() == 0 && ioc->num_running.load() == 0);
  aio_callback(aio_callback_priv, ioc->priv);
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
    auto [s1, s2] = segmentManager->get_segment(off, len);
    std::vector<Segment *> sv = {s1, s2};
    if(s1 && s2 ){
	dout(-1) << "OCDevice:"<< __func__ << "OverLap Two Segments" << dendl;
    }
    for (auto s : sv)
    {
      if (s)
      {
	dout(0) << "OCDevice : " <<   __func__  << ": " << std::hex << "off:0x" << off1 
		<<  " len:0x " << len 
		<< std::dec << dendl;  
        if (segmentManager->backend == "mock")
          l = s->read(fd, buf + l, off1 % s->size, len);
        else if (segmentManager->backend == "ocssd")
          l = s->read(dev, buf + l, off1 % s->size, len);
        else
        {
          ceph_assert(0);
        }
        off1 += l;
        len -= l;
      }
    }
    ceph_assert(len == 0);
  }

  pbl->clear();
  pbl->push_back(std::move(p));

  dout(20) << __func__ << " dump length =  " << pbl->length() << dendl;
  dout(20) << __func__ << " dump buffer content = ";
  pbl->hexdump(*_dout);
  *_dout << dendl;

  return 0;
}

int OCDevice::read_random(uint64_t off, uint64_t len, char *buf, bool buffered)
{

  (void)buffered;
  bufferlist bl;
  read(off, len, &bl, nullptr, false);

  memmove(buf, bl.c_str(), len);

  return 0;
}

int OCDevice::aio_read(uint64_t off, uint64_t len, bufferlist *pbl, IOContext *ioc)
{
  dout(30) << " aio_read data from a xfs file" << dendl;
  return read(off, len, pbl, ioc, false);
}
int OCDevice::write(uint64_t off, bufferlist &bl, bool buffered)
{
  (void)buffered;

  bl.rebuild_page_aligned();
  auto len = bl.length();

  ceph_assert(len % segmentManager->flash_page_size == 0);

  dout(0) << " OCDevice::write "
           << " buffer is contiguous :" << bl.is_contiguous() << dendl;

  if (bl.is_contiguous())
    dout(10) << " OCDevice::write "
             << "Good , the data buffer is contiguous, no copy " << dendl;
  else
    dout(10) << " OCDevice::write "
             << "Bad , the data buffer is contiguous, copy triggered" << dendl;

  dout(20) << __func__ << " dump length =  " << bl.length() << dendl;
  dout(20) << __func__ << " dump buffer content = ";
  bl.hexdump(*_dout);
  *_dout << dendl;

  const char *data = bl.c_str();
  auto [s1, s2] = segmentManager->get_segment(off, len);

  if (s2 == nullptr)
  {
    dout(0) << " OCDevice::write "
             << "I'm now tring to append data to ONE superblock"
             << " obj_physical_id = " << s1->nvm_obj_id << " obj_logical_id = " << s1->bdev_lba_offset / (s1->size) << std::hex << " obj_bdev_lba_off = " << s1->bdev_lba_offset << " obj_nvm_off = " << s1->nvm_obj_off << " blue_offset = " << (off) << " data length  = " << bl.length() << std::dec
             << dendl;

    dout(0) << std::hex << " off % s1->size = 0x" << off % s1->size << " s1->nvm_obj_off = 0x" << s1->nvm_obj_off
             << std::dec
             << dendl;

    ceph_assert(off % s1->size == s1->nvm_obj_off);
    if (segmentManager->backend == "mock")
      s1->append(fd, (void *)data, len);
    else if (segmentManager->backend == "ocssd")
      s1->append(dev, (void *)data, len);
    else
    {
      dout(0) << __func__ << "Unkown ocdevice backend " << dendl;
      ceph_assert(false);
    }
    //MOCK , must persist meta data of device
    //segmentManager->_mock_coredump();
    return 0;
  }
  else
  {

    void *data1 = (void *)data;
    auto l1 = s1->size - s1->nvm_obj_off;
    dout(0)  << " OCDevice::write "
             << "I'm now tring to append data to TWO superblocks." << dendl;
    dout(0)  << std::hex <<  " The first one: {"
             << " obj_physical_id = " << s1->nvm_obj_id << " obj_logical_id = " << s1->bdev_lba_offset / (s1->size) << " obj_bdev_lba_off = " << s1->bdev_lba_offset << " obj_nvm_off = " << s1->nvm_obj_off << " blue_offset = " << (off) << " data length  = " << l1 << "}"
             << dendl;

    void *data2 = (void *)(data + l1);
    auto l2 = len - l1;

    dout(0) << " The second one: {"
             << " obj_physical_id = " << s2->nvm_obj_id << " obj_logical_id = " << s2->bdev_lba_offset / (s2->size) << " obj_bdev_lba_off = " << s2->bdev_lba_offset << " obj_nvm_off = " << s2->nvm_obj_off << " blue_offset = " << (off + l1) << " data length  = " << l2 << "}"
             << std::dec << dendl;

    ceph_assert(s2->nvm_obj_off == 0);
    if (segmentManager->backend == "mock")
    {
      s1->append(fd, data1, l1);
      s2->append(fd, data2, l2);
    }
    else if (segmentManager->backend == "ocssd")
    {

      s1->append(dev, data1, l1);
      s2->append(dev, data2, l2);
    }
    else
    {
      dout(0) << __func__ << "Unkown ocdevice backend " << dendl;
      ceph_assert(false);
    }

    //MOCK , must persist meta data of device
    //segmentManager->_mock_coredump();
    return 0;
  }

  return 0;
}
int OCDevice::aio_write(uint64_t off, bufferlist &bl,
                        IOContext *ioc,
                        bool buffered)
{
  dout(10) << " aio_write == write" << dendl;
  (void)ioc;
  (void)buffered;
  return write(off, bl, false);
}

int OCDevice::collect_metadata(const string &prefix, map<string, string> *pm) const
{
  (*pm)[prefix + "rotational"] = "0";
  (*pm)[prefix + "size"] = stringify(get_size());
  (*pm)[prefix + "block_size"] = stringify(get_block_size());
  (*pm)[prefix + "driver"] = "libobj";
  (*pm)[prefix + "type"] = "OCSSD";
  (*pm)[prefix + "access_mode"] = "libobj";
  return 0;
}

int OCDevice::discard(uint64_t offset, uint64_t len)
{

  dout(30) << " " << __func__ << " off: " << offset << "len: " << len << dendl;
  return 0;
}

int OCDevice::queue_discard(interval_set<uint64_t> &p)
{
  dout(10) << __func__ << " interval_set: " << p << dendl;
  interval_set<uint64_t> free;
  segmentManager->segment_discard(p, &free);
  if (!free.empty())
  {
    dout(1) << __func__ << std::hex << " GET BACK " << free << std::dec << dendl;
    dcb(dcb_priv, &free);
  }
  else
  {
    dout(10) << __func__ << std::hex << " NO BACK " << std::dec << dendl;
  }
  return 0;
}

int SegmentManager::new_nvm_obj(uint32_t *obj_id, uint32_t *obj_size)
{
  if (backend == "mock")
  {
    *obj_id = mock_obj_id.load();
    *obj_size = segment_size;
    ++mock_obj_id;
    return 0;
  }
  else if (backend == "ocssd")
  {
    unsigned int id = 0, size = 0;
    int r = obj_create(dev, &id, &size);
    ceph_assert(r == 0);
    ceph_assert(size == segment_size / 4096);
    *obj_id = id;
    *obj_size = size * 4096;
    return 0;
  }
  else
  {
    return -1;
  }
}

bool SegmentManager::is_fall_within_the_same_segment(uint64_t offset, uint32_t length)
{
  auto end = offset + length;
  return (offset / segment_size == (end - 1) / segment_size &&
          (length != segment_size));
}

std::string SegmentManager::dump_seg_map()
{
  std::stringstream s;
  s << "<";
  for (auto k : seg_map)
  {
    s << "{ seg_id = " << k.first << "," << *(k.second) << "}";
  }
  s << ">";
  return s.str();
}

std::tuple<Segment *, Segment *> SegmentManager::get_segment(uint64_t offset, uint32_t length)
{
  SpinLock spinLock(&s);
  uint32_t new_id = -1;
  uint32_t obj_size;
  if (likely(is_fall_within_the_same_segment(offset, length)))
  {
    uint64_t seg_id = offset / segment_size;
    if (seg_map.count(seg_id) < 1)
    {
      auto bdev_lba_aligned = (offset / segment_size) * segment_size;

      new_nvm_obj(&new_id, &obj_size);

      Segment *segment = new Segment(bdev_lba_aligned, new_id, segment_size);

	dout(0) << "OCDevice:" << __func__ << " New seg " << *segment << dendl;
      seg_map.insert({seg_id, segment});
    }
    return {seg_map[seg_id], nullptr};
  }
  else
  {
    uint64_t seg_id1 = offset / segment_size;
    uint64_t seg_id2 = (offset + length) / (segment_size);
    ceph_assert(seg_map.count(seg_id1) );
    if(seg_map.count(seg_id2) < 1)
    {
      auto bdev_lba_aligned = ( (offset + length) / segment_size ) * segment_size;
      uint32_t new_id = -1;
      new_nvm_obj(&new_id, &obj_size);
      Segment *segment = new Segment(bdev_lba_aligned, new_id, segment_size);
      seg_map[seg_id2] = segment;

	dout(0) << "OCDevice:" << __func__ << " New seg " << *segment << dendl;
	
    }
    return {seg_map[seg_id1], seg_map[seg_id2]};
  }
}

void SegmentManager::_segment_discard_small(uint64_t offset, uint32_t length, interval_set<uint64_t> *free)
{
  dout(10) << __func__ << std::hex << " bdev_lba_off: 0x" << offset << " len: 0x" << length << std::dec << dendl;

  auto obj_logical_id = offset / segment_size;
  auto obj_internal_offset = offset % segment_size;
  auto obj_internal_lengh = length;

  ceph_assert(seg_map.count(obj_logical_id) > 0);
  auto segment = seg_map[obj_logical_id];

  ceph_assert(segment_size == segment->size);
  ceph_assert(obj_internal_offset == (offset - segment->bdev_lba_offset));

  segment->discard(obj_internal_offset, obj_internal_lengh);
  if (segment->invalid_bitmap.all())
  {
    segment->erase();
    free->insert(segment->bdev_lba_offset, segment->size);
    delete segment;
    seg_map.erase(obj_logical_id);
  }
}

void SegmentManager::_segment_discard_big(uint64_t offset, uint32_t length, interval_set<uint64_t> *free)
{
  dout(10) << __func__ << std::hex << " bdev_lba_off: 0x" << offset << " len: 0x" << length << std::dec << dendl;

  auto sid_bg = offset / segment_size;
  auto sid_end = (offset + length) / (segment_size);
  ceph_assert(offset % segment_size == 0);
  ceph_assert(length % segment_size == 0);
  for (auto sid = sid_bg; sid != sid_end; ++sid)
  {
    if (seg_map.count(sid) < 1)
    {
      continue;
    }
    ceph_assert(seg_map[sid]->size == segment_size);
    seg_map[sid]->discard(0, segment_size);
    ceph_assert(seg_map[sid]->invalid_bitmap.all());
    auto segment = seg_map[sid];
    {
      free->insert(segment->bdev_lba_offset, segment->size);
      delete segment;
      seg_map.erase(sid);
    }
  }
}

void SegmentManager::_segment_discard(uint64_t offset, uint32_t length, interval_set<uint64_t> *free)
{
  if (likely(is_fall_within_the_same_segment(offset, length)))
  {
    _segment_discard_small(offset, length, free);
  }
  // overlap more than one  segs
  else
  {
    uint64_t end = offset + length;
    uint64_t head_offset, head_length;
    uint64_t middle_offset, middle_length;
    uint64_t tail_offset, tail_length;

    head_offset = offset;
    if(head_offset % segment_size == 0 )
	head_length = 0;
    else
	head_length = segment_size - (head_offset) % segment_size; 	

    tail_offset = (end / segment_size) * segment_size;
    tail_length = (end - tail_offset);

    middle_offset = head_offset + head_length;
    middle_length = length - head_length - tail_length;

    if (head_length)
    {
      _segment_discard_small(head_offset, head_length, free);
    }
    if (middle_length)
    {
      _segment_discard_big(middle_offset, middle_length, free);
    }
    if (tail_length)
    {
      _segment_discard_small(tail_offset, tail_length, free);
    }
  }
}

void SegmentManager::segment_discard(interval_set<uint64_t> &p, interval_set<uint64_t> *free)
{
  SpinLock spinLock(&s);
  for (auto it = p.begin(); it != p.end(); it++)
  {
    _segment_discard(it.get_start(), it.get_len(), free);
  }
}

SegmentManager::SegmentManager()
{
  _mock_coreback();
}

SegmentManager::~SegmentManager()
{
  dout(0) << " generate ocssd core dump file.. " << dendl;
  _mock_coredump();
  for (auto item : seg_map)
  {
    delete item.second;
  }
}

void SegmentManager::_mock_coredump()
{
#ifdef MOCK_TEST
  SpinLock spinLock(&s);
  dout(10) << __func__ << " dump meta " << dendl;
  bufferlist bl;
  dout(10) << __func__ << " seg_map size = " << seg_map.size() << " seg_map= " << this->dump_seg_map() << " sizeof(seg_map size) = " << sizeof(seg_map.size()) << dendl;
  //encode(mock)
  encode(seg_map.size(), bl);
  for (auto k : seg_map)
  {
    auto s = k.second;
    encode(s->bdev_lba_offset, bl);
    encode(s->nvm_obj_id, bl);
    encode(s->nvm_obj_off, bl);
    encode(s->size, bl);
  }

  ofstream f(corefile, ios::binary);
  bl.write_stream(f);
  f.close();

  dout(20) << __func__ << " dump length =  " << bl.length() << dendl;
  dout(20) << __func__ << " dump buffer content = ";
  bl.hexdump(*_dout);
  *_dout << dendl;

#endif
}

void SegmentManager::_mock_coreback()
{
#ifdef MOCK_TEST
  if (::access(corefile.c_str(), F_OK) != 0)
    return;

  dout(0) << __func__ << " recovery " << dendl;
  SpinLock spinLock(&s);
  ifstream f(corefile, ios::binary);
  ostringstream os;
  os << f.rdbuf();
  string s = os.str();
  f.close();
  dout(10) << __func__ << " dump file size probed by string s = " << s.size() << dendl;
  if (s.size() == 0)
  {
    ceph_assert(false);
  }
  bufferlist b;
  b.append(s);
  bufferlist::iterator bl = b.begin();

  dout(10) << __func__ << " dump file size probed by bl = " << b.length() << dendl;
  uint32_t last_id;
  decltype(seg_map.size()) n;

  decode(n, bl);
  dout(10) << __func__ << " map size: " << n << dendl;

  Segment zom(0, 0, 0);
  decltype(zom.size) size;
  decltype(zom.bdev_lba_offset) bloff;
  decltype(zom.nvm_obj_id) obj_id;
  decltype(zom.nvm_obj_off) obj_off;

  mock_obj_id = last_id;

  while (n--)
  {
    decode(bloff, bl);
    decode(obj_id, bl);
    decode(obj_off, bl);
    decode(size, bl);
    auto idx = bloff / segment_size;
    dout(10) << __func__ << " prepare to recovery: " << obj_id << dendl;
    seg_map[idx] = new Segment(bloff, obj_id, size);
    seg_map[idx]->nvm_obj_off = obj_off;
  }
  dout(10) << __func__ << " existed obj " << this->dump_seg_map() << dendl;
#endif
}
