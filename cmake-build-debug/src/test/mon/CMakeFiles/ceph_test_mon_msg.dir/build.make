# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.12

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /home/wuyue/clion-2018.2.5/bin/cmake/linux/bin/cmake

# The command to remove a file.
RM = /home/wuyue/clion-2018.2.5/bin/cmake/linux/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/wuyue/ceph-13.2.2

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/wuyue/ceph-13.2.2/cmake-build-debug

# Include any dependencies generated for this target.
include src/test/mon/CMakeFiles/ceph_test_mon_msg.dir/depend.make

# Include the progress variables for this target.
include src/test/mon/CMakeFiles/ceph_test_mon_msg.dir/progress.make

# Include the compile flags for this target's objects.
include src/test/mon/CMakeFiles/ceph_test_mon_msg.dir/flags.make

src/test/mon/CMakeFiles/ceph_test_mon_msg.dir/test-mon-msg.cc.o: src/test/mon/CMakeFiles/ceph_test_mon_msg.dir/flags.make
src/test/mon/CMakeFiles/ceph_test_mon_msg.dir/test-mon-msg.cc.o: ../src/test/mon/test-mon-msg.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/wuyue/ceph-13.2.2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/test/mon/CMakeFiles/ceph_test_mon_msg.dir/test-mon-msg.cc.o"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/mon && /opt/rh/devtoolset-7/root/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/ceph_test_mon_msg.dir/test-mon-msg.cc.o -c /home/wuyue/ceph-13.2.2/src/test/mon/test-mon-msg.cc

src/test/mon/CMakeFiles/ceph_test_mon_msg.dir/test-mon-msg.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ceph_test_mon_msg.dir/test-mon-msg.cc.i"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/mon && /opt/rh/devtoolset-7/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/wuyue/ceph-13.2.2/src/test/mon/test-mon-msg.cc > CMakeFiles/ceph_test_mon_msg.dir/test-mon-msg.cc.i

src/test/mon/CMakeFiles/ceph_test_mon_msg.dir/test-mon-msg.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ceph_test_mon_msg.dir/test-mon-msg.cc.s"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/mon && /opt/rh/devtoolset-7/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/wuyue/ceph-13.2.2/src/test/mon/test-mon-msg.cc -o CMakeFiles/ceph_test_mon_msg.dir/test-mon-msg.cc.s

# Object files for target ceph_test_mon_msg
ceph_test_mon_msg_OBJECTS = \
"CMakeFiles/ceph_test_mon_msg.dir/test-mon-msg.cc.o"

# External object files for target ceph_test_mon_msg
ceph_test_mon_msg_EXTERNAL_OBJECTS =

bin/ceph_test_mon_msg: src/test/mon/CMakeFiles/ceph_test_mon_msg.dir/test-mon-msg.cc.o
bin/ceph_test_mon_msg: src/test/mon/CMakeFiles/ceph_test_mon_msg.dir/build.make
bin/ceph_test_mon_msg: lib/libos.a
bin/ceph_test_mon_msg: lib/libosdc.a
bin/ceph_test_mon_msg: lib/libglobal.a
bin/ceph_test_mon_msg: lib/libgmock_main.a
bin/ceph_test_mon_msg: lib/libgmock.a
bin/ceph_test_mon_msg: lib/libgtest.a
bin/ceph_test_mon_msg: lib/liblightnvm.a
bin/ceph_test_mon_msg: /lib64/libaio.so
bin/ceph_test_mon_msg: /usr/lib64/libfuse.so
bin/ceph_test_mon_msg: ../src/spdk/build/lib/libspdk_nvme.a
bin/ceph_test_mon_msg: ../src/spdk/build/lib/libspdk_log.a
bin/ceph_test_mon_msg: ../src/spdk/build/lib/libspdk_lvol.a
bin/ceph_test_mon_msg: /usr/lib64/libuuid.so
bin/ceph_test_mon_msg: ../src/spdk/build/lib/libspdk_env_dpdk.a
bin/ceph_test_mon_msg: src/dpdk/lib/librte_bus_pci.a
bin/ceph_test_mon_msg: src/dpdk/lib/librte_pci.a
bin/ceph_test_mon_msg: src/dpdk/lib/librte_eal.a
bin/ceph_test_mon_msg: src/dpdk/lib/librte_mempool.a
bin/ceph_test_mon_msg: src/dpdk/lib/librte_mempool_ring.a
bin/ceph_test_mon_msg: src/dpdk/lib/librte_mempool_stack.a
bin/ceph_test_mon_msg: src/dpdk/lib/librte_ring.a
bin/ceph_test_mon_msg: ../src/spdk/build/lib/libspdk_util.a
bin/ceph_test_mon_msg: lib/libkv.a
bin/ceph_test_mon_msg: /lib64/libleveldb.so
bin/ceph_test_mon_msg: src/rocksdb/librocksdb.a
bin/ceph_test_mon_msg: /usr/local/lib/libtcmalloc.so
bin/ceph_test_mon_msg: /lib64/libsnappy.so
bin/ceph_test_mon_msg: /usr/lib64/liblz4.so
bin/ceph_test_mon_msg: lib/libceph-common.so.0
bin/ceph_test_mon_msg: lib/libjson_spirit.a
bin/ceph_test_mon_msg: lib/libcommon_utf8.a
bin/ceph_test_mon_msg: lib/liberasure_code.a
bin/ceph_test_mon_msg: boost/lib/libboost_thread.a
bin/ceph_test_mon_msg: boost/lib/libboost_chrono.a
bin/ceph_test_mon_msg: boost/lib/libboost_atomic.a
bin/ceph_test_mon_msg: boost/lib/libboost_system.a
bin/ceph_test_mon_msg: boost/lib/libboost_random.a
bin/ceph_test_mon_msg: boost/lib/libboost_program_options.a
bin/ceph_test_mon_msg: boost/lib/libboost_date_time.a
bin/ceph_test_mon_msg: boost/lib/libboost_iostreams.a
bin/ceph_test_mon_msg: boost/lib/libboost_regex.a
bin/ceph_test_mon_msg: /usr/lib64/libblkid.so
bin/ceph_test_mon_msg: /usr/lib64/libssl3.so
bin/ceph_test_mon_msg: /usr/lib64/libsmime3.so
bin/ceph_test_mon_msg: /usr/lib64/libnss3.so
bin/ceph_test_mon_msg: /usr/lib64/libnssutil3.so
bin/ceph_test_mon_msg: /usr/lib64/libplds4.so
bin/ceph_test_mon_msg: /usr/lib64/libplc4.so
bin/ceph_test_mon_msg: /usr/lib64/libnspr4.so
bin/ceph_test_mon_msg: /usr/lib64/libssl.so
bin/ceph_test_mon_msg: /usr/lib64/libcrypto.so
bin/ceph_test_mon_msg: /usr/lib64/libz.so
bin/ceph_test_mon_msg: /usr/lib64/libibverbs.so
bin/ceph_test_mon_msg: src/test/mon/CMakeFiles/ceph_test_mon_msg.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/wuyue/ceph-13.2.2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../../../bin/ceph_test_mon_msg"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/mon && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/ceph_test_mon_msg.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/test/mon/CMakeFiles/ceph_test_mon_msg.dir/build: bin/ceph_test_mon_msg

.PHONY : src/test/mon/CMakeFiles/ceph_test_mon_msg.dir/build

src/test/mon/CMakeFiles/ceph_test_mon_msg.dir/clean:
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/mon && $(CMAKE_COMMAND) -P CMakeFiles/ceph_test_mon_msg.dir/cmake_clean.cmake
.PHONY : src/test/mon/CMakeFiles/ceph_test_mon_msg.dir/clean

src/test/mon/CMakeFiles/ceph_test_mon_msg.dir/depend:
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/wuyue/ceph-13.2.2 /home/wuyue/ceph-13.2.2/src/test/mon /home/wuyue/ceph-13.2.2/cmake-build-debug /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/mon /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/mon/CMakeFiles/ceph_test_mon_msg.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/test/mon/CMakeFiles/ceph_test_mon_msg.dir/depend

