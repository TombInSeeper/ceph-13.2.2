# CMake generated Testfile for 
# Source directory: /home/wuyue/ceph-13.2.2/src/test/osd
# Build directory: /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/osd
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(safe-to-destroy.sh "/home/wuyue/ceph-13.2.2/src/test/osd/safe-to-destroy.sh")
set_tests_properties(safe-to-destroy.sh PROPERTIES  ENVIRONMENT "CEPH_ROOT=/home/wuyue/ceph-13.2.2;CEPH_BIN=/home/wuyue/ceph-13.2.2/cmake-build-debug/bin;CEPH_LIB=/home/wuyue/ceph-13.2.2/cmake-build-debug/lib;CEPH_BUILD_DIR=/home/wuyue/ceph-13.2.2/cmake-build-debug;LD_LIBRARY_PATH=/home/wuyue/ceph-13.2.2/cmake-build-debug/lib;PATH=/home/wuyue/ceph-13.2.2/cmake-build-debug/bin:/home/wuyue/ceph-13.2.2/src:/opt/rh/devtoolset-7/root/usr/bin:/opt/rh/devtoolset-7/root/usr/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:/root/bin;PYTHONPATH=/home/wuyue/ceph-13.2.2/cmake-build-debug/lib/cython_modules/lib.2:/home/wuyue/ceph-13.2.2/src/pybind;CEPH_BUILD_VIRTUALENV=/tmp" TIMEOUT "3600")
add_test(unittest_osdmap "/home/wuyue/ceph-13.2.2/cmake-build-debug/bin/unittest_osdmap")
set_tests_properties(unittest_osdmap PROPERTIES  ENVIRONMENT "CEPH_ROOT=/home/wuyue/ceph-13.2.2;CEPH_BIN=/home/wuyue/ceph-13.2.2/cmake-build-debug/bin;CEPH_LIB=/home/wuyue/ceph-13.2.2/cmake-build-debug/lib;CEPH_BUILD_DIR=/home/wuyue/ceph-13.2.2/cmake-build-debug;LD_LIBRARY_PATH=/home/wuyue/ceph-13.2.2/cmake-build-debug/lib;PATH=/home/wuyue/ceph-13.2.2/cmake-build-debug/bin:/home/wuyue/ceph-13.2.2/src:/opt/rh/devtoolset-7/root/usr/bin:/opt/rh/devtoolset-7/root/usr/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:/root/bin;PYTHONPATH=/home/wuyue/ceph-13.2.2/cmake-build-debug/lib/cython_modules/lib.2:/home/wuyue/ceph-13.2.2/src/pybind;CEPH_BUILD_VIRTUALENV=/tmp" TIMEOUT "3600")
add_test(unittest_osd_types "/home/wuyue/ceph-13.2.2/cmake-build-debug/bin/unittest_osd_types")
set_tests_properties(unittest_osd_types PROPERTIES  ENVIRONMENT "CEPH_ROOT=/home/wuyue/ceph-13.2.2;CEPH_BIN=/home/wuyue/ceph-13.2.2/cmake-build-debug/bin;CEPH_LIB=/home/wuyue/ceph-13.2.2/cmake-build-debug/lib;CEPH_BUILD_DIR=/home/wuyue/ceph-13.2.2/cmake-build-debug;LD_LIBRARY_PATH=/home/wuyue/ceph-13.2.2/cmake-build-debug/lib;PATH=/home/wuyue/ceph-13.2.2/cmake-build-debug/bin:/home/wuyue/ceph-13.2.2/src:/opt/rh/devtoolset-7/root/usr/bin:/opt/rh/devtoolset-7/root/usr/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:/root/bin;PYTHONPATH=/home/wuyue/ceph-13.2.2/cmake-build-debug/lib/cython_modules/lib.2:/home/wuyue/ceph-13.2.2/src/pybind;CEPH_BUILD_VIRTUALENV=/tmp" TIMEOUT "3600")
add_test(unittest_ecbackend "/home/wuyue/ceph-13.2.2/cmake-build-debug/bin/unittest_ecbackend")
set_tests_properties(unittest_ecbackend PROPERTIES  ENVIRONMENT "CEPH_ROOT=/home/wuyue/ceph-13.2.2;CEPH_BIN=/home/wuyue/ceph-13.2.2/cmake-build-debug/bin;CEPH_LIB=/home/wuyue/ceph-13.2.2/cmake-build-debug/lib;CEPH_BUILD_DIR=/home/wuyue/ceph-13.2.2/cmake-build-debug;LD_LIBRARY_PATH=/home/wuyue/ceph-13.2.2/cmake-build-debug/lib;PATH=/home/wuyue/ceph-13.2.2/cmake-build-debug/bin:/home/wuyue/ceph-13.2.2/src:/opt/rh/devtoolset-7/root/usr/bin:/opt/rh/devtoolset-7/root/usr/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:/root/bin;PYTHONPATH=/home/wuyue/ceph-13.2.2/cmake-build-debug/lib/cython_modules/lib.2:/home/wuyue/ceph-13.2.2/src/pybind;CEPH_BUILD_VIRTUALENV=/tmp" TIMEOUT "3600")
add_test(unittest_osdscrub "/home/wuyue/ceph-13.2.2/cmake-build-debug/bin/unittest_osdscrub")
set_tests_properties(unittest_osdscrub PROPERTIES  ENVIRONMENT "CEPH_ROOT=/home/wuyue/ceph-13.2.2;CEPH_BIN=/home/wuyue/ceph-13.2.2/cmake-build-debug/bin;CEPH_LIB=/home/wuyue/ceph-13.2.2/cmake-build-debug/lib;CEPH_BUILD_DIR=/home/wuyue/ceph-13.2.2/cmake-build-debug;LD_LIBRARY_PATH=/home/wuyue/ceph-13.2.2/cmake-build-debug/lib;PATH=/home/wuyue/ceph-13.2.2/cmake-build-debug/bin:/home/wuyue/ceph-13.2.2/src:/opt/rh/devtoolset-7/root/usr/bin:/opt/rh/devtoolset-7/root/usr/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:/root/bin;PYTHONPATH=/home/wuyue/ceph-13.2.2/cmake-build-debug/lib/cython_modules/lib.2:/home/wuyue/ceph-13.2.2/src/pybind;CEPH_BUILD_VIRTUALENV=/tmp" TIMEOUT "3600")
add_test(unittest_pglog "/home/wuyue/ceph-13.2.2/cmake-build-debug/bin/unittest_pglog")
set_tests_properties(unittest_pglog PROPERTIES  ENVIRONMENT "CEPH_ROOT=/home/wuyue/ceph-13.2.2;CEPH_BIN=/home/wuyue/ceph-13.2.2/cmake-build-debug/bin;CEPH_LIB=/home/wuyue/ceph-13.2.2/cmake-build-debug/lib;CEPH_BUILD_DIR=/home/wuyue/ceph-13.2.2/cmake-build-debug;LD_LIBRARY_PATH=/home/wuyue/ceph-13.2.2/cmake-build-debug/lib;PATH=/home/wuyue/ceph-13.2.2/cmake-build-debug/bin:/home/wuyue/ceph-13.2.2/src:/opt/rh/devtoolset-7/root/usr/bin:/opt/rh/devtoolset-7/root/usr/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:/root/bin;PYTHONPATH=/home/wuyue/ceph-13.2.2/cmake-build-debug/lib/cython_modules/lib.2:/home/wuyue/ceph-13.2.2/src/pybind;CEPH_BUILD_VIRTUALENV=/tmp" TIMEOUT "3600")
add_test(unittest_hitset "/home/wuyue/ceph-13.2.2/cmake-build-debug/bin/unittest_hitset")
set_tests_properties(unittest_hitset PROPERTIES  ENVIRONMENT "CEPH_ROOT=/home/wuyue/ceph-13.2.2;CEPH_BIN=/home/wuyue/ceph-13.2.2/cmake-build-debug/bin;CEPH_LIB=/home/wuyue/ceph-13.2.2/cmake-build-debug/lib;CEPH_BUILD_DIR=/home/wuyue/ceph-13.2.2/cmake-build-debug;LD_LIBRARY_PATH=/home/wuyue/ceph-13.2.2/cmake-build-debug/lib;PATH=/home/wuyue/ceph-13.2.2/cmake-build-debug/bin:/home/wuyue/ceph-13.2.2/src:/opt/rh/devtoolset-7/root/usr/bin:/opt/rh/devtoolset-7/root/usr/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:/root/bin;PYTHONPATH=/home/wuyue/ceph-13.2.2/cmake-build-debug/lib/cython_modules/lib.2:/home/wuyue/ceph-13.2.2/src/pybind;CEPH_BUILD_VIRTUALENV=/tmp" TIMEOUT "3600")
add_test(unittest_osd_osdcap "/home/wuyue/ceph-13.2.2/cmake-build-debug/bin/unittest_osd_osdcap")
set_tests_properties(unittest_osd_osdcap PROPERTIES  ENVIRONMENT "CEPH_ROOT=/home/wuyue/ceph-13.2.2;CEPH_BIN=/home/wuyue/ceph-13.2.2/cmake-build-debug/bin;CEPH_LIB=/home/wuyue/ceph-13.2.2/cmake-build-debug/lib;CEPH_BUILD_DIR=/home/wuyue/ceph-13.2.2/cmake-build-debug;LD_LIBRARY_PATH=/home/wuyue/ceph-13.2.2/cmake-build-debug/lib;PATH=/home/wuyue/ceph-13.2.2/cmake-build-debug/bin:/home/wuyue/ceph-13.2.2/src:/opt/rh/devtoolset-7/root/usr/bin:/opt/rh/devtoolset-7/root/usr/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:/root/bin;PYTHONPATH=/home/wuyue/ceph-13.2.2/cmake-build-debug/lib/cython_modules/lib.2:/home/wuyue/ceph-13.2.2/src/pybind;CEPH_BUILD_VIRTUALENV=/tmp" TIMEOUT "3600")
add_test(unittest_extent_cache "/home/wuyue/ceph-13.2.2/cmake-build-debug/bin/unittest_extent_cache")
set_tests_properties(unittest_extent_cache PROPERTIES  ENVIRONMENT "CEPH_ROOT=/home/wuyue/ceph-13.2.2;CEPH_BIN=/home/wuyue/ceph-13.2.2/cmake-build-debug/bin;CEPH_LIB=/home/wuyue/ceph-13.2.2/cmake-build-debug/lib;CEPH_BUILD_DIR=/home/wuyue/ceph-13.2.2/cmake-build-debug;LD_LIBRARY_PATH=/home/wuyue/ceph-13.2.2/cmake-build-debug/lib;PATH=/home/wuyue/ceph-13.2.2/cmake-build-debug/bin:/home/wuyue/ceph-13.2.2/src:/opt/rh/devtoolset-7/root/usr/bin:/opt/rh/devtoolset-7/root/usr/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:/root/bin;PYTHONPATH=/home/wuyue/ceph-13.2.2/cmake-build-debug/lib/cython_modules/lib.2:/home/wuyue/ceph-13.2.2/src/pybind;CEPH_BUILD_VIRTUALENV=/tmp" TIMEOUT "3600")
add_test(unittest_pg_transaction "/home/wuyue/ceph-13.2.2/cmake-build-debug/bin/unittest_pg_transaction")
set_tests_properties(unittest_pg_transaction PROPERTIES  ENVIRONMENT "CEPH_ROOT=/home/wuyue/ceph-13.2.2;CEPH_BIN=/home/wuyue/ceph-13.2.2/cmake-build-debug/bin;CEPH_LIB=/home/wuyue/ceph-13.2.2/cmake-build-debug/lib;CEPH_BUILD_DIR=/home/wuyue/ceph-13.2.2/cmake-build-debug;LD_LIBRARY_PATH=/home/wuyue/ceph-13.2.2/cmake-build-debug/lib;PATH=/home/wuyue/ceph-13.2.2/cmake-build-debug/bin:/home/wuyue/ceph-13.2.2/src:/opt/rh/devtoolset-7/root/usr/bin:/opt/rh/devtoolset-7/root/usr/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:/root/bin;PYTHONPATH=/home/wuyue/ceph-13.2.2/cmake-build-debug/lib/cython_modules/lib.2:/home/wuyue/ceph-13.2.2/src/pybind;CEPH_BUILD_VIRTUALENV=/tmp" TIMEOUT "3600")
add_test(unittest_ec_transaction "/home/wuyue/ceph-13.2.2/cmake-build-debug/bin/unittest_ec_transaction")
set_tests_properties(unittest_ec_transaction PROPERTIES  ENVIRONMENT "CEPH_ROOT=/home/wuyue/ceph-13.2.2;CEPH_BIN=/home/wuyue/ceph-13.2.2/cmake-build-debug/bin;CEPH_LIB=/home/wuyue/ceph-13.2.2/cmake-build-debug/lib;CEPH_BUILD_DIR=/home/wuyue/ceph-13.2.2/cmake-build-debug;LD_LIBRARY_PATH=/home/wuyue/ceph-13.2.2/cmake-build-debug/lib;PATH=/home/wuyue/ceph-13.2.2/cmake-build-debug/bin:/home/wuyue/ceph-13.2.2/src:/opt/rh/devtoolset-7/root/usr/bin:/opt/rh/devtoolset-7/root/usr/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:/root/bin;PYTHONPATH=/home/wuyue/ceph-13.2.2/cmake-build-debug/lib/cython_modules/lib.2:/home/wuyue/ceph-13.2.2/src/pybind;CEPH_BUILD_VIRTUALENV=/tmp" TIMEOUT "3600")
add_test(unittest_mclock_op_class_queue "/home/wuyue/ceph-13.2.2/cmake-build-debug/bin/unittest_mclock_op_class_queue")
set_tests_properties(unittest_mclock_op_class_queue PROPERTIES  ENVIRONMENT "CEPH_ROOT=/home/wuyue/ceph-13.2.2;CEPH_BIN=/home/wuyue/ceph-13.2.2/cmake-build-debug/bin;CEPH_LIB=/home/wuyue/ceph-13.2.2/cmake-build-debug/lib;CEPH_BUILD_DIR=/home/wuyue/ceph-13.2.2/cmake-build-debug;LD_LIBRARY_PATH=/home/wuyue/ceph-13.2.2/cmake-build-debug/lib;PATH=/home/wuyue/ceph-13.2.2/cmake-build-debug/bin:/home/wuyue/ceph-13.2.2/src:/opt/rh/devtoolset-7/root/usr/bin:/opt/rh/devtoolset-7/root/usr/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:/root/bin;PYTHONPATH=/home/wuyue/ceph-13.2.2/cmake-build-debug/lib/cython_modules/lib.2:/home/wuyue/ceph-13.2.2/src/pybind;CEPH_BUILD_VIRTUALENV=/tmp" TIMEOUT "3600")
add_test(unittest_mclock_client_queue "/home/wuyue/ceph-13.2.2/cmake-build-debug/bin/unittest_mclock_client_queue")
set_tests_properties(unittest_mclock_client_queue PROPERTIES  ENVIRONMENT "CEPH_ROOT=/home/wuyue/ceph-13.2.2;CEPH_BIN=/home/wuyue/ceph-13.2.2/cmake-build-debug/bin;CEPH_LIB=/home/wuyue/ceph-13.2.2/cmake-build-debug/lib;CEPH_BUILD_DIR=/home/wuyue/ceph-13.2.2/cmake-build-debug;LD_LIBRARY_PATH=/home/wuyue/ceph-13.2.2/cmake-build-debug/lib;PATH=/home/wuyue/ceph-13.2.2/cmake-build-debug/bin:/home/wuyue/ceph-13.2.2/src:/opt/rh/devtoolset-7/root/usr/bin:/opt/rh/devtoolset-7/root/usr/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:/root/bin;PYTHONPATH=/home/wuyue/ceph-13.2.2/cmake-build-debug/lib/cython_modules/lib.2:/home/wuyue/ceph-13.2.2/src/pybind;CEPH_BUILD_VIRTUALENV=/tmp" TIMEOUT "3600")
