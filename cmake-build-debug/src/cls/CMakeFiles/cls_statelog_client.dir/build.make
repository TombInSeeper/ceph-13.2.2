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
include src/cls/CMakeFiles/cls_statelog_client.dir/depend.make

# Include the progress variables for this target.
include src/cls/CMakeFiles/cls_statelog_client.dir/progress.make

# Include the compile flags for this target's objects.
include src/cls/CMakeFiles/cls_statelog_client.dir/flags.make

src/cls/CMakeFiles/cls_statelog_client.dir/statelog/cls_statelog_client.cc.o: src/cls/CMakeFiles/cls_statelog_client.dir/flags.make
src/cls/CMakeFiles/cls_statelog_client.dir/statelog/cls_statelog_client.cc.o: ../src/cls/statelog/cls_statelog_client.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/wuyue/ceph-13.2.2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/cls/CMakeFiles/cls_statelog_client.dir/statelog/cls_statelog_client.cc.o"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/cls && /opt/rh/devtoolset-7/root/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/cls_statelog_client.dir/statelog/cls_statelog_client.cc.o -c /home/wuyue/ceph-13.2.2/src/cls/statelog/cls_statelog_client.cc

src/cls/CMakeFiles/cls_statelog_client.dir/statelog/cls_statelog_client.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/cls_statelog_client.dir/statelog/cls_statelog_client.cc.i"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/cls && /opt/rh/devtoolset-7/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/wuyue/ceph-13.2.2/src/cls/statelog/cls_statelog_client.cc > CMakeFiles/cls_statelog_client.dir/statelog/cls_statelog_client.cc.i

src/cls/CMakeFiles/cls_statelog_client.dir/statelog/cls_statelog_client.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/cls_statelog_client.dir/statelog/cls_statelog_client.cc.s"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/cls && /opt/rh/devtoolset-7/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/wuyue/ceph-13.2.2/src/cls/statelog/cls_statelog_client.cc -o CMakeFiles/cls_statelog_client.dir/statelog/cls_statelog_client.cc.s

# Object files for target cls_statelog_client
cls_statelog_client_OBJECTS = \
"CMakeFiles/cls_statelog_client.dir/statelog/cls_statelog_client.cc.o"

# External object files for target cls_statelog_client
cls_statelog_client_EXTERNAL_OBJECTS =

lib/libcls_statelog_client.a: src/cls/CMakeFiles/cls_statelog_client.dir/statelog/cls_statelog_client.cc.o
lib/libcls_statelog_client.a: src/cls/CMakeFiles/cls_statelog_client.dir/build.make
lib/libcls_statelog_client.a: src/cls/CMakeFiles/cls_statelog_client.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/wuyue/ceph-13.2.2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX static library ../../lib/libcls_statelog_client.a"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/cls && $(CMAKE_COMMAND) -P CMakeFiles/cls_statelog_client.dir/cmake_clean_target.cmake
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/cls && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/cls_statelog_client.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/cls/CMakeFiles/cls_statelog_client.dir/build: lib/libcls_statelog_client.a

.PHONY : src/cls/CMakeFiles/cls_statelog_client.dir/build

src/cls/CMakeFiles/cls_statelog_client.dir/clean:
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/cls && $(CMAKE_COMMAND) -P CMakeFiles/cls_statelog_client.dir/cmake_clean.cmake
.PHONY : src/cls/CMakeFiles/cls_statelog_client.dir/clean

src/cls/CMakeFiles/cls_statelog_client.dir/depend:
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/wuyue/ceph-13.2.2 /home/wuyue/ceph-13.2.2/src/cls /home/wuyue/ceph-13.2.2/cmake-build-debug /home/wuyue/ceph-13.2.2/cmake-build-debug/src/cls /home/wuyue/ceph-13.2.2/cmake-build-debug/src/cls/CMakeFiles/cls_statelog_client.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/cls/CMakeFiles/cls_statelog_client.dir/depend

