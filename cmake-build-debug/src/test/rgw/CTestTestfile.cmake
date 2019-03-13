# CMake generated Testfile for 
# Source directory: /home/wuyue/ceph-13.2.2/src/test/rgw
# Build directory: /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/rgw
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(unittest_rgw_bencode "/home/wuyue/ceph-13.2.2/cmake-build-debug/bin/unittest_rgw_bencode")
set_tests_properties(unittest_rgw_bencode PROPERTIES  ENVIRONMENT "CEPH_ROOT=/home/wuyue/ceph-13.2.2;CEPH_BIN=/home/wuyue/ceph-13.2.2/cmake-build-debug/bin;CEPH_LIB=/home/wuyue/ceph-13.2.2/cmake-build-debug/lib;CEPH_BUILD_DIR=/home/wuyue/ceph-13.2.2/cmake-build-debug;LD_LIBRARY_PATH=/home/wuyue/ceph-13.2.2/cmake-build-debug/lib;PATH=/home/wuyue/ceph-13.2.2/cmake-build-debug/bin:/home/wuyue/ceph-13.2.2/src:/opt/rh/devtoolset-7/root/usr/bin:/opt/rh/devtoolset-7/root/usr/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:/root/bin;PYTHONPATH=/home/wuyue/ceph-13.2.2/cmake-build-debug/lib/cython_modules/lib.2:/home/wuyue/ceph-13.2.2/src/pybind;CEPH_BUILD_VIRTUALENV=/tmp" TIMEOUT "3600")
add_test(unittest_rgw_period_history "/home/wuyue/ceph-13.2.2/cmake-build-debug/bin/unittest_rgw_period_history")
set_tests_properties(unittest_rgw_period_history PROPERTIES  ENVIRONMENT "CEPH_ROOT=/home/wuyue/ceph-13.2.2;CEPH_BIN=/home/wuyue/ceph-13.2.2/cmake-build-debug/bin;CEPH_LIB=/home/wuyue/ceph-13.2.2/cmake-build-debug/lib;CEPH_BUILD_DIR=/home/wuyue/ceph-13.2.2/cmake-build-debug;LD_LIBRARY_PATH=/home/wuyue/ceph-13.2.2/cmake-build-debug/lib;PATH=/home/wuyue/ceph-13.2.2/cmake-build-debug/bin:/home/wuyue/ceph-13.2.2/src:/opt/rh/devtoolset-7/root/usr/bin:/opt/rh/devtoolset-7/root/usr/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:/root/bin;PYTHONPATH=/home/wuyue/ceph-13.2.2/cmake-build-debug/lib/cython_modules/lib.2:/home/wuyue/ceph-13.2.2/src/pybind;CEPH_BUILD_VIRTUALENV=/tmp" TIMEOUT "3600")
add_test(unittest_rgw_compression "/home/wuyue/ceph-13.2.2/cmake-build-debug/bin/unittest_rgw_compression")
set_tests_properties(unittest_rgw_compression PROPERTIES  ENVIRONMENT "CEPH_ROOT=/home/wuyue/ceph-13.2.2;CEPH_BIN=/home/wuyue/ceph-13.2.2/cmake-build-debug/bin;CEPH_LIB=/home/wuyue/ceph-13.2.2/cmake-build-debug/lib;CEPH_BUILD_DIR=/home/wuyue/ceph-13.2.2/cmake-build-debug;LD_LIBRARY_PATH=/home/wuyue/ceph-13.2.2/cmake-build-debug/lib;PATH=/home/wuyue/ceph-13.2.2/cmake-build-debug/bin:/home/wuyue/ceph-13.2.2/src:/opt/rh/devtoolset-7/root/usr/bin:/opt/rh/devtoolset-7/root/usr/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:/root/bin;PYTHONPATH=/home/wuyue/ceph-13.2.2/cmake-build-debug/lib/cython_modules/lib.2:/home/wuyue/ceph-13.2.2/src/pybind;CEPH_BUILD_VIRTUALENV=/tmp" TIMEOUT "3600")
add_test(unittest_http_manager "/home/wuyue/ceph-13.2.2/cmake-build-debug/bin/unittest_http_manager")
set_tests_properties(unittest_http_manager PROPERTIES  ENVIRONMENT "CEPH_ROOT=/home/wuyue/ceph-13.2.2;CEPH_BIN=/home/wuyue/ceph-13.2.2/cmake-build-debug/bin;CEPH_LIB=/home/wuyue/ceph-13.2.2/cmake-build-debug/lib;CEPH_BUILD_DIR=/home/wuyue/ceph-13.2.2/cmake-build-debug;LD_LIBRARY_PATH=/home/wuyue/ceph-13.2.2/cmake-build-debug/lib;PATH=/home/wuyue/ceph-13.2.2/cmake-build-debug/bin:/home/wuyue/ceph-13.2.2/src:/opt/rh/devtoolset-7/root/usr/bin:/opt/rh/devtoolset-7/root/usr/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:/root/bin;PYTHONPATH=/home/wuyue/ceph-13.2.2/cmake-build-debug/lib/cython_modules/lib.2:/home/wuyue/ceph-13.2.2/src/pybind;CEPH_BUILD_VIRTUALENV=/tmp" TIMEOUT "3600")
add_test(unittest_rgw_crypto "/home/wuyue/ceph-13.2.2/cmake-build-debug/bin/unittest_rgw_crypto")
set_tests_properties(unittest_rgw_crypto PROPERTIES  ENVIRONMENT "CEPH_ROOT=/home/wuyue/ceph-13.2.2;CEPH_BIN=/home/wuyue/ceph-13.2.2/cmake-build-debug/bin;CEPH_LIB=/home/wuyue/ceph-13.2.2/cmake-build-debug/lib;CEPH_BUILD_DIR=/home/wuyue/ceph-13.2.2/cmake-build-debug;LD_LIBRARY_PATH=/home/wuyue/ceph-13.2.2/cmake-build-debug/lib;PATH=/home/wuyue/ceph-13.2.2/cmake-build-debug/bin:/home/wuyue/ceph-13.2.2/src:/opt/rh/devtoolset-7/root/usr/bin:/opt/rh/devtoolset-7/root/usr/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:/root/bin;PYTHONPATH=/home/wuyue/ceph-13.2.2/cmake-build-debug/lib/cython_modules/lib.2:/home/wuyue/ceph-13.2.2/src/pybind;CEPH_BUILD_VIRTUALENV=/tmp" TIMEOUT "3600")
add_test(unittest_rgw_iam_policy "/home/wuyue/ceph-13.2.2/cmake-build-debug/bin/unittest_rgw_iam_policy")
set_tests_properties(unittest_rgw_iam_policy PROPERTIES  ENVIRONMENT "CEPH_ROOT=/home/wuyue/ceph-13.2.2;CEPH_BIN=/home/wuyue/ceph-13.2.2/cmake-build-debug/bin;CEPH_LIB=/home/wuyue/ceph-13.2.2/cmake-build-debug/lib;CEPH_BUILD_DIR=/home/wuyue/ceph-13.2.2/cmake-build-debug;LD_LIBRARY_PATH=/home/wuyue/ceph-13.2.2/cmake-build-debug/lib;PATH=/home/wuyue/ceph-13.2.2/cmake-build-debug/bin:/home/wuyue/ceph-13.2.2/src:/opt/rh/devtoolset-7/root/usr/bin:/opt/rh/devtoolset-7/root/usr/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:/root/bin;PYTHONPATH=/home/wuyue/ceph-13.2.2/cmake-build-debug/lib/cython_modules/lib.2:/home/wuyue/ceph-13.2.2/src/pybind;CEPH_BUILD_VIRTUALENV=/tmp" TIMEOUT "3600")
add_test(unittest_rgw_string "/home/wuyue/ceph-13.2.2/cmake-build-debug/bin/unittest_rgw_string")
set_tests_properties(unittest_rgw_string PROPERTIES  ENVIRONMENT "CEPH_ROOT=/home/wuyue/ceph-13.2.2;CEPH_BIN=/home/wuyue/ceph-13.2.2/cmake-build-debug/bin;CEPH_LIB=/home/wuyue/ceph-13.2.2/cmake-build-debug/lib;CEPH_BUILD_DIR=/home/wuyue/ceph-13.2.2/cmake-build-debug;LD_LIBRARY_PATH=/home/wuyue/ceph-13.2.2/cmake-build-debug/lib;PATH=/home/wuyue/ceph-13.2.2/cmake-build-debug/bin:/home/wuyue/ceph-13.2.2/src:/opt/rh/devtoolset-7/root/usr/bin:/opt/rh/devtoolset-7/root/usr/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:/root/bin;PYTHONPATH=/home/wuyue/ceph-13.2.2/cmake-build-debug/lib/cython_modules/lib.2:/home/wuyue/ceph-13.2.2/src/pybind;CEPH_BUILD_VIRTUALENV=/tmp" TIMEOUT "3600")
