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
include src/test/CMakeFiles/unittest_striper.dir/depend.make

# Include the progress variables for this target.
include src/test/CMakeFiles/unittest_striper.dir/progress.make

# Include the compile flags for this target's objects.
include src/test/CMakeFiles/unittest_striper.dir/flags.make

src/test/CMakeFiles/unittest_striper.dir/test_striper.cc.o: src/test/CMakeFiles/unittest_striper.dir/flags.make
src/test/CMakeFiles/unittest_striper.dir/test_striper.cc.o: ../src/test/test_striper.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/wuyue/ceph-13.2.2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/test/CMakeFiles/unittest_striper.dir/test_striper.cc.o"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test && /opt/rh/devtoolset-7/root/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/unittest_striper.dir/test_striper.cc.o -c /home/wuyue/ceph-13.2.2/src/test/test_striper.cc

src/test/CMakeFiles/unittest_striper.dir/test_striper.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/unittest_striper.dir/test_striper.cc.i"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test && /opt/rh/devtoolset-7/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/wuyue/ceph-13.2.2/src/test/test_striper.cc > CMakeFiles/unittest_striper.dir/test_striper.cc.i

src/test/CMakeFiles/unittest_striper.dir/test_striper.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/unittest_striper.dir/test_striper.cc.s"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test && /opt/rh/devtoolset-7/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/wuyue/ceph-13.2.2/src/test/test_striper.cc -o CMakeFiles/unittest_striper.dir/test_striper.cc.s

# Object files for target unittest_striper
unittest_striper_OBJECTS = \
"CMakeFiles/unittest_striper.dir/test_striper.cc.o"

# External object files for target unittest_striper
unittest_striper_EXTERNAL_OBJECTS = \
"/home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/CMakeFiles/unit-main.dir/unit.cc.o"

bin/unittest_striper: src/test/CMakeFiles/unittest_striper.dir/test_striper.cc.o
bin/unittest_striper: src/test/CMakeFiles/unit-main.dir/unit.cc.o
bin/unittest_striper: src/test/CMakeFiles/unittest_striper.dir/build.make
bin/unittest_striper: lib/libgmock_main.a
bin/unittest_striper: lib/libgmock.a
bin/unittest_striper: lib/libgtest.a
bin/unittest_striper: lib/libglobal.a
bin/unittest_striper: /usr/lib64/libblkid.so
bin/unittest_striper: lib/libceph-common.so.0
bin/unittest_striper: /usr/lib64/libblkid.so
bin/unittest_striper: lib/libjson_spirit.a
bin/unittest_striper: lib/libcommon_utf8.a
bin/unittest_striper: lib/liberasure_code.a
bin/unittest_striper: boost/lib/libboost_thread.a
bin/unittest_striper: boost/lib/libboost_chrono.a
bin/unittest_striper: boost/lib/libboost_atomic.a
bin/unittest_striper: boost/lib/libboost_system.a
bin/unittest_striper: boost/lib/libboost_random.a
bin/unittest_striper: boost/lib/libboost_program_options.a
bin/unittest_striper: boost/lib/libboost_date_time.a
bin/unittest_striper: boost/lib/libboost_iostreams.a
bin/unittest_striper: boost/lib/libboost_regex.a
bin/unittest_striper: /usr/lib64/libssl3.so
bin/unittest_striper: /usr/lib64/libsmime3.so
bin/unittest_striper: /usr/lib64/libnss3.so
bin/unittest_striper: /usr/lib64/libnssutil3.so
bin/unittest_striper: /usr/lib64/libplds4.so
bin/unittest_striper: /usr/lib64/libplc4.so
bin/unittest_striper: /usr/lib64/libnspr4.so
bin/unittest_striper: /usr/lib64/libssl.so
bin/unittest_striper: /usr/lib64/libcrypto.so
bin/unittest_striper: /usr/lib64/libz.so
bin/unittest_striper: /usr/lib64/libibverbs.so
bin/unittest_striper: src/test/CMakeFiles/unittest_striper.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/wuyue/ceph-13.2.2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../../bin/unittest_striper"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/unittest_striper.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/test/CMakeFiles/unittest_striper.dir/build: bin/unittest_striper

.PHONY : src/test/CMakeFiles/unittest_striper.dir/build

src/test/CMakeFiles/unittest_striper.dir/clean:
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test && $(CMAKE_COMMAND) -P CMakeFiles/unittest_striper.dir/cmake_clean.cmake
.PHONY : src/test/CMakeFiles/unittest_striper.dir/clean

src/test/CMakeFiles/unittest_striper.dir/depend:
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/wuyue/ceph-13.2.2 /home/wuyue/ceph-13.2.2/src/test /home/wuyue/ceph-13.2.2/cmake-build-debug /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/CMakeFiles/unittest_striper.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/test/CMakeFiles/unittest_striper.dir/depend

