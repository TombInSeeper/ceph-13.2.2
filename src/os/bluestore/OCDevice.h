//
// Created by wuyue on 12/26/18.
//

#ifndef CEPH_OS_BLUESTORE_OCDEVICE_H
#define CEPH_OS_BLUESTORE_OCDEVICE_H

#include "include/interval_set.h"
#include "common/debug.h"
#include "common/errno.h"
#include "include/assert.h"
#include "BlockDevice.h"

#include <map>
#include <bitset>
#include <fstream>

#define dout_context g_ceph_context
#define dout_subsys ceph_subsys_bdev

class SegmentManager;
class Segment{
    enum MODE{
      FILE = 0x0,
      LIBOBJSSD = 0x1
    };
private:
    int mode = FILE;
public:

    uint64_t  bdev_lba_offset;    //bdev_lba_offset / segmentsize = obj_logical_id
    uint32_t  nvm_obj_id;         //nvm_obj_id , get by obj_create = obj_physical_id
    uint32_t  nvm_obj_off = 0;    //
    uint32_t  size;

    std::bitset< 512 * 128 > invalid_bitmap;

    Segment(uint64_t bdev_lba_offset, uint32_t nvm_obj_id , uint32_t _size) : bdev_lba_offset(bdev_lba_offset),
                                                                      nvm_obj_id(nvm_obj_id),size(_size)
    {


    }

    uint64_t append(int fd , void *buf , uint32_t len)
    {
      dout(10) << " segment append length: " << len << dendl;
      auto l = pwrite(fd, buf,len, bdev_lba_offset + nvm_obj_off );

      ceph_assert(l >= 0);
      ceph_assert(l == len);

      nvm_obj_off += l;
      return len;
    }

    uint64_t read(int fd , void *buf , uint32_t off ,uint32_t len )
    {

      dout(10) << " segment read off: " << off
              << " length: " << len << dendl;

      if(off + len > size)
        len = size - off;

      uint64_t l = 0;
      if ( mode == FILE)
        l = pread(fd, buf, len, bdev_lba_offset + off );
      else
      {

      }
      ceph_assert(l == len);

      return len;
    }

    ///////////////TOOL FUNCTIONS//////////////////////////////////
    friend ostream& operator << (ostream& o , const Segment& seg){
      o << "[" << " bdev_lba_offset= " << (seg.bdev_lba_offset / (1024*1024)) << "MiB"
               << " nvm_obj_id= "  << seg.nvm_obj_id
               << " nvm_obj_off= " << seg.nvm_obj_off
               << " size="  << (seg.size/(1024*1024)) << "MiB" << " ]";
      return o;
    }


};

class SegmentManager{

private:
    std::mutex seg_map_lock;
    std::map<uint64_t,Segment*> seg_map; // offset / seg_size = seg_id; mapping seg_id => Seg


    atomic_uint32_t mock_obj_id = {1};

    std::string corefile = "/tmp/ocssd.core";

    void _mock_coredump(){
      dout(0) << __func__ << " dump meta " << dendl;
      bufferlist bl;


      dout(0) << " ----------CURRENT OCDEVICE STATUS ---- " <<
          " last_id = " << mock_obj_id.load() <<
          " seg_map size = " << seg_map.size() <<
          " sizeof(seg_map size) = " << sizeof(seg_map.size()) <<
          dendl;


      encode(mock_obj_id.load(), bl);
      encode(seg_map.size(),bl);
      for(auto k : seg_map)
      {
        encode(k.second->nvm_obj_id,bl);
        encode(k.second->nvm_obj_off,bl);
        encode(k.second->bdev_lba_offset,bl);
        encode(k.second->size,bl);
      }
      ofstream f(corefile,ios::binary);

      f.write(bl.c_str(),bl.length());

      f.close();

      dout(0) << __func__ << " dump length =  " << bl.length() <<
        dendl;
      dout(0) << __func__ << " dump buffer content = ";
      bl.hexdump(*_dout);
      *_dout << dendl;

    };
    void _mock_coreback()
    {
      if(::access(corefile.c_str(),F_OK) != 0)
        return;

      dout(0) << __func__ << " recovery " << dendl;

      ifstream f(corefile,ios::binary);

      string s;
      f >> s;
      f.close();
      dout(0) << __func__ << " dump file size probed by string s = " << s.size() << dendl;
      if(s.size() == 0){
        ceph_assert(false);
      }
      bufferlist b;
      b.append(s);
      bufferlist::iterator bl = b.begin();

      dout(0) << __func__ << " dump file size probed by bl = " << b.length() << dendl;


      uint32_t last_id ;
      decltype(seg_map.size()) n;


      decode(last_id,  bl);
      dout(0) << __func__ << " last id " << last_id << dendl;
      decode(n,bl);
      dout(0) << __func__ << " map size" << n << dendl;


      Segment zom(0,0,0);
      decltype(zom.size) size;
      decltype(zom.bdev_lba_offset) bloff;
      decltype(zom.nvm_obj_id) obj_id;
      decltype(zom.nvm_obj_off) obj_off;


      mock_obj_id = last_id;

      while(n--)
      {
        decode(obj_id,bl);
        decode(obj_off,bl);
        decode(bloff,bl);
        decode(size,bl);

        auto idx = bloff / segment_size;
        seg_map[idx] = new Segment(bloff,obj_id,size);
        seg_map[idx] ->nvm_obj_off = obj_off;
      }

      dout(0) << __func__ << " existed obj " << this->dump_seg_map() << dendl;

    }

public:
    uint64_t flash_page_size        =  4096;               //4KiB
    uint64_t chunk_size             =  128 * 4096;         //512KiB
    uint32_t segment_size           =  512 * (128 * 4096); //256MiB
    uint64_t nr_reserved_segments   =  1;
    uint64_t nr_lba_segments        =  (10 -1);


    uint64_t new_nvm_obj(){
        uint32_t r = mock_obj_id.load();
        ++mock_obj_id;
        return r;
    }

    bool is_fall_within_the_same_segment(uint64_t offset,uint32_t length){
      auto end = offset + length;
      return (offset / segment_size == (end - 1) / segment_size &&
              (length != segment_size));
    }


    std::string dump_seg_map(){
      std::stringstream s;
      s << "<";
      for(auto k : seg_map){
        s << "{ seg_id = " << k.first << "," << *(k.second) << "}";
      }
      s << ">";
      return s.str();
    }

    std::tuple<Segment*,Segment*>
        get_segment(uint64_t offset, uint32_t length)
    {
        std::lock_guard<std::mutex> l(seg_map_lock);
        if(( is_fall_within_the_same_segment(offset,length)) )
        {
          uint64_t seg_id = offset / segment_size;
          if (seg_map.count(seg_id) < 1)
          {
            auto bdev_lba_aligned = p2align(offset,segment_size);

            auto new_id = new_nvm_obj();

            Segment* segment = new Segment(bdev_lba_aligned,new_id,segment_size);
            dout(10) << __func__ << " NewSegment " <<
                    " pid = " << getpid() <<
                    " segment size = " << segment->size / ( 1024 *1024 ) << " MiB " <<
                    " segmentManager ptr = " << this <<
                    " seg_id = "          << seg_id <<
                    " obj_physical_id = " << new_id <<
                    " segment ptr = " << segment <<
                    " current seg_map.size() = " << seg_map.size() <<
                    " current seg_map = " << dump_seg_map() <<
                    dendl;

            seg_map.insert({seg_id,segment});
          }
          return { seg_map[seg_id] , nullptr };
        }
        else
        {
            uint64_t seg_id1 = offset / segment_size;
            uint64_t seg_id2 = (offset + length) / (segment_size);

            ceph_assert(seg_map.count(seg_id1) && !seg_map.count(seg_id2));

            {
              auto bdev_lba_aligned = p2align((offset+length),segment_size);
              Segment* segment = new Segment(bdev_lba_aligned,new_nvm_obj(),segment_size);
              seg_map[seg_id2] = segment;
            }

            return { seg_map[seg_id1],seg_map[seg_id2] };
        }
    }

    SegmentManager(){
      _mock_coreback();
    }

    ~SegmentManager(){
        dout(0) << " generate ocssd core dump file.. "<< dendl;
        _mock_coredump();
        for(auto item : seg_map){
            delete item.second;
        }
    }

};























class OCDevice : public BlockDevice {
    // aio_callack parameters:
    // @1 : aio_callback_priv = Bluestore*
    // @2 : ioc->priv = AioContext*
    // discard_callback_parameters:
    // @1 : priv  = Bluestore*
    // @2 : priv2 = interval_set<uint64_t>*
public:
    OCDevice(CephContext* cct, aio_callback_t cb, void *cbpriv, aio_callback_t d_cb, void *d_cbpriv):
    BlockDevice(cct,cb,cbpriv),
    dcb(d_cb),
    dcb_priv(d_cbpriv)
    {
      BlockDevice::rotational = false;
    }
private:
    std::string     dev_path; //sys link to
    int             fd;       //ocssd device fd
    aio_callback_t  dcb;
    void*           dcb_priv; //first parameter of dcb;

    SegmentManager *segmentManager;

public:
    void aio_submit(IOContext *ioc) override;

    int collect_metadata(const std::string& prefix, map<std::string,std::string> *pm) const override;

    int read(uint64_t off, uint64_t len, bufferlist *pbl,
             IOContext *ioc,
             bool buffered) override;
    int aio_read(uint64_t off, uint64_t len, bufferlist *pbl,
                 IOContext *ioc) override;

    int read_random(uint64_t off, uint64_t len, char *buf, bool buffered) override;
    int write(uint64_t off, bufferlist& bl, bool buffered) override;
    int aio_write(uint64_t off, bufferlist& bl,
                  IOContext *ioc,
                  bool buffered) override;
    int flush() override;

    // for managing buffered readers/writers
    int invalidate_cache(uint64_t off, uint64_t len) override;
    int open(const std::string &path) override;
    void close() override;

    int discard(uint64_t offset,uint64_t len) override;

    uint64_t  get_reserve_size() const override;

    virtual bool supported_bdev_label() override { return false; }

};




#endif //CEPH_OS_BLUESTORE_OCDEVICE_H
