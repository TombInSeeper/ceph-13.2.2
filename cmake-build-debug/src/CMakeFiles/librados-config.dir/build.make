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
include src/CMakeFiles/librados-config.dir/depend.make

# Include the progress variables for this target.
include src/CMakeFiles/librados-config.dir/progress.make

# Include the compile flags for this target's objects.
include src/CMakeFiles/librados-config.dir/flags.make

src/CMakeFiles/librados-config.dir/librados-config.cc.o: src/CMakeFiles/librados-config.dir/flags.make
src/CMakeFiles/librados-config.dir/librados-config.cc.o: ../src/librados-config.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/wuyue/ceph-13.2.2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/CMakeFiles/librados-config.dir/librados-config.cc.o"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src && /opt/rh/devtoolset-7/root/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/librados-config.dir/librados-config.cc.o -c /home/wuyue/ceph-13.2.2/src/librados-config.cc

src/CMakeFiles/librados-config.dir/librados-config.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/librados-config.dir/librados-config.cc.i"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src && /opt/rh/devtoolset-7/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/wuyue/ceph-13.2.2/src/librados-config.cc > CMakeFiles/librados-config.dir/librados-config.cc.i

src/CMakeFiles/librados-config.dir/librados-config.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/librados-config.dir/librados-config.cc.s"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src && /opt/rh/devtoolset-7/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/wuyue/ceph-13.2.2/src/librados-config.cc -o CMakeFiles/librados-config.dir/librados-config.cc.s

# Object files for target librados-config
librados__config_OBJECTS = \
"CMakeFiles/librados-config.dir/librados-config.cc.o"

# External object files for target librados-config
librados__config_EXTERNAL_OBJECTS =

bin/librados-config: src/CMakeFiles/librados-config.dir/librados-config.cc.o
bin/librados-config: src/CMakeFiles/librados-config.dir/build.make
bin/librados-config: lib/librados.so.2.0.0
bin/librados-config: lib/libglobal.a
bin/librados-config: /usr/lib64/libblkid.so
bin/librados-config: /usr/lib64/libibverbs.so
bin/librados-config: lib/libceph-common.so.0
bin/librados-config: /usr/lib64/libblkid.so
bin/librados-config: lib/libjson_spirit.a
bin/librados-config: lib/libcommon_utf8.a
bin/librados-config: lib/liberasure_code.a
bin/librados-config: boost/lib/libboost_thread.a
bin/librados-config: boost/lib/libboost_chrono.a
bin/librados-config: boost/lib/libboost_atomic.a
bin/librados-config: boost/lib/libboost_system.a
bin/librados-config: boost/lib/libboost_random.a
bin/librados-config: boost/lib/libboost_program_options.a
bin/librados-config: boost/lib/libboost_date_time.a
bin/librados-config: boost/lib/libboost_iostreams.a
bin/librados-config: boost/lib/libboost_regex.a
bin/librados-config: /usr/lib64/libssl3.so
bin/librados-config: /usr/lib64/libsmime3.so
bin/librados-config: /usr/lib64/libnss3.so
bin/librados-config: /usr/lib64/libnssutil3.so
bin/librados-config: /usr/lib64/libplds4.so
bin/librados-config: /usr/lib64/libplc4.so
bin/librados-config: /usr/lib64/libnspr4.so
bin/librados-config: /usr/lib64/libssl.so
bin/librados-config: /usr/lib64/libcrypto.so
bin/librados-config: /usr/lib64/libz.so
bin/librados-config: /usr/lib64/libibverbs.so
bin/librados-config: src/CMakeFiles/librados-config.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/wuyue/ceph-13.2.2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../bin/librados-config"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/librados-config.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/CMakeFiles/librados-config.dir/build: bin/librados-config

.PHONY : src/CMakeFiles/librados-config.dir/build

src/CMakeFiles/librados-config.dir/clean:
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src && $(CMAKE_COMMAND) -P CMakeFiles/librados-config.dir/cmake_clean.cmake
.PHONY : src/CMakeFiles/librados-config.dir/clean

src/CMakeFiles/librados-config.dir/depend:
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/wuyue/ceph-13.2.2 /home/wuyue/ceph-13.2.2/src /home/wuyue/ceph-13.2.2/cmake-build-debug /home/wuyue/ceph-13.2.2/cmake-build-debug/src /home/wuyue/ceph-13.2.2/cmake-build-debug/src/CMakeFiles/librados-config.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/CMakeFiles/librados-config.dir/depend

