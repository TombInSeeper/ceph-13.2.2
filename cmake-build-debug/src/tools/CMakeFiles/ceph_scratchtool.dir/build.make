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
include src/tools/CMakeFiles/ceph_scratchtool.dir/depend.make

# Include the progress variables for this target.
include src/tools/CMakeFiles/ceph_scratchtool.dir/progress.make

# Include the compile flags for this target's objects.
include src/tools/CMakeFiles/ceph_scratchtool.dir/flags.make

src/tools/CMakeFiles/ceph_scratchtool.dir/scratchtool.c.o: src/tools/CMakeFiles/ceph_scratchtool.dir/flags.make
src/tools/CMakeFiles/ceph_scratchtool.dir/scratchtool.c.o: ../src/tools/scratchtool.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/wuyue/ceph-13.2.2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object src/tools/CMakeFiles/ceph_scratchtool.dir/scratchtool.c.o"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/tools && /opt/rh/devtoolset-7/root/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/ceph_scratchtool.dir/scratchtool.c.o   -c /home/wuyue/ceph-13.2.2/src/tools/scratchtool.c

src/tools/CMakeFiles/ceph_scratchtool.dir/scratchtool.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/ceph_scratchtool.dir/scratchtool.c.i"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/tools && /opt/rh/devtoolset-7/root/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/wuyue/ceph-13.2.2/src/tools/scratchtool.c > CMakeFiles/ceph_scratchtool.dir/scratchtool.c.i

src/tools/CMakeFiles/ceph_scratchtool.dir/scratchtool.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/ceph_scratchtool.dir/scratchtool.c.s"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/tools && /opt/rh/devtoolset-7/root/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/wuyue/ceph-13.2.2/src/tools/scratchtool.c -o CMakeFiles/ceph_scratchtool.dir/scratchtool.c.s

# Object files for target ceph_scratchtool
ceph_scratchtool_OBJECTS = \
"CMakeFiles/ceph_scratchtool.dir/scratchtool.c.o"

# External object files for target ceph_scratchtool
ceph_scratchtool_EXTERNAL_OBJECTS =

bin/ceph_scratchtool: src/tools/CMakeFiles/ceph_scratchtool.dir/scratchtool.c.o
bin/ceph_scratchtool: src/tools/CMakeFiles/ceph_scratchtool.dir/build.make
bin/ceph_scratchtool: lib/librados.so.2.0.0
bin/ceph_scratchtool: lib/libglobal.a
bin/ceph_scratchtool: lib/libceph-common.so.0
bin/ceph_scratchtool: lib/libjson_spirit.a
bin/ceph_scratchtool: lib/libcommon_utf8.a
bin/ceph_scratchtool: lib/liberasure_code.a
bin/ceph_scratchtool: boost/lib/libboost_thread.a
bin/ceph_scratchtool: boost/lib/libboost_chrono.a
bin/ceph_scratchtool: boost/lib/libboost_atomic.a
bin/ceph_scratchtool: boost/lib/libboost_system.a
bin/ceph_scratchtool: boost/lib/libboost_random.a
bin/ceph_scratchtool: boost/lib/libboost_program_options.a
bin/ceph_scratchtool: boost/lib/libboost_date_time.a
bin/ceph_scratchtool: boost/lib/libboost_iostreams.a
bin/ceph_scratchtool: boost/lib/libboost_regex.a
bin/ceph_scratchtool: /usr/lib64/libblkid.so
bin/ceph_scratchtool: /usr/lib64/libssl3.so
bin/ceph_scratchtool: /usr/lib64/libsmime3.so
bin/ceph_scratchtool: /usr/lib64/libnss3.so
bin/ceph_scratchtool: /usr/lib64/libnssutil3.so
bin/ceph_scratchtool: /usr/lib64/libplds4.so
bin/ceph_scratchtool: /usr/lib64/libplc4.so
bin/ceph_scratchtool: /usr/lib64/libnspr4.so
bin/ceph_scratchtool: /usr/lib64/libssl.so
bin/ceph_scratchtool: /usr/lib64/libcrypto.so
bin/ceph_scratchtool: /usr/lib64/libz.so
bin/ceph_scratchtool: /usr/lib64/libibverbs.so
bin/ceph_scratchtool: src/tools/CMakeFiles/ceph_scratchtool.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/wuyue/ceph-13.2.2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../../bin/ceph_scratchtool"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/tools && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/ceph_scratchtool.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/tools/CMakeFiles/ceph_scratchtool.dir/build: bin/ceph_scratchtool

.PHONY : src/tools/CMakeFiles/ceph_scratchtool.dir/build

src/tools/CMakeFiles/ceph_scratchtool.dir/clean:
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/tools && $(CMAKE_COMMAND) -P CMakeFiles/ceph_scratchtool.dir/cmake_clean.cmake
.PHONY : src/tools/CMakeFiles/ceph_scratchtool.dir/clean

src/tools/CMakeFiles/ceph_scratchtool.dir/depend:
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/wuyue/ceph-13.2.2 /home/wuyue/ceph-13.2.2/src/tools /home/wuyue/ceph-13.2.2/cmake-build-debug /home/wuyue/ceph-13.2.2/cmake-build-debug/src/tools /home/wuyue/ceph-13.2.2/cmake-build-debug/src/tools/CMakeFiles/ceph_scratchtool.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/tools/CMakeFiles/ceph_scratchtool.dir/depend

