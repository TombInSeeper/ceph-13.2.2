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
include src/test/messenger/CMakeFiles/simple_server.dir/depend.make

# Include the progress variables for this target.
include src/test/messenger/CMakeFiles/simple_server.dir/progress.make

# Include the compile flags for this target's objects.
include src/test/messenger/CMakeFiles/simple_server.dir/flags.make

src/test/messenger/CMakeFiles/simple_server.dir/simple_server.cc.o: src/test/messenger/CMakeFiles/simple_server.dir/flags.make
src/test/messenger/CMakeFiles/simple_server.dir/simple_server.cc.o: ../src/test/messenger/simple_server.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/wuyue/ceph-13.2.2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/test/messenger/CMakeFiles/simple_server.dir/simple_server.cc.o"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/messenger && /opt/rh/devtoolset-7/root/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/simple_server.dir/simple_server.cc.o -c /home/wuyue/ceph-13.2.2/src/test/messenger/simple_server.cc

src/test/messenger/CMakeFiles/simple_server.dir/simple_server.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/simple_server.dir/simple_server.cc.i"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/messenger && /opt/rh/devtoolset-7/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/wuyue/ceph-13.2.2/src/test/messenger/simple_server.cc > CMakeFiles/simple_server.dir/simple_server.cc.i

src/test/messenger/CMakeFiles/simple_server.dir/simple_server.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/simple_server.dir/simple_server.cc.s"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/messenger && /opt/rh/devtoolset-7/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/wuyue/ceph-13.2.2/src/test/messenger/simple_server.cc -o CMakeFiles/simple_server.dir/simple_server.cc.s

src/test/messenger/CMakeFiles/simple_server.dir/simple_dispatcher.cc.o: src/test/messenger/CMakeFiles/simple_server.dir/flags.make
src/test/messenger/CMakeFiles/simple_server.dir/simple_dispatcher.cc.o: ../src/test/messenger/simple_dispatcher.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/wuyue/ceph-13.2.2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object src/test/messenger/CMakeFiles/simple_server.dir/simple_dispatcher.cc.o"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/messenger && /opt/rh/devtoolset-7/root/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/simple_server.dir/simple_dispatcher.cc.o -c /home/wuyue/ceph-13.2.2/src/test/messenger/simple_dispatcher.cc

src/test/messenger/CMakeFiles/simple_server.dir/simple_dispatcher.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/simple_server.dir/simple_dispatcher.cc.i"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/messenger && /opt/rh/devtoolset-7/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/wuyue/ceph-13.2.2/src/test/messenger/simple_dispatcher.cc > CMakeFiles/simple_server.dir/simple_dispatcher.cc.i

src/test/messenger/CMakeFiles/simple_server.dir/simple_dispatcher.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/simple_server.dir/simple_dispatcher.cc.s"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/messenger && /opt/rh/devtoolset-7/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/wuyue/ceph-13.2.2/src/test/messenger/simple_dispatcher.cc -o CMakeFiles/simple_server.dir/simple_dispatcher.cc.s

# Object files for target simple_server
simple_server_OBJECTS = \
"CMakeFiles/simple_server.dir/simple_server.cc.o" \
"CMakeFiles/simple_server.dir/simple_dispatcher.cc.o"

# External object files for target simple_server
simple_server_EXTERNAL_OBJECTS =

bin/simple_server: src/test/messenger/CMakeFiles/simple_server.dir/simple_server.cc.o
bin/simple_server: src/test/messenger/CMakeFiles/simple_server.dir/simple_dispatcher.cc.o
bin/simple_server: src/test/messenger/CMakeFiles/simple_server.dir/build.make
bin/simple_server: lib/libglobal.a
bin/simple_server: lib/libceph-common.so.0
bin/simple_server: /usr/lib64/libibverbs.so
bin/simple_server: lib/libjson_spirit.a
bin/simple_server: lib/libcommon_utf8.a
bin/simple_server: lib/liberasure_code.a
bin/simple_server: boost/lib/libboost_thread.a
bin/simple_server: boost/lib/libboost_chrono.a
bin/simple_server: boost/lib/libboost_atomic.a
bin/simple_server: boost/lib/libboost_system.a
bin/simple_server: boost/lib/libboost_random.a
bin/simple_server: boost/lib/libboost_program_options.a
bin/simple_server: boost/lib/libboost_date_time.a
bin/simple_server: boost/lib/libboost_iostreams.a
bin/simple_server: boost/lib/libboost_regex.a
bin/simple_server: /usr/lib64/libblkid.so
bin/simple_server: /usr/lib64/libssl3.so
bin/simple_server: /usr/lib64/libsmime3.so
bin/simple_server: /usr/lib64/libnss3.so
bin/simple_server: /usr/lib64/libnssutil3.so
bin/simple_server: /usr/lib64/libplds4.so
bin/simple_server: /usr/lib64/libplc4.so
bin/simple_server: /usr/lib64/libnspr4.so
bin/simple_server: /usr/lib64/libssl.so
bin/simple_server: /usr/lib64/libcrypto.so
bin/simple_server: /usr/lib64/libz.so
bin/simple_server: /usr/lib64/libibverbs.so
bin/simple_server: src/test/messenger/CMakeFiles/simple_server.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/wuyue/ceph-13.2.2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable ../../../bin/simple_server"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/messenger && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/simple_server.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/test/messenger/CMakeFiles/simple_server.dir/build: bin/simple_server

.PHONY : src/test/messenger/CMakeFiles/simple_server.dir/build

src/test/messenger/CMakeFiles/simple_server.dir/clean:
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/messenger && $(CMAKE_COMMAND) -P CMakeFiles/simple_server.dir/cmake_clean.cmake
.PHONY : src/test/messenger/CMakeFiles/simple_server.dir/clean

src/test/messenger/CMakeFiles/simple_server.dir/depend:
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/wuyue/ceph-13.2.2 /home/wuyue/ceph-13.2.2/src/test/messenger /home/wuyue/ceph-13.2.2/cmake-build-debug /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/messenger /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/messenger/CMakeFiles/simple_server.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/test/messenger/CMakeFiles/simple_server.dir/depend

