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
include src/test/cls_statelog/CMakeFiles/ceph_test_cls_statelog.dir/depend.make

# Include the progress variables for this target.
include src/test/cls_statelog/CMakeFiles/ceph_test_cls_statelog.dir/progress.make

# Include the compile flags for this target's objects.
include src/test/cls_statelog/CMakeFiles/ceph_test_cls_statelog.dir/flags.make

src/test/cls_statelog/CMakeFiles/ceph_test_cls_statelog.dir/test_cls_statelog.cc.o: src/test/cls_statelog/CMakeFiles/ceph_test_cls_statelog.dir/flags.make
src/test/cls_statelog/CMakeFiles/ceph_test_cls_statelog.dir/test_cls_statelog.cc.o: ../src/test/cls_statelog/test_cls_statelog.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/wuyue/ceph-13.2.2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/test/cls_statelog/CMakeFiles/ceph_test_cls_statelog.dir/test_cls_statelog.cc.o"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/cls_statelog && /opt/rh/devtoolset-7/root/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/ceph_test_cls_statelog.dir/test_cls_statelog.cc.o -c /home/wuyue/ceph-13.2.2/src/test/cls_statelog/test_cls_statelog.cc

src/test/cls_statelog/CMakeFiles/ceph_test_cls_statelog.dir/test_cls_statelog.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ceph_test_cls_statelog.dir/test_cls_statelog.cc.i"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/cls_statelog && /opt/rh/devtoolset-7/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/wuyue/ceph-13.2.2/src/test/cls_statelog/test_cls_statelog.cc > CMakeFiles/ceph_test_cls_statelog.dir/test_cls_statelog.cc.i

src/test/cls_statelog/CMakeFiles/ceph_test_cls_statelog.dir/test_cls_statelog.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ceph_test_cls_statelog.dir/test_cls_statelog.cc.s"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/cls_statelog && /opt/rh/devtoolset-7/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/wuyue/ceph-13.2.2/src/test/cls_statelog/test_cls_statelog.cc -o CMakeFiles/ceph_test_cls_statelog.dir/test_cls_statelog.cc.s

# Object files for target ceph_test_cls_statelog
ceph_test_cls_statelog_OBJECTS = \
"CMakeFiles/ceph_test_cls_statelog.dir/test_cls_statelog.cc.o"

# External object files for target ceph_test_cls_statelog
ceph_test_cls_statelog_EXTERNAL_OBJECTS =

bin/ceph_test_cls_statelog: src/test/cls_statelog/CMakeFiles/ceph_test_cls_statelog.dir/test_cls_statelog.cc.o
bin/ceph_test_cls_statelog: src/test/cls_statelog/CMakeFiles/ceph_test_cls_statelog.dir/build.make
bin/ceph_test_cls_statelog: lib/libcls_statelog_client.a
bin/ceph_test_cls_statelog: lib/libglobal.a
bin/ceph_test_cls_statelog: lib/libgmock_main.a
bin/ceph_test_cls_statelog: lib/libgmock.a
bin/ceph_test_cls_statelog: lib/libgtest.a
bin/ceph_test_cls_statelog: /usr/lib64/libblkid.so
bin/ceph_test_cls_statelog: /usr/lib64/libssl3.so
bin/ceph_test_cls_statelog: /usr/lib64/libsmime3.so
bin/ceph_test_cls_statelog: /usr/lib64/libnss3.so
bin/ceph_test_cls_statelog: /usr/lib64/libnssutil3.so
bin/ceph_test_cls_statelog: /usr/lib64/libplds4.so
bin/ceph_test_cls_statelog: /usr/lib64/libplc4.so
bin/ceph_test_cls_statelog: /usr/lib64/libnspr4.so
bin/ceph_test_cls_statelog: /usr/lib64/libssl.so
bin/ceph_test_cls_statelog: /usr/lib64/libcrypto.so
bin/ceph_test_cls_statelog: /usr/lib64/libibverbs.so
bin/ceph_test_cls_statelog: lib/libradostest.a
bin/ceph_test_cls_statelog: lib/librados.so.2.0.0
bin/ceph_test_cls_statelog: lib/libceph-common.so.0
bin/ceph_test_cls_statelog: /usr/lib64/libblkid.so
bin/ceph_test_cls_statelog: /usr/lib64/libssl3.so
bin/ceph_test_cls_statelog: /usr/lib64/libsmime3.so
bin/ceph_test_cls_statelog: /usr/lib64/libnss3.so
bin/ceph_test_cls_statelog: /usr/lib64/libnssutil3.so
bin/ceph_test_cls_statelog: /usr/lib64/libplds4.so
bin/ceph_test_cls_statelog: /usr/lib64/libplc4.so
bin/ceph_test_cls_statelog: /usr/lib64/libnspr4.so
bin/ceph_test_cls_statelog: /usr/lib64/libssl.so
bin/ceph_test_cls_statelog: /usr/lib64/libcrypto.so
bin/ceph_test_cls_statelog: /usr/lib64/libibverbs.so
bin/ceph_test_cls_statelog: lib/liberasure_code.a
bin/ceph_test_cls_statelog: boost/lib/libboost_thread.a
bin/ceph_test_cls_statelog: boost/lib/libboost_chrono.a
bin/ceph_test_cls_statelog: boost/lib/libboost_atomic.a
bin/ceph_test_cls_statelog: boost/lib/libboost_system.a
bin/ceph_test_cls_statelog: boost/lib/libboost_random.a
bin/ceph_test_cls_statelog: boost/lib/libboost_program_options.a
bin/ceph_test_cls_statelog: boost/lib/libboost_date_time.a
bin/ceph_test_cls_statelog: boost/lib/libboost_iostreams.a
bin/ceph_test_cls_statelog: boost/lib/libboost_regex.a
bin/ceph_test_cls_statelog: /usr/lib64/libz.so
bin/ceph_test_cls_statelog: lib/libjson_spirit.a
bin/ceph_test_cls_statelog: lib/libcommon_utf8.a
bin/ceph_test_cls_statelog: src/test/cls_statelog/CMakeFiles/ceph_test_cls_statelog.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/wuyue/ceph-13.2.2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../../../bin/ceph_test_cls_statelog"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/cls_statelog && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/ceph_test_cls_statelog.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/test/cls_statelog/CMakeFiles/ceph_test_cls_statelog.dir/build: bin/ceph_test_cls_statelog

.PHONY : src/test/cls_statelog/CMakeFiles/ceph_test_cls_statelog.dir/build

src/test/cls_statelog/CMakeFiles/ceph_test_cls_statelog.dir/clean:
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/cls_statelog && $(CMAKE_COMMAND) -P CMakeFiles/ceph_test_cls_statelog.dir/cmake_clean.cmake
.PHONY : src/test/cls_statelog/CMakeFiles/ceph_test_cls_statelog.dir/clean

src/test/cls_statelog/CMakeFiles/ceph_test_cls_statelog.dir/depend:
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/wuyue/ceph-13.2.2 /home/wuyue/ceph-13.2.2/src/test/cls_statelog /home/wuyue/ceph-13.2.2/cmake-build-debug /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/cls_statelog /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/cls_statelog/CMakeFiles/ceph_test_cls_statelog.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/test/cls_statelog/CMakeFiles/ceph_test_cls_statelog.dir/depend

