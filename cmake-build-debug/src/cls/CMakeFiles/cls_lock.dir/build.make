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
include src/cls/CMakeFiles/cls_lock.dir/depend.make

# Include the progress variables for this target.
include src/cls/CMakeFiles/cls_lock.dir/progress.make

# Include the compile flags for this target's objects.
include src/cls/CMakeFiles/cls_lock.dir/flags.make

src/cls/CMakeFiles/cls_lock.dir/lock/cls_lock.cc.o: src/cls/CMakeFiles/cls_lock.dir/flags.make
src/cls/CMakeFiles/cls_lock.dir/lock/cls_lock.cc.o: ../src/cls/lock/cls_lock.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/wuyue/ceph-13.2.2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/cls/CMakeFiles/cls_lock.dir/lock/cls_lock.cc.o"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/cls && /opt/rh/devtoolset-7/root/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/cls_lock.dir/lock/cls_lock.cc.o -c /home/wuyue/ceph-13.2.2/src/cls/lock/cls_lock.cc

src/cls/CMakeFiles/cls_lock.dir/lock/cls_lock.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/cls_lock.dir/lock/cls_lock.cc.i"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/cls && /opt/rh/devtoolset-7/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/wuyue/ceph-13.2.2/src/cls/lock/cls_lock.cc > CMakeFiles/cls_lock.dir/lock/cls_lock.cc.i

src/cls/CMakeFiles/cls_lock.dir/lock/cls_lock.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/cls_lock.dir/lock/cls_lock.cc.s"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/cls && /opt/rh/devtoolset-7/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/wuyue/ceph-13.2.2/src/cls/lock/cls_lock.cc -o CMakeFiles/cls_lock.dir/lock/cls_lock.cc.s

# Object files for target cls_lock
cls_lock_OBJECTS = \
"CMakeFiles/cls_lock.dir/lock/cls_lock.cc.o"

# External object files for target cls_lock
cls_lock_EXTERNAL_OBJECTS =

lib/libcls_lock.so.1.0.0: src/cls/CMakeFiles/cls_lock.dir/lock/cls_lock.cc.o
lib/libcls_lock.so.1.0.0: src/cls/CMakeFiles/cls_lock.dir/build.make
lib/libcls_lock.so.1.0.0: src/cls/CMakeFiles/cls_lock.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/wuyue/ceph-13.2.2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX shared library ../../lib/libcls_lock.so"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/cls && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/cls_lock.dir/link.txt --verbose=$(VERBOSE)
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/cls && $(CMAKE_COMMAND) -E cmake_symlink_library ../../lib/libcls_lock.so.1.0.0 ../../lib/libcls_lock.so.1 ../../lib/libcls_lock.so

lib/libcls_lock.so.1: lib/libcls_lock.so.1.0.0
	@$(CMAKE_COMMAND) -E touch_nocreate lib/libcls_lock.so.1

lib/libcls_lock.so: lib/libcls_lock.so.1.0.0
	@$(CMAKE_COMMAND) -E touch_nocreate lib/libcls_lock.so

# Rule to build all files generated by this target.
src/cls/CMakeFiles/cls_lock.dir/build: lib/libcls_lock.so

.PHONY : src/cls/CMakeFiles/cls_lock.dir/build

src/cls/CMakeFiles/cls_lock.dir/clean:
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/cls && $(CMAKE_COMMAND) -P CMakeFiles/cls_lock.dir/cmake_clean.cmake
.PHONY : src/cls/CMakeFiles/cls_lock.dir/clean

src/cls/CMakeFiles/cls_lock.dir/depend:
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/wuyue/ceph-13.2.2 /home/wuyue/ceph-13.2.2/src/cls /home/wuyue/ceph-13.2.2/cmake-build-debug /home/wuyue/ceph-13.2.2/cmake-build-debug/src/cls /home/wuyue/ceph-13.2.2/cmake-build-debug/src/cls/CMakeFiles/cls_lock.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/cls/CMakeFiles/cls_lock.dir/depend

