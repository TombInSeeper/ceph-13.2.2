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


#include "OCDevice.h"
#undef dout_context
#define dout_context g_ceph_context
#define dout_subsys ceph_subsys_bdev
#undef dout_prefix
#define dout_prefix *_dout << "OCDevice "

const static uint64_t OC_OFF = 0x1000 * 24 * 2  ;


void addr_print(struct nvm_addr* addrs , int n)
{
  string s;
  char buf[4096] = {0};
  for (int i = 0 ; i < n ; ++ i)
  {
    sprintf(buf,"\t\t\nch=%lu,lun=%lu,pl=%lu,blk=%lu,pg=%lu,sec=%lu\n"
        ,addrs[i].g.ch
        ,addrs[i].g.lun
        ,addrs[i].g.pl
        ,addrs[i].g.blk
        ,addrs[i].g.pg
        ,addrs[i].g.sec);
    s += buf;
  }

  dout(10) << __func__ << " num= " << n << dendl;
  dout(10) << __func__ << s << dendl;

}


void OCDevice::_erase_sb(struct nvm_dev* dev,int blk_id)
{

  char buf[1024] = {0};

  struct nvm_addr addr;
  struct nvm_ret ret;
  memset(&addr,0,sizeof(addr));
  addr.g.blk = blk_id;
  virtual2physical(&addr);
  nvm_addr_erase_sb(dev,&addr,1,0,&ret);
  if(ret.result != 0 || ret.status != 0)
  {
    derr << "__func__" <<  dendl;
    ceph_abort();
  }

  sprintf(buf , "  erase logic id = %d , physical id = %d , done \n",blk_id,addr.g.blk);
  dout(10) << __func__ << buf << "..." << dendl;

  return;
}

void OCDevice::_init_blk_map(struct nvm_dev *dev) {
  unsigned int blk_start = 80;
  unsigned int blk_idx = 0;
  unsigned int ref_idx;
  int i, j;
  const struct nvm_geo *geo;
  blk_start += (int)(666 + getpid() % 50);
  ref_idx = blk_start;

  int max_count = 200;


  geo = nvm_dev_get_geo(dev);

  while (blk_idx < OCSSD_MAX_BLK_NUM) {
    bool is_bad = false;
    for (i = 0; i < geo->nchannels; i++) {
      for (j = 0; j < geo->nluns; j++) {
        if (g_bbt[i][j]->blks[blk_start*2] != NVM_BBT_FREE || g_bbt[i][j]->blks[blk_start*2+1] != NVM_BBT_FREE) {
          is_bad = true;
          break;
        }
      }
      if (is_bad) {
        break;
      }
    }
    if (is_bad == false) {
      // Find a good block
      g_pm_data.sblk_map[blk_idx] = blk_start;
      blk_idx++;
      if(blk_idx >= max_count)
        break;
    }
    blk_start++;
    if (blk_start >= geo->nblocks) {
      blk_start = 0;
    }
    if (blk_start == ref_idx ) {
      break;
    }
  }
  g_pm_data.sblk_map[blk_idx] = -1;
  g_pm_data.nr_sblks = max_count;

  dout(10) << __func__ << "..done..,nr_blks=" << g_pm_data.nr_sblks << dendl;
}

void OCDevice::_init_blk_ofst(struct nvm_dev *dev) {
  int i ;
  for (i = 0 ; i < g_pm_data.nr_sblks ; ++i)
    g_pm_data.sblk_ofst[i].fin_ofst = 0;
  dout(1) << __func__ << "..done.." << dendl;
}

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
  fd = ::open("/dev/sdb",O_DIRECT| O_RDWR);


  __open_ocssd();



  //BlockDevice
  BlockDevice::block_size = 4096;
  BlockDevice::size = 200 * (OCSSD_SEG_SIZE);
  BlockDevice::rotational = false;


  // aio_start
  _aio_start();

  dout(1) << __func__ << "..done.. segs_num:" << g_pm_data.nr_sblks << "" << dendl;


  return 0;
}

void OCDevice::close() {


  dout(1) << __func__ << "..doing.." << dendl;

  // aio stop
  _aio_stop();

  // write_back pm_data
  {
    struct nvm_ret ret;
    nvm_write_pm(dev,&g_pm_data,0,sizeof(g_pm_data),0u,&ret);
  }

  nvm_dev_close(dev);


  ::close(fd);

  dout(1) << __func__ << "..done.." << dendl;

}

uint32_t OCDevice::get_submit_seq(IOContext * ioc){
  auto id = pre_alloc_seq.load();
  ++pre_alloc_seq;
  return id;
}

void OCDevice::virtual2physical(struct nvm_addr *addr) {
  addr->g.blk = (g_pm_data.sblk_map[addr->g.blk]);
}

void OCDevice::init_disk() {
  int i;
  nvm_ret  ret ;
  nvm_addr addr;
  memset(&addr,0,sizeof(addr));

  dout(1) << __func__ << "..doing..reset device..."<< dendl;
  nvm_ext_reset(dev);

  _init_blk_map(dev);
  _init_blk_ofst(dev);

  //Erase all blks
  dout(1) << __func__ << "..doing..erasing nr_sblks=" << g_pm_data.nr_sblks << dendl;
  {
    for (i = 0; i < g_pm_data.nr_sblks; ++i) {
        _erase_sb(dev , i);
    }
  }
  BlockDevice::size = g_pm_data.nr_sblks * (OCSSD_SEG_SIZE);
  nvm_write_pm(dev,&g_pm_data,0,sizeof(g_pm_data),0,&ret);

  dout(1) << __func__ << "..done.."  << dendl;

}

void OCDevice::incr_virtual(const struct nvm_geo *geo, struct nvm_addr *addr) {
  uint64_t page = addr->g.pg;
  // We ensure program/read will complete a multi-plane within a lun.
  // One page is done within the first plane and then the second plane.
  // This compliance with how device auto increase address
  addr->g.sec++;
  if (addr->g.sec == geo->nsectors) {
    addr->g.sec = 0;
    addr->g.pl++;
    if (addr->g.pl == geo->nplanes) {
      addr->g.pl = 0;
      addr->g.pg++;
      if (addr->g.pg % 3 == 0) {
        addr->g.pg = page - (page % 3);
        addr->g.lun++;
        if (addr->g.lun == geo->nluns) {
          addr->g.lun = 0;
          addr->g.ch++;
          if (addr->g.ch == geo->nchannels) {
            // Return to first lun and increase page
            addr->g.ch = 0;
            addr->g.pg = page + 1;
          }
        }
      }
    }
  }
  if (addr->g.pg == geo->npages) {
    // Increase block
    addr->g.pg = 0;
    addr->g.blk++;
  }
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



  dout(10) << __func__ << std::hex <<  " off=" << off << " len=" << len << std::dec << dendl;
  {
      uint64_t _clen =  _len;
      bufferptr  p = buffer::create_aligned((uint32_t)_clen , 4096);
      pbl->append(std::move(p));
      cmd_ctx *ctx = &(aio.ctx);
      ctx->data = malloc(_clen);
      ctx->data_len = (uint32_t)_clen;
      ctx->addrs = aio.addrs;


      logical2virtual(g_geo,_off, _clen,
          &(ctx->naddrs),
           ctx->addrs);
      for(int j = 0 ; j < ctx->naddrs ; ++j)
        virtual2physical(&(ctx->addrs[j]));

      //sync read
      nvm_ret ret;
      if(cct->_conf->bdev_ocssd_backend == "ocssd" && aio.lba_off >= OCSSD_SEG_SIZE  + OC_OFF)
      {
        dout(10) << __func__ << "  truly read ocssd." << dendl;
        nvm_addr_read(dev,ctx->addrs,ctx->naddrs,ctx->data,NULL,0,&ret);
      }
      else
      {
        dout(10) << __func__ << "  redirect read" << dendl;
        ::pread(fd,aio.ctx.data,aio.lba_len,aio.lba_off);

      }


      pbl->copy_in(0,_clen,(char*)ctx->data);
      free(ctx->data);
      //std::cout << "---------------------Content we have read-----------------------------" << std::endl;

      //pbl->hexdump(cout);

      _off += _clen;
      _len -= _clen;

  }
  ceph_assert(_len == 0);
  ceph_assert(ioc->num_pending.load() == 0);
  ceph_assert(ioc->num_running.load() == 0);


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
  aio->io_type = OCSSD_IO_WRITE;
  aio->io_depth = (uint8_t)(nr_align + (nr_unalign > 0));


  //dout(10) << __func__ << "..ocssd_aio_t.io_depth=" << (int)aio.io_depth << dendl;

  //char *p = (char *)malloc(len);
  //aio->bl.copy(0,len,p);
  char *p = aio->bl.c_str();

  {
    cmd_ctx *ctx = &(aio->ctx);
    memset(ctx, 0, sizeof(cmd_ctx));
    uint64_t _clen = _len >= OCSSD_MAX_IO_SIZE ? OCSSD_MAX_IO_SIZE : _len;

    ctx->data = p;
    ctx->data_len = (uint32_t) _clen;
    ctx->addrs = aio->addrs;


    logical2virtual(g_geo, aio->lba_off, aio->lba_len, &(ctx->naddrs), ctx->addrs);
    int j;
    for (j = 0; j < ctx->naddrs; ++j)
      virtual2physical(&(ctx->addrs[j]));
  }

//    if(cct->_conf->bdev_ocssd_backend == "ocssd" && aio->lba_off >=  OCSSD_SEG_SIZE + OC_OFF )
//    {
//      if(aio->lba_off == OCSSD_SEG_SIZE + OC_OFF)
//      {
//        dout(10) << __func__ << " prefill write to ocssd  ,size = " << OC_OFF << dendl;
//        char *buf = (char *)malloc(OC_OFF);
//        struct nvm_addr addrs[32];
//        int cnt;
//        logical2virtual(g_geo,OCSSD_SEG_SIZE,OC_OFF,&cnt,addrs);
//        for(int i = 0 ; i < cnt ; ++i){
//          virtual2physical(&addrs[i]);
//        }
//        ceph_assert( cnt == OC_OFF / 4096 );
//        addr_print(addrs,cnt);
//
//        for (int i = 0 ; i < cnt / 8 ; ++i){
//          dout(10) << __func__ << " prefill write to ocssd , 32K append " << OC_OFF << dendl;
//          nvm_addr_write(dev,addrs + i * 8 , 8  ,buf + i * 0x8000 ,&meta,0,&ret);
//        }
//
//        free(buf);
//      }
//      addr_print(aio->ctx.addrs,aio->ctx.naddrs);
//      //for (int i = 0 ; i < aio->ctx.naddrs ; ++i){
//      nvm_addr_write(dev,aio->ctx.addrs ,aio->ctx.naddrs ,(char*)aio->ctx.data  ,&meta,0,&ret);
//      //}
//
//
//
//      //nvm_addr_write(dev,aio->ctx.addrs,aio->ctx.naddrs,aio->ctx.data,&meta,0,&ret);
//      /********DEBUG,write read ****/
//      if(aio->lba_len == 4 * 1024)
//      {
//        dout(10) << __func__ << "...Magic read...to ensure whether " << dendl;
//        char tmp[4096];
//        char meta[1024];
//        char* data = (char*)(aio->ctx.data);
//        nvm_addr_read(dev,aio->ctx.addrs,aio->ctx.naddrs,tmp,&meta,0,&ret);
//
//        //*--*
//        {
//          bufferlist b1,b2;
//          b1.append(tmp,4096);
//          b2.append(data,4096);
//
//          dout(5) << __func__ << "the content we read up :";
//          b1.hexdump(*_dout);
//          *_dout << dendl;
//
//          dout(5) << __func__ << "the content we write down :";
//          b2.hexdump(*_dout);
//          *_dout << dendl;
//        }
//        for(int i = 0 ; i < 4096 ; ++i)
//        {
//          //dout(10) << __func__ << " i=" << i << ",tmp[i]=" << (unsigned int)tmp[i] << ",data[i]=" << (unsigned int)data[i] << dendl;
//          ceph_assert(tmp[i] == data[i]);
//        }
//      }
//    }
//    else
//    {
//      dout(10) << __func__ << "  redirect write " << dendl;
//      ::pwrite(fd,aio->ctx.data,aio->lba_len,aio->lba_off);
//    }





  dout(0) << __func__ << std::hex <<  " off=" << off << " len=" << len << std::dec << " done.." << dendl;

//  ioc->num_running = 0;
//  ioc->num_pending = 0;


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

        ocssd_aio_t * aio = &(*it);
        nvm_ret ret;
        if(cct->_conf->bdev_ocssd_backend == "ocssd" && aio->lba_off >=  OCSSD_SEG_SIZE + OC_OFF )
        {
          if(aio->lba_off == OCSSD_SEG_SIZE + OC_OFF)
          {
            dout(10) << __func__ << " prefill write to ocssd  ,size = " << byte_u_t(OC_OFF) << dendl;
            char buf[128 * 1024] = {0};
            struct nvm_addr addrs[128];
            int cnt;
            logical2virtual(g_geo,OCSSD_SEG_SIZE,OC_OFF,&cnt,addrs);
            for(int i = 0 ; i < cnt ; ++i){
              virtual2physical(&addrs[i]);
            }
            ceph_assert( cnt == OC_OFF / 4096 );
            addr_print(addrs,cnt);

            int li = 8;
            if(aio->lba_len == 4096){
              dout(0) << __func__  << "...detect...4K rand write benchmark....." << dendl;
              li = 1;
            }
            else
            {
              dout(0) << __func__  << "...detect...128K seq write benchmark....." << dendl;
            }
            for(  int i = 0 ; i < cnt / li ; ++i ) {
              nvm_addr_write(dev,addrs + i*li , li , buf , NULL , 0 , &ret);
            }
          }
          addr_print(aio->ctx.addrs,aio->ctx.naddrs);
          nvm_addr_write(dev,aio->ctx.addrs,aio->ctx.naddrs,aio->ctx.data,NULL,0,&ret);
          dout(10) << __func__ << "  truly write to ocssd ,submit seq=" << ioc->ocssd_submit_seq << " last aio num=" << --ioc->num_running <<  dendl;


          /********DEBUG****/
          if(unlikely ( aio->lba_len == 4 * 1024 && cct->_conf->bdev_debug_write_verify ))
          {
            dout(0) << __func__ << "...Magic read...to ensure no error " << dendl;
            char* tmp =  (char*)malloc(4096);
            char* data = (char*)(aio->ctx.data);
            nvm_addr_read(dev,aio->ctx.addrs,aio->ctx.naddrs,tmp,NULL,0,&ret);

            for(int i = 0 ; i < 4096 ; ++i)
            {
              if(tmp[i] != data[i])
              {
                //Dump the content
                //*--*
                derr << "READ ERROR" << dendl;
                {
                  bufferlist b1,b2;
                  b1.append(tmp,4096);
                  b2.append(data,4096);

                  dout(0) << __func__ << "the content we read up :";
                      b1.hexdump(*_dout);
                      *_dout << dendl;

                  dout(0) << __func__ << "the content we write down :";
                      b2.hexdump(*_dout);
                      *_dout << dendl;
                }
              	ceph_abort_msg(cct , "OCSSD 4K write faliure ");
              }
            }
            free(tmp);
          }
        }
        else
        {
          dout(10) << __func__ << "  redirect write " << dendl;
          ::pwrite(fd,aio->ctx.data,aio->lba_len,aio->lba_off);
        }

        dout(10) << __func__ << std::hex <<  " off=" << aio->lba_off << " len=" << aio->lba_len << std::dec << " done.." << dendl;

        auto id = aio->lba_off / OCSSD_SEG_SIZE;
        auto iofst = aio->lba_off % OCSSD_SEG_SIZE + aio->lba_len;
        if(likely (iofst <= OCSSD_SEG_SIZE) )
        {
          g_pm_data.sblk_ofst[id].fin_ofst += aio->lba_len;
        }
        else
        {
          g_pm_data.sblk_ofst[id].fin_ofst = OCSSD_SEG_SIZE;
          g_pm_data.sblk_ofst[id+1].fin_ofst = iofst - OCSSD_SEG_SIZE;
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

void OCDevice::logical2virtual(const struct nvm_geo *geo, uint64_t lba_off, uint64_t lba_len, int *cnt,
                               struct nvm_addr *addrs) {
  struct nvm_addr addr;
  unsigned long long ofst;
  unsigned int wl, pg_in_wl;
  unsigned int i;


#if DEBUG_VERBOSE_PPA_CALC
  printf("Debug: calculate initial PPA\n");
#endif
  // Calculate initial PPA address
  addr.g.blk = lba_off / (geo->nchannels * geo->nluns * geo->nplanes * geo->npages * geo->page_nbytes);
  ofst       = lba_off % (geo->nchannels * geo->nluns * geo->nplanes * geo->npages * geo->page_nbytes);
#if DEBUG_VERBOSE_PPA_CALC
  printf("     : blk      %d, ofst %lld\n", addr.g.blk, ofst);
#endif

  wl   = ofst / (geo->nchannels * geo->nluns * geo->nplanes * geo->page_nbytes * 3);
  ofst = ofst % (geo->nchannels * geo->nluns * geo->nplanes * geo->page_nbytes * 3);
#if DEBUG_VERBOSE_PPA_CALC
  printf("     : wl       %d, ofst %lld\n", wl, ofst);
#endif

/*
    pg_in_wl = ofst / (geo->nchannels * geo->nluns * geo->nplanes * geo->page_nbytes);
    ofst     = ofst % (geo->nchannels * geo->nluns * geo->nplanes * geo->page_nbytes);
#if DEBUG_VERBOSE_PPA_CALC
    printf("     : pg_in_wl %d, ofst %lld\n", pg_in_wl, ofst);
#endif

    addr.g.pg = wl * 3 + pg_in_wl;
*/

  addr.g.ch = ofst / (geo->nluns * geo->nplanes * geo->page_nbytes * 3);
  ofst      = ofst % (geo->nluns * geo->nplanes * geo->page_nbytes * 3);
#if DEBUG_VERBOSE_PPA_CALC
  printf("     : ch       %d, ofst %lld\n", addr.g.ch, ofst);
#endif

  addr.g.lun = ofst / (geo->nplanes * geo->page_nbytes * 3);
  ofst       = ofst % (geo->nplanes * geo->page_nbytes * 3);
#if DEBUG_VERBOSE_PPA_CALC
  printf("     : lun      %d, ofst %lld\n", addr.g.lun, ofst);
#endif

  pg_in_wl = ofst / (geo->nplanes * geo->page_nbytes);
  ofst     = ofst % (geo->nplanes * geo->page_nbytes);
#if DEBUG_VERBOSE_PPA_CALC
  printf("     : pg_in_wl %d, ofst %lld\n", pg_in_wl, ofst);
#endif
  addr.g.pg = wl * 3 + pg_in_wl;


  addr.g.pl  = ofst / (geo->page_nbytes);
  ofst       = ofst % (geo->page_nbytes);
#if DEBUG_VERBOSE_PPA_CALC
  printf("     : pl       %d, ofst %lld\n", addr.g.pl, ofst);
#endif


  addr.g.sec = ofst / (geo->sector_nbytes);
#if DEBUG_VERBOSE_PPA_CALC
  printf("     : pg       %d\n", addr.g.pg);
    printf("     : sec      %d\n", addr.g.sec);
    printf("Debug: calc done\n");
#endif

  // Fill command context
  *cnt = lba_len / 4096;
  for (i = 0; i < *cnt; i++) {
    addrs[i] = addr;
    incr_virtual(geo, &addr);
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
      _erase_sb( dev , i);
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
  for ( i = 0 ; i < g_pm_data.nr_sblks ; ++i)
  {
    uint32_t ofst = g_pm_data.sblk_ofst[i].fin_ofst;
    if(ofst)
    {
      p.insert( (uint32_t)i*OCSSD_SEG_SIZE , ofst);
    }
  }
}

void OCDevice::__open_ocssd() {


  dev = nvm_dev_open("/dev/nvme0n1");

  if(dev == NULL)
  {
    derr << "openchannel device open err!" << dendl;
    ceph_abort();
  }
  //-------- get geo
  g_geo = nvm_dev_get_geo(dev);

  //-------- get bbt
  int i,j;
  struct nvm_ret ret;
  {
    const struct nvm_geo *geo = nvm_dev_get_geo(dev);
    for (i = 0; i < geo->nchannels; i++) {
      for (j = 0; j < geo->nluns; j++) {
        struct nvm_addr addr;
        memset(&addr, 0, sizeof(struct nvm_addr));
        addr.g.ch = i;
        addr.g.lun = j;
        g_bbt[i][j] = nvm_bbt_get(dev, addr, &ret);
      }
    }
  }

  // get pm_data
  {
    nvm_read_pm(dev,&g_pm_data,0,sizeof(g_pm_data),0u,&ret);

    for(int i = 0 ; i < g_pm_data.nr_sblks ; ++i)
    {
      if(g_pm_data.sblk_ofst[i].fin_ofst > 0)
      {
        dout(10) << __func__ << "seg_id = " << i << ",ofst=" << byte_u_t(g_pm_data.sblk_ofst[i].fin_ofst) << dendl;
      }
    }
  }


  uint64_t width = g_geo->nchannels * g_geo->nluns * g_geo->nplanes;
  uint64_t segsize  = width * g_geo->npages * g_geo->page_nbytes;
  ceph_assert( OCSSD_SEG_SIZE == (segsize));

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
////  dout(10) << " OCDevice:" << __func__ << "backend: " << cct->_conf->bdev_ocssd_backend << dendl;
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
////	dout(10) << "OCDevice:" << __func__ << "mark created obj_id to LibOCSSD" << dendl;
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
////  dout(10) << " OCDevice: " << __func__ << dendl;
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
////    dout(10) << __func__ << std::hex << " GET BACK " << free << std::dec << dendl;
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
////	    dout(10) << std::hex << "OCDevice:" << __func__ << " New seg " << *segment
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
////	    dout(10) << std::hex << "OCDevice:" << __func__ << " New seg " << *segment <<
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
////  dout(10) << " generate ocssd core dump file.. " << dendl;
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
////  dout(10) << __func__ << " seg_map size = " << seg_map.size() << " seg_map= " << this->dump_seg_map() << " sizeof(seg_map size) = " << sizeof(seg_map.size()) << dendl;
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
////		dout(10) << "OCDevice:" <<__func__ << "  mark " << id << " to used " << dendl;
////		mark_created(id);
////		count++;
////	}
////	if(count == 0 )
////		dout(10) << "OCDevice:" << __func__ << " Nothing to mark " << dendl;
////}
////
////void SegmentManager::_mock_coreback()
//{
//#ifdef MOCK_TEST
//  if (::access(corefile.c_str(), F_OK) != 0)
//    return;
//
//  dout(10) << __func__ << " recovery " << dendl;
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
//  dout(10) << __func__ << " map size: " << n << dendl;
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
//    dout(10) << __func__ << " prepare to recovery: " << obj_id << dendl;
//    seg_map[idx] = new Segment(bloff, obj_id, size);
//    seg_map[idx]->nvm_obj_off = obj_off;
//  }
//  dout(10) << __func__ << " existed obj " << this->dump_seg_map() << dendl;
//
//
//#endif
//}

