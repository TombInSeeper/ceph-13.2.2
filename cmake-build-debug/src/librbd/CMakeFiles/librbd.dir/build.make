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
include src/librbd/CMakeFiles/librbd.dir/depend.make

# Include the progress variables for this target.
include src/librbd/CMakeFiles/librbd.dir/progress.make

# Include the compile flags for this target's objects.
include src/librbd/CMakeFiles/librbd.dir/flags.make

src/librbd/CMakeFiles/librbd.dir/librbd.cc.o: src/librbd/CMakeFiles/librbd.dir/flags.make
src/librbd/CMakeFiles/librbd.dir/librbd.cc.o: ../src/librbd/librbd.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/wuyue/ceph-13.2.2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/librbd/CMakeFiles/librbd.dir/librbd.cc.o"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/librbd && /opt/rh/devtoolset-7/root/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/librbd.dir/librbd.cc.o -c /home/wuyue/ceph-13.2.2/src/librbd/librbd.cc

src/librbd/CMakeFiles/librbd.dir/librbd.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/librbd.dir/librbd.cc.i"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/librbd && /opt/rh/devtoolset-7/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/wuyue/ceph-13.2.2/src/librbd/librbd.cc > CMakeFiles/librbd.dir/librbd.cc.i

src/librbd/CMakeFiles/librbd.dir/librbd.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/librbd.dir/librbd.cc.s"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/librbd && /opt/rh/devtoolset-7/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/wuyue/ceph-13.2.2/src/librbd/librbd.cc -o CMakeFiles/librbd.dir/librbd.cc.s

# Object files for target librbd
librbd_OBJECTS = \
"CMakeFiles/librbd.dir/librbd.cc.o"

# External object files for target librbd
librbd_EXTERNAL_OBJECTS =

lib/librbd.so.1.12.0: src/librbd/CMakeFiles/librbd.dir/librbd.cc.o
lib/librbd.so.1.12.0: src/librbd/CMakeFiles/librbd.dir/build.make
lib/librbd.so.1.12.0: lib/librbd_internal.a
lib/librbd.so.1.12.0: lib/librbd_types.a
lib/librbd.so.1.12.0: lib/libjournal.a
lib/librbd.so.1.12.0: lib/librados.so.2.0.0
lib/librbd.so.1.12.0: lib/libcls_rbd_client.a
lib/librbd.so.1.12.0: lib/libcls_lock_client.a
lib/librbd.so.1.12.0: lib/libcls_journal_client.a
lib/librbd.so.1.12.0: lib/libceph-common.so.0
lib/librbd.so.1.12.0: /usr/lib64/libibverbs.so
lib/librbd.so.1.12.0: lib/libosdc.a
lib/librbd.so.1.12.0: lib/libjson_spirit.a
lib/librbd.so.1.12.0: lib/libcommon_utf8.a
lib/librbd.so.1.12.0: lib/liberasure_code.a
lib/librbd.so.1.12.0: boost/lib/libboost_thread.a
lib/librbd.so.1.12.0: boost/lib/libboost_chrono.a
lib/librbd.so.1.12.0: boost/lib/libboost_atomic.a
lib/librbd.so.1.12.0: boost/lib/libboost_system.a
lib/librbd.so.1.12.0: boost/lib/libboost_random.a
lib/librbd.so.1.12.0: boost/lib/libboost_program_options.a
lib/librbd.so.1.12.0: boost/lib/libboost_date_time.a
lib/librbd.so.1.12.0: boost/lib/libboost_iostreams.a
lib/librbd.so.1.12.0: boost/lib/libboost_regex.a
lib/librbd.so.1.12.0: /usr/lib64/libblkid.so
lib/librbd.so.1.12.0: /usr/lib64/libssl3.so
lib/librbd.so.1.12.0: /usr/lib64/libsmime3.so
lib/librbd.so.1.12.0: /usr/lib64/libnss3.so
lib/librbd.so.1.12.0: /usr/lib64/libnssutil3.so
lib/librbd.so.1.12.0: /usr/lib64/libplds4.so
lib/librbd.so.1.12.0: /usr/lib64/libplc4.so
lib/librbd.so.1.12.0: /usr/lib64/libnspr4.so
lib/librbd.so.1.12.0: /usr/lib64/libssl.so
lib/librbd.so.1.12.0: /usr/lib64/libcrypto.so
lib/librbd.so.1.12.0: /usr/lib64/libz.so
lib/librbd.so.1.12.0: /usr/lib64/libibverbs.so
lib/librbd.so.1.12.0: src/librbd/CMakeFiles/librbd.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/wuyue/ceph-13.2.2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX shared library ../../lib/librbd.so"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/librbd && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/librbd.dir/link.txt --verbose=$(VERBOSE)
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/librbd && $(CMAKE_COMMAND) -E cmake_symlink_library ../../lib/librbd.so.1.12.0 ../../lib/librbd.so.1 ../../lib/librbd.so

lib/librbd.so.1: lib/librbd.so.1.12.0
	@$(CMAKE_COMMAND) -E touch_nocreate lib/librbd.so.1

lib/librbd.so: lib/librbd.so.1.12.0
	@$(CMAKE_COMMAND) -E touch_nocreate lib/librbd.so

# Rule to build all files generated by this target.
src/librbd/CMakeFiles/librbd.dir/build: lib/librbd.so

.PHONY : src/librbd/CMakeFiles/librbd.dir/build

src/librbd/CMakeFiles/librbd.dir/clean:
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/librbd && $(CMAKE_COMMAND) -P CMakeFiles/librbd.dir/cmake_clean.cmake
.PHONY : src/librbd/CMakeFiles/librbd.dir/clean

src/librbd/CMakeFiles/librbd.dir/depend:
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/wuyue/ceph-13.2.2 /home/wuyue/ceph-13.2.2/src/librbd /home/wuyue/ceph-13.2.2/cmake-build-debug /home/wuyue/ceph-13.2.2/cmake-build-debug/src/librbd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/librbd/CMakeFiles/librbd.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/librbd/CMakeFiles/librbd.dir/depend

