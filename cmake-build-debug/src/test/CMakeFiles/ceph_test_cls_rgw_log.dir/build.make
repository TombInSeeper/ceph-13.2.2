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
include src/test/CMakeFiles/ceph_test_cls_rgw_log.dir/depend.make

# Include the progress variables for this target.
include src/test/CMakeFiles/ceph_test_cls_rgw_log.dir/progress.make

# Include the compile flags for this target's objects.
include src/test/CMakeFiles/ceph_test_cls_rgw_log.dir/flags.make

src/test/CMakeFiles/ceph_test_cls_rgw_log.dir/test_rgw_admin_log.cc.o: src/test/CMakeFiles/ceph_test_cls_rgw_log.dir/flags.make
src/test/CMakeFiles/ceph_test_cls_rgw_log.dir/test_rgw_admin_log.cc.o: ../src/test/test_rgw_admin_log.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/wuyue/ceph-13.2.2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/test/CMakeFiles/ceph_test_cls_rgw_log.dir/test_rgw_admin_log.cc.o"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test && /opt/rh/devtoolset-7/root/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/ceph_test_cls_rgw_log.dir/test_rgw_admin_log.cc.o -c /home/wuyue/ceph-13.2.2/src/test/test_rgw_admin_log.cc

src/test/CMakeFiles/ceph_test_cls_rgw_log.dir/test_rgw_admin_log.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ceph_test_cls_rgw_log.dir/test_rgw_admin_log.cc.i"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test && /opt/rh/devtoolset-7/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/wuyue/ceph-13.2.2/src/test/test_rgw_admin_log.cc > CMakeFiles/ceph_test_cls_rgw_log.dir/test_rgw_admin_log.cc.i

src/test/CMakeFiles/ceph_test_cls_rgw_log.dir/test_rgw_admin_log.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ceph_test_cls_rgw_log.dir/test_rgw_admin_log.cc.s"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test && /opt/rh/devtoolset-7/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/wuyue/ceph-13.2.2/src/test/test_rgw_admin_log.cc -o CMakeFiles/ceph_test_cls_rgw_log.dir/test_rgw_admin_log.cc.s

# Object files for target ceph_test_cls_rgw_log
ceph_test_cls_rgw_log_OBJECTS = \
"CMakeFiles/ceph_test_cls_rgw_log.dir/test_rgw_admin_log.cc.o"

# External object files for target ceph_test_cls_rgw_log
ceph_test_cls_rgw_log_EXTERNAL_OBJECTS =

bin/ceph_test_cls_rgw_log: src/test/CMakeFiles/ceph_test_cls_rgw_log.dir/test_rgw_admin_log.cc.o
bin/ceph_test_cls_rgw_log: src/test/CMakeFiles/ceph_test_cls_rgw_log.dir/build.make
bin/ceph_test_cls_rgw_log: lib/librgw_a.a
bin/ceph_test_cls_rgw_log: lib/libglobal.a
bin/ceph_test_cls_rgw_log: lib/libcls_version_client.a
bin/ceph_test_cls_rgw_log: lib/libcls_log_client.a
bin/ceph_test_cls_rgw_log: lib/libcls_statelog_client.a
bin/ceph_test_cls_rgw_log: lib/libcls_refcount_client.a
bin/ceph_test_cls_rgw_log: lib/libcls_rgw_client.a
bin/ceph_test_cls_rgw_log: lib/libcls_user_client.a
bin/ceph_test_cls_rgw_log: lib/libcls_lock_client.a
bin/ceph_test_cls_rgw_log: /usr/lib64/libblkid.so
bin/ceph_test_cls_rgw_log: /usr/lib64/libcurl.so
bin/ceph_test_cls_rgw_log: /usr/lib64/libexpat.so
bin/ceph_test_cls_rgw_log: lib/libgmock_main.a
bin/ceph_test_cls_rgw_log: lib/libgmock.a
bin/ceph_test_cls_rgw_log: lib/libgtest.a
bin/ceph_test_cls_rgw_log: /usr/lib64/libibverbs.so
bin/ceph_test_cls_rgw_log: /usr/lib64/libssl3.so
bin/ceph_test_cls_rgw_log: /usr/lib64/libsmime3.so
bin/ceph_test_cls_rgw_log: /usr/lib64/libnss3.so
bin/ceph_test_cls_rgw_log: /usr/lib64/libnssutil3.so
bin/ceph_test_cls_rgw_log: /usr/lib64/libplds4.so
bin/ceph_test_cls_rgw_log: /usr/lib64/libplc4.so
bin/ceph_test_cls_rgw_log: /usr/lib64/libnspr4.so
bin/ceph_test_cls_rgw_log: /usr/lib64/libssl.so
bin/ceph_test_cls_rgw_log: /usr/lib64/libcrypto.so
bin/ceph_test_cls_rgw_log: lib/librados.so.2.0.0
bin/ceph_test_cls_rgw_log: lib/libcls_otp_client.a
bin/ceph_test_cls_rgw_log: lib/libcls_timeindex_client.a
bin/ceph_test_cls_rgw_log: lib/libcls_replica_log_client.a
bin/ceph_test_cls_rgw_log: lib/libceph-common.so.0
bin/ceph_test_cls_rgw_log: /usr/lib64/libblkid.so
bin/ceph_test_cls_rgw_log: /usr/lib64/libibverbs.so
bin/ceph_test_cls_rgw_log: lib/libjson_spirit.a
bin/ceph_test_cls_rgw_log: lib/liberasure_code.a
bin/ceph_test_cls_rgw_log: boost/lib/libboost_random.a
bin/ceph_test_cls_rgw_log: boost/lib/libboost_program_options.a
bin/ceph_test_cls_rgw_log: boost/lib/libboost_iostreams.a
bin/ceph_test_cls_rgw_log: boost/lib/libboost_regex.a
bin/ceph_test_cls_rgw_log: /usr/lib64/libz.so
bin/ceph_test_cls_rgw_log: lib/libcommon_utf8.a
bin/ceph_test_cls_rgw_log: /usr/lib64/libldap.so
bin/ceph_test_cls_rgw_log: /usr/lib64/liblber.so
bin/ceph_test_cls_rgw_log: /usr/lib64/libssl3.so
bin/ceph_test_cls_rgw_log: /usr/lib64/libsmime3.so
bin/ceph_test_cls_rgw_log: /usr/lib64/libnss3.so
bin/ceph_test_cls_rgw_log: /usr/lib64/libnssutil3.so
bin/ceph_test_cls_rgw_log: /usr/lib64/libplds4.so
bin/ceph_test_cls_rgw_log: /usr/lib64/libplc4.so
bin/ceph_test_cls_rgw_log: /usr/lib64/libnspr4.so
bin/ceph_test_cls_rgw_log: /usr/lib64/libssl.so
bin/ceph_test_cls_rgw_log: /usr/lib64/libcrypto.so
bin/ceph_test_cls_rgw_log: boost/lib/libboost_coroutine.a
bin/ceph_test_cls_rgw_log: boost/lib/libboost_context.a
bin/ceph_test_cls_rgw_log: boost/lib/libboost_thread.a
bin/ceph_test_cls_rgw_log: boost/lib/libboost_atomic.a
bin/ceph_test_cls_rgw_log: boost/lib/libboost_system.a
bin/ceph_test_cls_rgw_log: boost/lib/libboost_date_time.a
bin/ceph_test_cls_rgw_log: boost/lib/libboost_chrono.a
bin/ceph_test_cls_rgw_log: src/test/CMakeFiles/ceph_test_cls_rgw_log.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/wuyue/ceph-13.2.2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../../bin/ceph_test_cls_rgw_log"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/ceph_test_cls_rgw_log.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/test/CMakeFiles/ceph_test_cls_rgw_log.dir/build: bin/ceph_test_cls_rgw_log

.PHONY : src/test/CMakeFiles/ceph_test_cls_rgw_log.dir/build

src/test/CMakeFiles/ceph_test_cls_rgw_log.dir/clean:
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test && $(CMAKE_COMMAND) -P CMakeFiles/ceph_test_cls_rgw_log.dir/cmake_clean.cmake
.PHONY : src/test/CMakeFiles/ceph_test_cls_rgw_log.dir/clean

src/test/CMakeFiles/ceph_test_cls_rgw_log.dir/depend:
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/wuyue/ceph-13.2.2 /home/wuyue/ceph-13.2.2/src/test /home/wuyue/ceph-13.2.2/cmake-build-debug /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/CMakeFiles/ceph_test_cls_rgw_log.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/test/CMakeFiles/ceph_test_cls_rgw_log.dir/depend

