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
include src/test/librbd/CMakeFiles/ceph_test_librbd_api.dir/depend.make

# Include the progress variables for this target.
include src/test/librbd/CMakeFiles/ceph_test_librbd_api.dir/progress.make

# Include the compile flags for this target's objects.
include src/test/librbd/CMakeFiles/ceph_test_librbd_api.dir/flags.make

src/test/librbd/CMakeFiles/ceph_test_librbd_api.dir/test_support.cc.o: src/test/librbd/CMakeFiles/ceph_test_librbd_api.dir/flags.make
src/test/librbd/CMakeFiles/ceph_test_librbd_api.dir/test_support.cc.o: ../src/test/librbd/test_support.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/wuyue/ceph-13.2.2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/test/librbd/CMakeFiles/ceph_test_librbd_api.dir/test_support.cc.o"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/librbd && /opt/rh/devtoolset-7/root/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/ceph_test_librbd_api.dir/test_support.cc.o -c /home/wuyue/ceph-13.2.2/src/test/librbd/test_support.cc

src/test/librbd/CMakeFiles/ceph_test_librbd_api.dir/test_support.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ceph_test_librbd_api.dir/test_support.cc.i"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/librbd && /opt/rh/devtoolset-7/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/wuyue/ceph-13.2.2/src/test/librbd/test_support.cc > CMakeFiles/ceph_test_librbd_api.dir/test_support.cc.i

src/test/librbd/CMakeFiles/ceph_test_librbd_api.dir/test_support.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ceph_test_librbd_api.dir/test_support.cc.s"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/librbd && /opt/rh/devtoolset-7/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/wuyue/ceph-13.2.2/src/test/librbd/test_support.cc -o CMakeFiles/ceph_test_librbd_api.dir/test_support.cc.s

src/test/librbd/CMakeFiles/ceph_test_librbd_api.dir/test_librbd.cc.o: src/test/librbd/CMakeFiles/ceph_test_librbd_api.dir/flags.make
src/test/librbd/CMakeFiles/ceph_test_librbd_api.dir/test_librbd.cc.o: ../src/test/librbd/test_librbd.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/wuyue/ceph-13.2.2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object src/test/librbd/CMakeFiles/ceph_test_librbd_api.dir/test_librbd.cc.o"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/librbd && /opt/rh/devtoolset-7/root/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/ceph_test_librbd_api.dir/test_librbd.cc.o -c /home/wuyue/ceph-13.2.2/src/test/librbd/test_librbd.cc

src/test/librbd/CMakeFiles/ceph_test_librbd_api.dir/test_librbd.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ceph_test_librbd_api.dir/test_librbd.cc.i"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/librbd && /opt/rh/devtoolset-7/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/wuyue/ceph-13.2.2/src/test/librbd/test_librbd.cc > CMakeFiles/ceph_test_librbd_api.dir/test_librbd.cc.i

src/test/librbd/CMakeFiles/ceph_test_librbd_api.dir/test_librbd.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ceph_test_librbd_api.dir/test_librbd.cc.s"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/librbd && /opt/rh/devtoolset-7/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/wuyue/ceph-13.2.2/src/test/librbd/test_librbd.cc -o CMakeFiles/ceph_test_librbd_api.dir/test_librbd.cc.s

src/test/librbd/CMakeFiles/ceph_test_librbd_api.dir/test_main.cc.o: src/test/librbd/CMakeFiles/ceph_test_librbd_api.dir/flags.make
src/test/librbd/CMakeFiles/ceph_test_librbd_api.dir/test_main.cc.o: ../src/test/librbd/test_main.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/wuyue/ceph-13.2.2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object src/test/librbd/CMakeFiles/ceph_test_librbd_api.dir/test_main.cc.o"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/librbd && /opt/rh/devtoolset-7/root/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/ceph_test_librbd_api.dir/test_main.cc.o -c /home/wuyue/ceph-13.2.2/src/test/librbd/test_main.cc

src/test/librbd/CMakeFiles/ceph_test_librbd_api.dir/test_main.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ceph_test_librbd_api.dir/test_main.cc.i"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/librbd && /opt/rh/devtoolset-7/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/wuyue/ceph-13.2.2/src/test/librbd/test_main.cc > CMakeFiles/ceph_test_librbd_api.dir/test_main.cc.i

src/test/librbd/CMakeFiles/ceph_test_librbd_api.dir/test_main.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ceph_test_librbd_api.dir/test_main.cc.s"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/librbd && /opt/rh/devtoolset-7/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/wuyue/ceph-13.2.2/src/test/librbd/test_main.cc -o CMakeFiles/ceph_test_librbd_api.dir/test_main.cc.s

# Object files for target ceph_test_librbd_api
ceph_test_librbd_api_OBJECTS = \
"CMakeFiles/ceph_test_librbd_api.dir/test_support.cc.o" \
"CMakeFiles/ceph_test_librbd_api.dir/test_librbd.cc.o" \
"CMakeFiles/ceph_test_librbd_api.dir/test_main.cc.o"

# External object files for target ceph_test_librbd_api
ceph_test_librbd_api_EXTERNAL_OBJECTS = \
"/home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/librados/CMakeFiles/libradostest_obj.dir/test.cc.o" \
"/home/wuyue/ceph-13.2.2/cmake-build-debug/src/CMakeFiles/common_texttable_obj.dir/common/TextTable.cc.o"

bin/ceph_test_librbd_api: src/test/librbd/CMakeFiles/ceph_test_librbd_api.dir/test_support.cc.o
bin/ceph_test_librbd_api: src/test/librbd/CMakeFiles/ceph_test_librbd_api.dir/test_librbd.cc.o
bin/ceph_test_librbd_api: src/test/librbd/CMakeFiles/ceph_test_librbd_api.dir/test_main.cc.o
bin/ceph_test_librbd_api: src/test/librados/CMakeFiles/libradostest_obj.dir/test.cc.o
bin/ceph_test_librbd_api: src/CMakeFiles/common_texttable_obj.dir/common/TextTable.cc.o
bin/ceph_test_librbd_api: src/test/librbd/CMakeFiles/ceph_test_librbd_api.dir/build.make
bin/ceph_test_librbd_api: lib/librbd.so.1.12.0
bin/ceph_test_librbd_api: lib/librados.so.2.0.0
bin/ceph_test_librbd_api: lib/libgmock_main.a
bin/ceph_test_librbd_api: lib/libgmock.a
bin/ceph_test_librbd_api: lib/libgtest.a
bin/ceph_test_librbd_api: src/test/librbd/CMakeFiles/ceph_test_librbd_api.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/wuyue/ceph-13.2.2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking CXX executable ../../../bin/ceph_test_librbd_api"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/librbd && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/ceph_test_librbd_api.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/test/librbd/CMakeFiles/ceph_test_librbd_api.dir/build: bin/ceph_test_librbd_api

.PHONY : src/test/librbd/CMakeFiles/ceph_test_librbd_api.dir/build

src/test/librbd/CMakeFiles/ceph_test_librbd_api.dir/clean:
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/librbd && $(CMAKE_COMMAND) -P CMakeFiles/ceph_test_librbd_api.dir/cmake_clean.cmake
.PHONY : src/test/librbd/CMakeFiles/ceph_test_librbd_api.dir/clean

src/test/librbd/CMakeFiles/ceph_test_librbd_api.dir/depend:
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/wuyue/ceph-13.2.2 /home/wuyue/ceph-13.2.2/src/test/librbd /home/wuyue/ceph-13.2.2/cmake-build-debug /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/librbd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/librbd/CMakeFiles/ceph_test_librbd_api.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/test/librbd/CMakeFiles/ceph_test_librbd_api.dir/depend

