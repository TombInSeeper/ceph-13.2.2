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
include src/test/libradosstriper/CMakeFiles/ceph_test_rados_striper_api_striping.dir/depend.make

# Include the progress variables for this target.
include src/test/libradosstriper/CMakeFiles/ceph_test_rados_striper_api_striping.dir/progress.make

# Include the compile flags for this target's objects.
include src/test/libradosstriper/CMakeFiles/ceph_test_rados_striper_api_striping.dir/flags.make

src/test/libradosstriper/CMakeFiles/ceph_test_rados_striper_api_striping.dir/striping.cc.o: src/test/libradosstriper/CMakeFiles/ceph_test_rados_striper_api_striping.dir/flags.make
src/test/libradosstriper/CMakeFiles/ceph_test_rados_striper_api_striping.dir/striping.cc.o: ../src/test/libradosstriper/striping.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/wuyue/ceph-13.2.2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/test/libradosstriper/CMakeFiles/ceph_test_rados_striper_api_striping.dir/striping.cc.o"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/libradosstriper && /opt/rh/devtoolset-7/root/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/ceph_test_rados_striper_api_striping.dir/striping.cc.o -c /home/wuyue/ceph-13.2.2/src/test/libradosstriper/striping.cc

src/test/libradosstriper/CMakeFiles/ceph_test_rados_striper_api_striping.dir/striping.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ceph_test_rados_striper_api_striping.dir/striping.cc.i"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/libradosstriper && /opt/rh/devtoolset-7/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/wuyue/ceph-13.2.2/src/test/libradosstriper/striping.cc > CMakeFiles/ceph_test_rados_striper_api_striping.dir/striping.cc.i

src/test/libradosstriper/CMakeFiles/ceph_test_rados_striper_api_striping.dir/striping.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ceph_test_rados_striper_api_striping.dir/striping.cc.s"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/libradosstriper && /opt/rh/devtoolset-7/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/wuyue/ceph-13.2.2/src/test/libradosstriper/striping.cc -o CMakeFiles/ceph_test_rados_striper_api_striping.dir/striping.cc.s

# Object files for target ceph_test_rados_striper_api_striping
ceph_test_rados_striper_api_striping_OBJECTS = \
"CMakeFiles/ceph_test_rados_striper_api_striping.dir/striping.cc.o"

# External object files for target ceph_test_rados_striper_api_striping
ceph_test_rados_striper_api_striping_EXTERNAL_OBJECTS =

bin/ceph_test_rados_striper_api_striping: src/test/libradosstriper/CMakeFiles/ceph_test_rados_striper_api_striping.dir/striping.cc.o
bin/ceph_test_rados_striper_api_striping: src/test/libradosstriper/CMakeFiles/ceph_test_rados_striper_api_striping.dir/build.make
bin/ceph_test_rados_striper_api_striping: lib/libradosstriper.so.1.0.0
bin/ceph_test_rados_striper_api_striping: lib/libgmock_main.a
bin/ceph_test_rados_striper_api_striping: lib/libgmock.a
bin/ceph_test_rados_striper_api_striping: lib/libgtest.a
bin/ceph_test_rados_striper_api_striping: lib/librados_striper_test.a
bin/ceph_test_rados_striper_api_striping: lib/libradostest.a
bin/ceph_test_rados_striper_api_striping: lib/librados.so.2.0.0
bin/ceph_test_rados_striper_api_striping: lib/libceph-common.so.0
bin/ceph_test_rados_striper_api_striping: lib/liberasure_code.a
bin/ceph_test_rados_striper_api_striping: boost/lib/libboost_thread.a
bin/ceph_test_rados_striper_api_striping: boost/lib/libboost_chrono.a
bin/ceph_test_rados_striper_api_striping: boost/lib/libboost_atomic.a
bin/ceph_test_rados_striper_api_striping: boost/lib/libboost_system.a
bin/ceph_test_rados_striper_api_striping: boost/lib/libboost_random.a
bin/ceph_test_rados_striper_api_striping: boost/lib/libboost_program_options.a
bin/ceph_test_rados_striper_api_striping: boost/lib/libboost_date_time.a
bin/ceph_test_rados_striper_api_striping: boost/lib/libboost_iostreams.a
bin/ceph_test_rados_striper_api_striping: boost/lib/libboost_regex.a
bin/ceph_test_rados_striper_api_striping: /usr/lib64/libblkid.so
bin/ceph_test_rados_striper_api_striping: /usr/lib64/libssl3.so
bin/ceph_test_rados_striper_api_striping: /usr/lib64/libsmime3.so
bin/ceph_test_rados_striper_api_striping: /usr/lib64/libnss3.so
bin/ceph_test_rados_striper_api_striping: /usr/lib64/libnssutil3.so
bin/ceph_test_rados_striper_api_striping: /usr/lib64/libplds4.so
bin/ceph_test_rados_striper_api_striping: /usr/lib64/libplc4.so
bin/ceph_test_rados_striper_api_striping: /usr/lib64/libnspr4.so
bin/ceph_test_rados_striper_api_striping: /usr/lib64/libssl.so
bin/ceph_test_rados_striper_api_striping: /usr/lib64/libcrypto.so
bin/ceph_test_rados_striper_api_striping: /usr/lib64/libz.so
bin/ceph_test_rados_striper_api_striping: lib/libjson_spirit.a
bin/ceph_test_rados_striper_api_striping: lib/libcommon_utf8.a
bin/ceph_test_rados_striper_api_striping: /usr/lib64/libibverbs.so
bin/ceph_test_rados_striper_api_striping: src/test/libradosstriper/CMakeFiles/ceph_test_rados_striper_api_striping.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/wuyue/ceph-13.2.2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../../../bin/ceph_test_rados_striper_api_striping"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/libradosstriper && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/ceph_test_rados_striper_api_striping.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/test/libradosstriper/CMakeFiles/ceph_test_rados_striper_api_striping.dir/build: bin/ceph_test_rados_striper_api_striping

.PHONY : src/test/libradosstriper/CMakeFiles/ceph_test_rados_striper_api_striping.dir/build

src/test/libradosstriper/CMakeFiles/ceph_test_rados_striper_api_striping.dir/clean:
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/libradosstriper && $(CMAKE_COMMAND) -P CMakeFiles/ceph_test_rados_striper_api_striping.dir/cmake_clean.cmake
.PHONY : src/test/libradosstriper/CMakeFiles/ceph_test_rados_striper_api_striping.dir/clean

src/test/libradosstriper/CMakeFiles/ceph_test_rados_striper_api_striping.dir/depend:
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/wuyue/ceph-13.2.2 /home/wuyue/ceph-13.2.2/src/test/libradosstriper /home/wuyue/ceph-13.2.2/cmake-build-debug /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/libradosstriper /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/libradosstriper/CMakeFiles/ceph_test_rados_striper_api_striping.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/test/libradosstriper/CMakeFiles/ceph_test_rados_striper_api_striping.dir/depend

