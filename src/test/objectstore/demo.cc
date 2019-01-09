//
// Created by wuyue on 12/14/18.
//
extern "C" {
  #include "libocssd/objssd-nvme.h"
}
#include "os/bluestore/Allocator.h"


#include "include/interval_set.h"
#include "include/buffer.h"

//int main()
//{
//
////  constexpr static uint64_t block_size = 4096;
////
////
////  uint64_t offset = 4095;
////  bufferlist data;
////  data.append("123456");
////
////  ceph_assert(data.length()< block_size);
////  ceph_assert(data.is_contiguous());
////
////  bufferlist read_buffer;
////  read_buffer.append_zero(block_size);
////
////
////  bufferlist head,tail;
////
////  auto head_length = p2nphase(offset,block_size);
////
////  std::cout << "head_length:" << head_length << std::endl;
////
////  bufferlist substr;
////  bufferlist h , t ;
////  h.append("head");
////  t.append("tail");
////
////  substr.substr_of(data, 1 , 3 ); // 234
////
////  bufferlist result;
////  result.append(h);
////  result.append(substr);
////  result.append(t);
////
////
////
////  std::cout << "result buffers: " << result.get_num_buffers() << "\n";
////  std::cout << "result :" << result.c_str() << std::endl;
//
//
//}

int main()
{

  //Imagine we have a
  struct nvm_dev *dev = dev_open("/dev/nvme0n1");
  if(!dev){
	printf("Open err!");
	return 1;
  }
	
	
  unsigned int oid,osize;
  for(int i=0 ; i < 1 ; ++i) {
  	obj_create(dev,&oid,&osize);  
  	printf("oid=%u,osize=%u\n",oid,osize);
  }
  
	


  dev_close(dev);


  return 0;
}
