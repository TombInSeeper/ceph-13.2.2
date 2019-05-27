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
#include <x86intrin.h>

extern "C" {
  #include "libocssd/objssd-nvme.h"
};


#include "OCDevice.h"


#undef dout_context
#define dout_context g_ceph_context
#define dout_subsys ceph_subsys_bdev
#undef dout_prefix
#define dout_prefix *_dout << "OCDevice "

//const static uint64_t OC_OFF = 0x1000 * 24 * 2  ;
//
//namespace TMP {
//
//typedef unsigned int UINT32;
//#define OC_WCACHE_TABLE_DEPTH_SHIFT (12)
//#define OC_WCACHE_TABLE_DEPTH (1 << OC_WCACHE_TABLE_DEPTH_SHIFT)
//#define OC_WCACHE_INDEX_MASK (OC_WCACHE_TABLE_DEPTH - 1)
//
//    typedef union {
//        UINT32 all;
//        struct {
//            UINT32 fragment : 2;
//            UINT32 plane : 1;
//            UINT32 pg_in_wl : 2;
//            UINT32 ch : 3;
//            UINT32 ce : 3;
//            UINT32 lun : 1;
//            UINT32 page : 8;
//            UINT32 block : 11;
//        } fields;
//    } PPA;
//
//    typedef union {
//        UINT32 all;
//        struct {
//            UINT32 sector : //fragment
//                2;
//            UINT32 page : //page + pg_in_wl
//                10;
//            UINT32 block : //block
//                11;
//            UINT32 plane : //plane
//                1;
//            UINT32 lun : //lun + ce
//                4;
//            UINT32 ch : //ch
//                3;
//        } fields;
//    } OC_PPA;
//
//
//    UINT32 dtu_ocwc_get_hash_value(PPA ppa) {
//      UINT32 hash = 0;
//      hash = (ppa.all >> 7) ^ ppa.all;
//      hash = hash & OC_WCACHE_INDEX_MASK;
//      return hash;
//    }
//
//
//    PPA OC_OCPPA2PPA(OC_PPA oc_ppa, int is_slc) {
//      //OC_PPA oc_ppa;
//      PPA ppa;
//      UINT32 pg_per_wl = 3;
//      ppa.fields.ch = oc_ppa.fields.ch;
//      ppa.fields.lun = oc_ppa.fields.lun / 2;
//      ppa.fields.ce = oc_ppa.fields.lun % 2;
//      ppa.fields.plane = oc_ppa.fields.plane;
//      ppa.fields.block = oc_ppa.fields.block;
//      ppa.fields.pg_in_wl = oc_ppa.fields.page % pg_per_wl;
//      ppa.fields.page = oc_ppa.fields.page / pg_per_wl;
//      ppa.fields.fragment = oc_ppa.fields.sector;
//      return ppa;
//    }
//
//
//    void addr_print(const char* prefix, struct nvm_addr* addrs , int n)
//    {
//      char buf[1024] = {0};
//
//      PPA *ppa =  (PPA*) malloc(sizeof(PPA) * n);
//      OC_PPA *oc_ppa = (OC_PPA*) malloc(sizeof(OC_PPA) *n);
//      UINT32 *hash = (UINT32 *) malloc(sizeof(UINT32) *n);
//
//      /***
//       *
//       *struct
//        {
//            UINT32 fragment : 2;
//            UINT32 plane : 1;
//            UINT32 pg_in_wl : 2;
//            UINT32 ch : 3;
//            UINT32 ce : 3;
//            UINT32 lun : 1;
//            UINT32 page : 8;
//            UINT32 block : 11;
//        } fields;
//       *
//       *
//       */
//
//      for(int i = 0 ; i < n ;++i){
//        //GET 32-BIT OC_PPA
//        oc_ppa[i].fields.ch = addrs[i].g.ch;
//        oc_ppa[i].fields.lun = addrs[i].g.lun;
//        oc_ppa[i].fields.plane = addrs[i].g.pl;
//        oc_ppa[i].fields.block = addrs[i].g.blk;
//        oc_ppa[i].fields.page = addrs[i].g.pg;
//        oc_ppa[i].fields.sector = addrs[i].g.sec;
//        //GET LOW-LEVEL PPA
//        ppa[i] = OC_OCPPA2PPA(oc_ppa[i],0);
//        //GET HASH VALUE
//        hash[i] = dtu_ocwc_get_hash_value( ppa[i] );
//
//
//        std::sprintf( buf ,
//                      "ch:%u,ce:%u,lun:%u,blk:%u,plane:%u,page:%u,wl:%u,sec:%u,ppa:0x%x,hash:%u\n",
//                      ppa[i].fields.ch,
//                      ppa[i].fields.ce,
//                      ppa[i].fields.lun,
//                      ppa[i].fields.block,
//                      ppa[i].fields.plane,
//                      ppa[i].fields.page,
//                      ppa[i].fields.pg_in_wl,
//                      ppa[i].fields.fragment,
//                      ppa[i].all,
//                      hash[i]
//        );
//        dout(0) << "OC_ADDR_PRINT:" << prefix << " " <<  buf << dendl;
//
//      }
//
//      free(hash);
//      free(oc_ppa);
//      free(ppa);
//    }
//
//}



static std::atomic_uint64_t read_seq = {0};
static std::atomic_uint64_t write_seq = {0};

void OCDevice::_aio_start()
{
  dout(1) << __func__ << "..doing.." << dendl;
  aio_stop = false;
  aio_thread.init();
  dout(1) << __func__ << "..done.." << dendl;
}

void OCDevice::_aio_stop()
{
  dout(1) << __func__ << "..doing.." << dendl;
  {
    std::lock_guard< std::mutex> l(aio_submit_mtx);
    aio_stop = true;
    aio_cv.notify_all();
  }
  aio_thread.shutdown();
  dout(1) << __func__ << "..done.." << dendl;
}

int OCDevice::open(const std::string &path)
{
  (void)(path);
  dout(1) << __func__ << "..doing.." << dendl;
  fd = ::open("/tmp/sdb",O_DIRECT| O_RDWR);

  if(cct->_conf->bdev_ocssd_backend == "ocssd") {
  	  ocssd = ocssd_open("/dev/nvme0n1");
  }
  else
  {
      ocssd = (struct ocssd_t* )malloc(sizeof( struct ocssd_t));
	    ifstream fp("/tmp/ceph_core", ios::in | ios::binary);
	    fp.read((char*)(&ocssd->pm_data),sizeof(ocssd->pm_data));
  }


  //BlockDevice
  BlockDevice::block_size = 4096;
  BlockDevice::size = ocssd->pm_data.nr_sblks * (OCSSD_SEG_SIZE);
  BlockDevice::rotational = false;


  // aio_start
  _aio_start();

  dout(1) << __func__ << "..done.. segs_num:" << ocssd->pm_data.nr_sblks << "" << dendl;


  return 0;
}

void OCDevice::close() {


  dout(1) << __func__ << "..doing.." << dendl;

  // aio stop
  _aio_stop();

  
  if(cct->_conf->bdev_ocssd_backend == "ocssd") {
  	// write_back pm_data
    	ocssd_close(ocssd);
  }
  else
  {
	      ofstream fp("/tmp/ceph_core",ios::out | ios::binary);
        fp.write((char*)(&ocssd->pm_data),sizeof(ocssd->pm_data));
        free(ocssd);
  } 

  ::close(fd);

  dout(1) << __func__ << "..done.." << dendl;

}

uint32_t OCDevice::get_submit_seq(IOContext * ioc){
  auto id = pre_alloc_seq.load();
  ++pre_alloc_seq;
  return id;
}

void OCDevice::init_disk() {
  if(cct->_conf->bdev_ocssd_backend == "ocssd") {
    dout(1) << __func__ << "..doing..reset device..."<< dendl;
    ocssd_reset(ocssd);
    BlockDevice::size = ocssd->pm_data.nr_sblks * (OCSSD_SEG_SIZE);
  }
  else
  {
      memset(&ocssd->pm_data,0,sizeof(ocssd->pm_data));
      ocssd->pm_data.nr_sblks = 100;
      for(int i = 0 ; i < 100; ++i ) {
        ocssd->pm_data.sblk_map[i] = i;
        ocssd->pm_data.sblk_ofst[i].fin_ofst = 0;
      }
    	BlockDevice::size = ocssd->pm_data.nr_sblks * (OCSSD_SEG_SIZE);
	    ofstream fp("/tmp/ceph_core",ios::out | ios::binary);
	    fp.write((char*)(&ocssd->pm_data),sizeof(ocssd->pm_data));
  }
  dout(1) << __func__ << "..done.."  << dendl;
}

int OCDevice::aio_read(uint64_t off, uint64_t len, bufferlist *pbl, IOContext *ioc) {

  ceph_assert( len <= (OCSSD_MAX_IO_SIZE));
  ceph_assert( len % 4096 == 0);
  ceph_assert( off % 4096 == 0);


  dout(10) << __func__ << "..doing.." << dendl;
  uint64_t nr_align = len / (OCSSD_MAX_IO_SIZE);
  uint64_t nr_unalign = len % (OCSSD_MAX_IO_SIZE);
  uint64_t _off = off , _len = len;

  ocssd_aio_t new_aio;
  //ioc->ocssd_pending_aios.push_back(std::move(new_aio));


  ocssd_aio_t &aio = new_aio;
  aio.lba_off = off;
  aio.lba_len = len;
  aio.priv = ioc;
  aio.io_type = OCSSD_IO_READ;
  aio.io_depth = (uint8_t)(nr_align + (nr_unalign > 0));

  uint64_t _clen =  _len;
  bufferptr  p = buffer::create_aligned((uint32_t)_clen , 4096);

  char buf[1024];
  struct debuginfo_t dg;
  dg.debug_str = buf;

  //sync read
  if(cct->_conf->bdev_ocssd_backend == "ocssd")
  {
    aio.ocssd_ctx = ocssd_prepare_ctx(ocssd,aio.lba_off,aio.lba_len,p.c_str(), &dg ) ;
    aio.dg_str = dg.debug_str;
    dout(0) << __func__ << "," << read_seq++ << "," <<  aio.dg_str << dendl;
    ocssd_read(ocssd , (struct cmd_ctx*) aio.ocssd_ctx);

    ocssd_destory_ctx((struct cmd_ctx*)aio.ocssd_ctx);

  }
  else
  {
    ::pread(fd,p.c_str(),aio.lba_len,aio.lba_off);
  }
  pbl->append(std::move(p));
  dout(10) << __func__ << "..done.." << dendl;
  return 0;
}

int OCDevice::aio_write(uint64_t off, bufferlist &bl, IOContext *ioc, bool buffered){

  (void)buffered;
  (void)(ioc);


  dout(10) << __func__ << "..doing.." << dendl;

  auto len = bl.length();
  ceph_assert( len % 4096 == 0);
  ceph_assert( off % 4096 == 0);
  ceph_assert( len <= (OCSSD_MAX_IO_SIZE));

  uint64_t nr_align = len / (OCSSD_MAX_IO_SIZE);
  uint64_t nr_unalign = len % (OCSSD_MAX_IO_SIZE);
  uint64_t i;
  uint64_t _off = off , _len = len;

  ocssd_aio_t new_aio;
  ioc->ocssd_pending_aios.push_back(std::move(new_aio));
  ioc->num_pending++;
  ocssd_aio_t *aio = &(ioc->ocssd_pending_aios.back());

  aio->lba_off = off;
  aio->lba_len = len;
  aio->priv = ioc;
  aio->bl.claim_append(bl);
  aio->bl.rebuild_page_aligned();
  aio->io_type = OCSSD_IO_WRITE;
  aio->io_depth = (uint8_t)(nr_align + (nr_unalign > 0));


  char buf [1024];
  struct debuginfo_t dg;
  dg.debug_str = buf;

  if(cct->_conf->bdev_ocssd_backend == "ocssd") {
    aio->ocssd_ctx = ocssd_prepare_ctx(ocssd,aio->lba_off,aio->lba_len,
        aio->bl.c_str(),
        &dg);
    aio->dg_str = buf;
  }
  return 0;
}

void OCDevice::aio_submit(IOContext *ioc)
{

  dout(10) << __func__ << "..doing.." << dendl;

  if(ioc->num_pending.load() == 0)
    return;


  ioc->ocssd_running_aios.swap(ioc->ocssd_pending_aios);
  ceph_assert(ioc->ocssd_pending_aios.empty());

  int pending = ioc->num_pending.load();
  ioc->num_pending -= pending;
  ioc->num_running += pending;

  uint8_t io_type = ioc->ocssd_running_aios.front().io_type;
  ssize_t r = 0;


  switch (io_type){
    case OCSSD_IO_WRITE:
    {
      while(ioc->ocssd_submit_seq != submitted_seq.load()){
       	  dout(10) << __func__ << " blocking here as seq is not updated yet " << dendl;
	  _mm_pause();
      }
      dout(10) << __func__ << "..submitting seq=" << ioc->ocssd_submit_seq << dendl;
      std::lock_guard<mutex> l(aio_submit_mtx);
      aio_queue.push_back(ioc);
      ++submitted_seq;
      aio_cv.notify_all();
      break;
    }
    default:
    {
      derr << "unknown io-type" << dendl;
      ceph_abort();
      break;
    }
  }
  dout(10) << __func__ << "..done.." << dendl;

}

int OCDevice::read(uint64_t off, uint64_t len, bufferlist *pbl, IOContext *ioc, bool buffered)
{

   dout(10) << __func__ << std::hex <<  " off=" << off << " len=" << len << std::dec << dendl;
   int r = aio_read(off,len,pbl,ioc);
   return r;
}

int OCDevice::read_random(uint64_t off, uint64_t len, char *buf, bool buffered)
{
  derr << __func__ << "Not implmented" << dendl;
  ceph_abort();
}

int OCDevice::write(uint64_t off, bufferlist &bl, bool buffered)
{
  derr << __func__ << "Not implmented" << dendl;
  ceph_abort();
}

void OCDevice::aio_thread_work()
{
  auto pred = [&](){
      return aio_stop || !aio_queue.empty();
  };
  std::list<IOContext*> __t_queue;
  std::unique_lock<std::mutex> l(aio_submit_mtx);
  while(true)
  {

    aio_cv.wait(l,pred);
    if(aio_stop)
    {
      return;
    }
    {
      __t_queue.swap(aio_queue);
      l.unlock();
    }
    dout(10) << __func__ << " The IOContetx queue depth: " << __t_queue.size() << dendl;
    while ( !__t_queue.empty())
    {

      IOContext * ioc = __t_queue.front();
      for(auto it = ioc->ocssd_running_aios.begin()  ;
        it != ioc->ocssd_running_aios.end();
        ++it)
      {

        ocssd_aio_t *aio = &(*it);
        if(cct->_conf->bdev_ocssd_backend == "ocssd")
        {
          //dout(0) << __func__ << std::hex <<  " TRULY:LBA_off=" << aio->lba_off << " LBA_len=" << aio->lba_len << std::dec << " done.." << dendl;
          dout(0) << __func__ << "," << "[WRITE]" << write_seq++ << "," << aio->dg_str << dendl;
          ocssd_write(ocssd, (struct cmd_ctx*)aio->ocssd_ctx);
          ocssd_destory_ctx((struct cmd_ctx*)aio->ocssd_ctx);
        }
        else
        {
          dout(10) << __func__ << "  redirect write " << dendl;
          ::pwrite(fd,aio->bl.c_str(),aio->lba_len,aio->lba_off);
        }

        dout(10) << __func__ << std::hex <<  " off=" << aio->lba_off << " len=" << aio->lba_len << std::dec << " done.." << dendl;

        auto id = aio->lba_off / OCSSD_SEG_SIZE;
        auto iofst = aio->lba_off % OCSSD_SEG_SIZE + aio->lba_len;
        if(likely (iofst <= OCSSD_SEG_SIZE) )
        {
          ocssd->pm_data.sblk_ofst[id].fin_ofst += aio->lba_len;
        }
        else
        {
          ocssd->pm_data.sblk_ofst[id].fin_ofst = OCSSD_SEG_SIZE;
          ocssd->pm_data.sblk_ofst[id + 1].fin_ofst = iofst - OCSSD_SEG_SIZE;
        }
      }
      if(likely(ioc->priv != nullptr))
      {
        ioc->num_running = 0;
        aio_callback(aio_callback_priv,ioc->priv);
      }
      __t_queue.pop_front();
    }
    l.lock();
  }
}

//Garbage Collection
int OCDevice::queue_discard(interval_set<uint64_t> &p)
{
  for(auto it = p.begin() ; it != p.end() ; ++it)
  {
    ceph_assert(it.get_start() % OCSSD_SEG_SIZE == 0);
    ceph_assert(it.get_len() % OCSSD_SEG_SIZE == 0);
    uint64_t bg_id = it.get_start() / OCSSD_SEG_SIZE;
    uint64_t end_id = (it.get_start()+it.get_len()) / OCSSD_SEG_SIZE;
    uint64_t i;
    for (i= bg_id ; i < end_id ;++i)
    {
      if(cct->_conf->bdev_ocssd_backend == "ocssd")
        ocssd_erase(ocssd , i);
    }
  }
  return 0;
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

void OCDevice::get_written_extents(interval_set<uint64_t> &p) {

  int i ;
  for ( i = 0 ; i < ocssd->pm_data.nr_sblks ; ++i)
  {
    uint32_t ofst = ocssd->pm_data.sblk_ofst[i].fin_ofst;
    if(ofst)
    {
      p.insert( (uint32_t)i*OCSSD_SEG_SIZE , ofst);
    }
  }
}

