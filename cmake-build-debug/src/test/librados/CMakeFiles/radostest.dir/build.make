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
include src/test/librados/CMakeFiles/radostest.dir/depend.make

# Include the progress variables for this target.
include src/test/librados/CMakeFiles/radostest.dir/progress.make

# Include the compile flags for this target's objects.
include src/test/librados/CMakeFiles/radostest.dir/flags.make

src/test/librados/CMakeFiles/radostest.dir/test_common.cc.o: src/test/librados/CMakeFiles/radostest.dir/flags.make
src/test/librados/CMakeFiles/radostest.dir/test_common.cc.o: ../src/test/librados/test_common.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/wuyue/ceph-13.2.2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/test/librados/CMakeFiles/radostest.dir/test_common.cc.o"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/librados && /opt/rh/devtoolset-7/root/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/radostest.dir/test_common.cc.o -c /home/wuyue/ceph-13.2.2/src/test/librados/test_common.cc

src/test/librados/CMakeFiles/radostest.dir/test_common.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/radostest.dir/test_common.cc.i"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/librados && /opt/rh/devtoolset-7/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/wuyue/ceph-13.2.2/src/test/librados/test_common.cc > CMakeFiles/radostest.dir/test_common.cc.i

src/test/librados/CMakeFiles/radostest.dir/test_common.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/radostest.dir/test_common.cc.s"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/librados && /opt/rh/devtoolset-7/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/wuyue/ceph-13.2.2/src/test/librados/test_common.cc -o CMakeFiles/radostest.dir/test_common.cc.s

src/test/librados/CMakeFiles/radostest.dir/TestCase.cc.o: src/test/librados/CMakeFiles/radostest.dir/flags.make
src/test/librados/CMakeFiles/radostest.dir/TestCase.cc.o: ../src/test/librados/TestCase.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/wuyue/ceph-13.2.2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object src/test/librados/CMakeFiles/radostest.dir/TestCase.cc.o"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/librados && /opt/rh/devtoolset-7/root/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/radostest.dir/TestCase.cc.o -c /home/wuyue/ceph-13.2.2/src/test/librados/TestCase.cc

src/test/librados/CMakeFiles/radostest.dir/TestCase.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/radostest.dir/TestCase.cc.i"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/librados && /opt/rh/devtoolset-7/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/wuyue/ceph-13.2.2/src/test/librados/TestCase.cc > CMakeFiles/radostest.dir/TestCase.cc.i

src/test/librados/CMakeFiles/radostest.dir/TestCase.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/radostest.dir/TestCase.cc.s"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/librados && /opt/rh/devtoolset-7/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/wuyue/ceph-13.2.2/src/test/librados/TestCase.cc -o CMakeFiles/radostest.dir/TestCase.cc.s

# Object files for target radostest
radostest_OBJECTS = \
"CMakeFiles/radostest.dir/test_common.cc.o" \
"CMakeFiles/radostest.dir/TestCase.cc.o"

# External object files for target radostest
radostest_EXTERNAL_OBJECTS = \
"/home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/librados/CMakeFiles/libradostest_obj.dir/test.cc.o"

lib/libradostest.a: src/test/librados/CMakeFiles/radostest.dir/test_common.cc.o
lib/libradostest.a: src/test/librados/CMakeFiles/radostest.dir/TestCase.cc.o
lib/libradostest.a: src/test/librados/CMakeFiles/libradostest_obj.dir/test.cc.o
lib/libradostest.a: src/test/librados/CMakeFiles/radostest.dir/build.make
lib/libradostest.a: src/test/librados/CMakeFiles/radostest.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/wuyue/ceph-13.2.2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX static library ../../../lib/libradostest.a"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/librados && $(CMAKE_COMMAND) -P CMakeFiles/radostest.dir/cmake_clean_target.cmake
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/librados && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/radostest.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/test/librados/CMakeFiles/radostest.dir/build: lib/libradostest.a

.PHONY : src/test/librados/CMakeFiles/radostest.dir/build

src/test/librados/CMakeFiles/radostest.dir/clean:
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/librados && $(CMAKE_COMMAND) -P CMakeFiles/radostest.dir/cmake_clean.cmake
.PHONY : src/test/librados/CMakeFiles/radostest.dir/clean

src/test/librados/CMakeFiles/radostest.dir/depend:
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/wuyue/ceph-13.2.2 /home/wuyue/ceph-13.2.2/src/test/librados /home/wuyue/ceph-13.2.2/cmake-build-debug /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/librados /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/librados/CMakeFiles/radostest.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/test/librados/CMakeFiles/radostest.dir/depend

