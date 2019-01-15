//
// Created by wuyue on 12/14/18.
//
extern "C"
{
 #include "libocssd/objssd-nvme.h"
}

#include <chrono>
#include <iostream>
int main()
{

  using namespace std;
  using namespace chrono;

	struct nvm_dev *dev = dev_open("/dev/nvme0n1");
	if (!dev)
	{
      printf("Open err!");
      return 1;
	}
	cout << ("Open OK!!\n") ;


	unsigned int obj_id = 30 ,obj_size = 12800;
	//int r = obj_create(dev,&obj_id,&obj_size);

	char *buf = new char [ obj_size * 4096 ];
	char *rbuf = new char [ obj_size * 4096 ];

	for (unsigned int i = 0 ;i < obj_size *4096 ; ++i ){
		buf[i] = i % 127;
	}


    io_u io;
	io.data = buf;
	io.data_size = obj_size;
	io.obj_id = obj_id;
	io.obj_off = 0;

	cout << "Write data , length = " << ( obj_size * 4096 ) / ( 1024 *1024 ) << " MiB \n " ;
	auto start = steady_clock::now();
	obj_write(dev,&io);
	auto end = steady_clock::now();
	auto tspan = duration_cast<duration<double>> (end-start);
  cout << "Write data , time overhead = " << tspan.count() << " seconds \n " ;
  cout << "BandWidth: " << ( ( obj_size * 4096 ) / ( 1024 *1024 ) ) / (tspan.count()) << "MiB/s" << endl;




	io.data = rbuf;
	cout << "Read data , length = " << ( obj_size * 4096 ) / ( 1024 *1024 ) << " MiB \n " ;
	 auto start1 = steady_clock::now();
	obj_read(dev,&io);
	 auto end1 = steady_clock::now();
	 auto tspan1 = duration_cast<duration<double>> (end1-start1);
  cout << "Read data , time overhead = " << tspan1.count() << " seconds \n " ;
  cout << "BandWidth: " << ( ( obj_size * 4096 ) / ( 1024 *1024 ) ) / (tspan1.count()) << "MiB/s" << endl;


   /*for(int i = 0 ; i< obj_size *4096 ; ++i ) {
		if ( buf[i] != rbuf[i] ){
			cout << std::dec <<" write buf[" << i << "]=" << buf[i] << ",But" << " read buf["<< i << "]=" << rbuf[i] << endl;
		}
	}*/



  	delete[]buf;
	delete[]rbuf;
  	dev_close(dev);

	return 0;

}
