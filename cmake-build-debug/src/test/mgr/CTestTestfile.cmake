# CMake generated Testfile for 
# Source directory: /home/wuyue/ceph-13.2.2/src/test/mgr
# Build directory: /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/mgr
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(mgr-dashboard-frontend-unittests "/home/wuyue/ceph-13.2.2/src/pybind/mgr/dashboard/run-frontend-unittests.sh")
set_tests_properties(mgr-dashboard-frontend-unittests PROPERTIES  ENVIRONMENT "CEPH_ROOT=/home/wuyue/ceph-13.2.2;CEPH_BIN=/home/wuyue/ceph-13.2.2/cmake-build-debug/bin;CEPH_LIB=/home/wuyue/ceph-13.2.2/cmake-build-debug/lib;CEPH_BUILD_DIR=/home/wuyue/ceph-13.2.2/cmake-build-debug;LD_LIBRARY_PATH=/home/wuyue/ceph-13.2.2/cmake-build-debug/lib;PATH=/home/wuyue/ceph-13.2.2/cmake-build-debug/bin:/home/wuyue/ceph-13.2.2/src:/opt/rh/devtoolset-7/root/usr/bin:/usr/lib64/qt-3.3/bin:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/home/wuyue/.local/bin:/home/wuyue/bin;PYTHONPATH=/home/wuyue/ceph-13.2.2/cmake-build-debug/lib/cython_modules/lib.2:/home/wuyue/ceph-13.2.2/src/pybind;CEPH_BUILD_VIRTUALENV=/tmp" TIMEOUT "3600")
add_test(mgr-dashboard-smoke.sh "/home/wuyue/ceph-13.2.2/src/test/mgr/mgr-dashboard-smoke.sh")
set_tests_properties(mgr-dashboard-smoke.sh PROPERTIES  ENVIRONMENT "CEPH_ROOT=/home/wuyue/ceph-13.2.2;CEPH_BIN=/home/wuyue/ceph-13.2.2/cmake-build-debug/bin;CEPH_LIB=/home/wuyue/ceph-13.2.2/cmake-build-debug/lib;CEPH_BUILD_DIR=/home/wuyue/ceph-13.2.2/cmake-build-debug;LD_LIBRARY_PATH=/home/wuyue/ceph-13.2.2/cmake-build-debug/lib;PATH=/home/wuyue/ceph-13.2.2/cmake-build-debug/bin:/home/wuyue/ceph-13.2.2/src:/opt/rh/devtoolset-7/root/usr/bin:/usr/lib64/qt-3.3/bin:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/home/wuyue/.local/bin:/home/wuyue/bin;PYTHONPATH=/home/wuyue/ceph-13.2.2/cmake-build-debug/lib/cython_modules/lib.2:/home/wuyue/ceph-13.2.2/src/pybind;CEPH_BUILD_VIRTUALENV=/tmp" TIMEOUT "3600")
