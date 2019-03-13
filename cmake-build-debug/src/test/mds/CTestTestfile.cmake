# CMake generated Testfile for 
# Source directory: /home/wuyue/ceph-13.2.2/src/test/mds
# Build directory: /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/mds
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(unittest_mds_authcap "/home/wuyue/ceph-13.2.2/cmake-build-debug/bin/unittest_mds_authcap")
set_tests_properties(unittest_mds_authcap PROPERTIES  ENVIRONMENT "CEPH_ROOT=/home/wuyue/ceph-13.2.2;CEPH_BIN=/home/wuyue/ceph-13.2.2/cmake-build-debug/bin;CEPH_LIB=/home/wuyue/ceph-13.2.2/cmake-build-debug/lib;CEPH_BUILD_DIR=/home/wuyue/ceph-13.2.2/cmake-build-debug;LD_LIBRARY_PATH=/home/wuyue/ceph-13.2.2/cmake-build-debug/lib;PATH=/home/wuyue/ceph-13.2.2/cmake-build-debug/bin:/home/wuyue/ceph-13.2.2/src:/opt/rh/devtoolset-7/root/usr/bin:/opt/rh/devtoolset-7/root/usr/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:/root/bin;PYTHONPATH=/home/wuyue/ceph-13.2.2/cmake-build-debug/lib/cython_modules/lib.2:/home/wuyue/ceph-13.2.2/src/pybind;CEPH_BUILD_VIRTUALENV=/tmp" TIMEOUT "3600")
add_test(unittest_mds_sessionfilter "/home/wuyue/ceph-13.2.2/cmake-build-debug/bin/unittest_mds_sessionfilter")
set_tests_properties(unittest_mds_sessionfilter PROPERTIES  ENVIRONMENT "CEPH_ROOT=/home/wuyue/ceph-13.2.2;CEPH_BIN=/home/wuyue/ceph-13.2.2/cmake-build-debug/bin;CEPH_LIB=/home/wuyue/ceph-13.2.2/cmake-build-debug/lib;CEPH_BUILD_DIR=/home/wuyue/ceph-13.2.2/cmake-build-debug;LD_LIBRARY_PATH=/home/wuyue/ceph-13.2.2/cmake-build-debug/lib;PATH=/home/wuyue/ceph-13.2.2/cmake-build-debug/bin:/home/wuyue/ceph-13.2.2/src:/opt/rh/devtoolset-7/root/usr/bin:/opt/rh/devtoolset-7/root/usr/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:/root/bin;PYTHONPATH=/home/wuyue/ceph-13.2.2/cmake-build-debug/lib/cython_modules/lib.2:/home/wuyue/ceph-13.2.2/src/pybind;CEPH_BUILD_VIRTUALENV=/tmp" TIMEOUT "3600")
