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
include src/test/osdc/CMakeFiles/ceph_test_objectcacher_stress.dir/depend.make

# Include the progress variables for this target.
include src/test/osdc/CMakeFiles/ceph_test_objectcacher_stress.dir/progress.make

# Include the compile flags for this target's objects.
include src/test/osdc/CMakeFiles/ceph_test_objectcacher_stress.dir/flags.make

src/test/osdc/CMakeFiles/ceph_test_objectcacher_stress.dir/object_cacher_stress.cc.o: src/test/osdc/CMakeFiles/ceph_test_objectcacher_stress.dir/flags.make
src/test/osdc/CMakeFiles/ceph_test_objectcacher_stress.dir/object_cacher_stress.cc.o: ../src/test/osdc/object_cacher_stress.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/wuyue/ceph-13.2.2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/test/osdc/CMakeFiles/ceph_test_objectcacher_stress.dir/object_cacher_stress.cc.o"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/osdc && /opt/rh/devtoolset-7/root/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/ceph_test_objectcacher_stress.dir/object_cacher_stress.cc.o -c /home/wuyue/ceph-13.2.2/src/test/osdc/object_cacher_stress.cc

src/test/osdc/CMakeFiles/ceph_test_objectcacher_stress.dir/object_cacher_stress.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ceph_test_objectcacher_stress.dir/object_cacher_stress.cc.i"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/osdc && /opt/rh/devtoolset-7/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/wuyue/ceph-13.2.2/src/test/osdc/object_cacher_stress.cc > CMakeFiles/ceph_test_objectcacher_stress.dir/object_cacher_stress.cc.i

src/test/osdc/CMakeFiles/ceph_test_objectcacher_stress.dir/object_cacher_stress.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ceph_test_objectcacher_stress.dir/object_cacher_stress.cc.s"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/osdc && /opt/rh/devtoolset-7/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/wuyue/ceph-13.2.2/src/test/osdc/object_cacher_stress.cc -o CMakeFiles/ceph_test_objectcacher_stress.dir/object_cacher_stress.cc.s

src/test/osdc/CMakeFiles/ceph_test_objectcacher_stress.dir/FakeWriteback.cc.o: src/test/osdc/CMakeFiles/ceph_test_objectcacher_stress.dir/flags.make
src/test/osdc/CMakeFiles/ceph_test_objectcacher_stress.dir/FakeWriteback.cc.o: ../src/test/osdc/FakeWriteback.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/wuyue/ceph-13.2.2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object src/test/osdc/CMakeFiles/ceph_test_objectcacher_stress.dir/FakeWriteback.cc.o"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/osdc && /opt/rh/devtoolset-7/root/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/ceph_test_objectcacher_stress.dir/FakeWriteback.cc.o -c /home/wuyue/ceph-13.2.2/src/test/osdc/FakeWriteback.cc

src/test/osdc/CMakeFiles/ceph_test_objectcacher_stress.dir/FakeWriteback.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ceph_test_objectcacher_stress.dir/FakeWriteback.cc.i"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/osdc && /opt/rh/devtoolset-7/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/wuyue/ceph-13.2.2/src/test/osdc/FakeWriteback.cc > CMakeFiles/ceph_test_objectcacher_stress.dir/FakeWriteback.cc.i

src/test/osdc/CMakeFiles/ceph_test_objectcacher_stress.dir/FakeWriteback.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ceph_test_objectcacher_stress.dir/FakeWriteback.cc.s"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/osdc && /opt/rh/devtoolset-7/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/wuyue/ceph-13.2.2/src/test/osdc/FakeWriteback.cc -o CMakeFiles/ceph_test_objectcacher_stress.dir/FakeWriteback.cc.s

src/test/osdc/CMakeFiles/ceph_test_objectcacher_stress.dir/MemWriteback.cc.o: src/test/osdc/CMakeFiles/ceph_test_objectcacher_stress.dir/flags.make
src/test/osdc/CMakeFiles/ceph_test_objectcacher_stress.dir/MemWriteback.cc.o: ../src/test/osdc/MemWriteback.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/wuyue/ceph-13.2.2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object src/test/osdc/CMakeFiles/ceph_test_objectcacher_stress.dir/MemWriteback.cc.o"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/osdc && /opt/rh/devtoolset-7/root/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/ceph_test_objectcacher_stress.dir/MemWriteback.cc.o -c /home/wuyue/ceph-13.2.2/src/test/osdc/MemWriteback.cc

src/test/osdc/CMakeFiles/ceph_test_objectcacher_stress.dir/MemWriteback.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ceph_test_objectcacher_stress.dir/MemWriteback.cc.i"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/osdc && /opt/rh/devtoolset-7/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/wuyue/ceph-13.2.2/src/test/osdc/MemWriteback.cc > CMakeFiles/ceph_test_objectcacher_stress.dir/MemWriteback.cc.i

src/test/osdc/CMakeFiles/ceph_test_objectcacher_stress.dir/MemWriteback.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ceph_test_objectcacher_stress.dir/MemWriteback.cc.s"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/osdc && /opt/rh/devtoolset-7/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/wuyue/ceph-13.2.2/src/test/osdc/MemWriteback.cc -o CMakeFiles/ceph_test_objectcacher_stress.dir/MemWriteback.cc.s

# Object files for target ceph_test_objectcacher_stress
ceph_test_objectcacher_stress_OBJECTS = \
"CMakeFiles/ceph_test_objectcacher_stress.dir/object_cacher_stress.cc.o" \
"CMakeFiles/ceph_test_objectcacher_stress.dir/FakeWriteback.cc.o" \
"CMakeFiles/ceph_test_objectcacher_stress.dir/MemWriteback.cc.o"

# External object files for target ceph_test_objectcacher_stress
ceph_test_objectcacher_stress_EXTERNAL_OBJECTS =

bin/ceph_test_objectcacher_stress: src/test/osdc/CMakeFiles/ceph_test_objectcacher_stress.dir/object_cacher_stress.cc.o
bin/ceph_test_objectcacher_stress: src/test/osdc/CMakeFiles/ceph_test_objectcacher_stress.dir/FakeWriteback.cc.o
bin/ceph_test_objectcacher_stress: src/test/osdc/CMakeFiles/ceph_test_objectcacher_stress.dir/MemWriteback.cc.o
bin/ceph_test_objectcacher_stress: src/test/osdc/CMakeFiles/ceph_test_objectcacher_stress.dir/build.make
bin/ceph_test_objectcacher_stress: lib/libosdc.a
bin/ceph_test_objectcacher_stress: lib/libglobal.a
bin/ceph_test_objectcacher_stress: /usr/lib64/libibverbs.so
bin/ceph_test_objectcacher_stress: lib/libceph-common.so.0
bin/ceph_test_objectcacher_stress: lib/libjson_spirit.a
bin/ceph_test_objectcacher_stress: lib/libcommon_utf8.a
bin/ceph_test_objectcacher_stress: lib/liberasure_code.a
bin/ceph_test_objectcacher_stress: boost/lib/libboost_thread.a
bin/ceph_test_objectcacher_stress: boost/lib/libboost_chrono.a
bin/ceph_test_objectcacher_stress: boost/lib/libboost_atomic.a
bin/ceph_test_objectcacher_stress: boost/lib/libboost_system.a
bin/ceph_test_objectcacher_stress: boost/lib/libboost_random.a
bin/ceph_test_objectcacher_stress: boost/lib/libboost_program_options.a
bin/ceph_test_objectcacher_stress: boost/lib/libboost_date_time.a
bin/ceph_test_objectcacher_stress: boost/lib/libboost_iostreams.a
bin/ceph_test_objectcacher_stress: boost/lib/libboost_regex.a
bin/ceph_test_objectcacher_stress: /usr/lib64/libblkid.so
bin/ceph_test_objectcacher_stress: /usr/lib64/libssl3.so
bin/ceph_test_objectcacher_stress: /usr/lib64/libsmime3.so
bin/ceph_test_objectcacher_stress: /usr/lib64/libnss3.so
bin/ceph_test_objectcacher_stress: /usr/lib64/libnssutil3.so
bin/ceph_test_objectcacher_stress: /usr/lib64/libplds4.so
bin/ceph_test_objectcacher_stress: /usr/lib64/libplc4.so
bin/ceph_test_objectcacher_stress: /usr/lib64/libnspr4.so
bin/ceph_test_objectcacher_stress: /usr/lib64/libssl.so
bin/ceph_test_objectcacher_stress: /usr/lib64/libcrypto.so
bin/ceph_test_objectcacher_stress: /usr/lib64/libibverbs.so
bin/ceph_test_objectcacher_stress: /usr/lib64/libz.so
bin/ceph_test_objectcacher_stress: src/test/osdc/CMakeFiles/ceph_test_objectcacher_stress.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/wuyue/ceph-13.2.2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking CXX executable ../../../bin/ceph_test_objectcacher_stress"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/osdc && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/ceph_test_objectcacher_stress.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/test/osdc/CMakeFiles/ceph_test_objectcacher_stress.dir/build: bin/ceph_test_objectcacher_stress

.PHONY : src/test/osdc/CMakeFiles/ceph_test_objectcacher_stress.dir/build

src/test/osdc/CMakeFiles/ceph_test_objectcacher_stress.dir/clean:
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/osdc && $(CMAKE_COMMAND) -P CMakeFiles/ceph_test_objectcacher_stress.dir/cmake_clean.cmake
.PHONY : src/test/osdc/CMakeFiles/ceph_test_objectcacher_stress.dir/clean

src/test/osdc/CMakeFiles/ceph_test_objectcacher_stress.dir/depend:
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/wuyue/ceph-13.2.2 /home/wuyue/ceph-13.2.2/src/test/osdc /home/wuyue/ceph-13.2.2/cmake-build-debug /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/osdc /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/osdc/CMakeFiles/ceph_test_objectcacher_stress.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/test/osdc/CMakeFiles/ceph_test_objectcacher_stress.dir/depend

