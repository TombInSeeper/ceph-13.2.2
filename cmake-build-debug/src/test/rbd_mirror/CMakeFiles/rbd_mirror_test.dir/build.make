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
include src/test/rbd_mirror/CMakeFiles/rbd_mirror_test.dir/depend.make

# Include the progress variables for this target.
include src/test/rbd_mirror/CMakeFiles/rbd_mirror_test.dir/progress.make

# Include the compile flags for this target's objects.
include src/test/rbd_mirror/CMakeFiles/rbd_mirror_test.dir/flags.make

src/test/rbd_mirror/CMakeFiles/rbd_mirror_test.dir/test_ClusterWatcher.cc.o: src/test/rbd_mirror/CMakeFiles/rbd_mirror_test.dir/flags.make
src/test/rbd_mirror/CMakeFiles/rbd_mirror_test.dir/test_ClusterWatcher.cc.o: ../src/test/rbd_mirror/test_ClusterWatcher.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/wuyue/ceph-13.2.2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/test/rbd_mirror/CMakeFiles/rbd_mirror_test.dir/test_ClusterWatcher.cc.o"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/rbd_mirror && /opt/rh/devtoolset-7/root/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/rbd_mirror_test.dir/test_ClusterWatcher.cc.o -c /home/wuyue/ceph-13.2.2/src/test/rbd_mirror/test_ClusterWatcher.cc

src/test/rbd_mirror/CMakeFiles/rbd_mirror_test.dir/test_ClusterWatcher.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/rbd_mirror_test.dir/test_ClusterWatcher.cc.i"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/rbd_mirror && /opt/rh/devtoolset-7/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/wuyue/ceph-13.2.2/src/test/rbd_mirror/test_ClusterWatcher.cc > CMakeFiles/rbd_mirror_test.dir/test_ClusterWatcher.cc.i

src/test/rbd_mirror/CMakeFiles/rbd_mirror_test.dir/test_ClusterWatcher.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/rbd_mirror_test.dir/test_ClusterWatcher.cc.s"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/rbd_mirror && /opt/rh/devtoolset-7/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/wuyue/ceph-13.2.2/src/test/rbd_mirror/test_ClusterWatcher.cc -o CMakeFiles/rbd_mirror_test.dir/test_ClusterWatcher.cc.s

src/test/rbd_mirror/CMakeFiles/rbd_mirror_test.dir/test_PoolWatcher.cc.o: src/test/rbd_mirror/CMakeFiles/rbd_mirror_test.dir/flags.make
src/test/rbd_mirror/CMakeFiles/rbd_mirror_test.dir/test_PoolWatcher.cc.o: ../src/test/rbd_mirror/test_PoolWatcher.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/wuyue/ceph-13.2.2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object src/test/rbd_mirror/CMakeFiles/rbd_mirror_test.dir/test_PoolWatcher.cc.o"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/rbd_mirror && /opt/rh/devtoolset-7/root/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/rbd_mirror_test.dir/test_PoolWatcher.cc.o -c /home/wuyue/ceph-13.2.2/src/test/rbd_mirror/test_PoolWatcher.cc

src/test/rbd_mirror/CMakeFiles/rbd_mirror_test.dir/test_PoolWatcher.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/rbd_mirror_test.dir/test_PoolWatcher.cc.i"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/rbd_mirror && /opt/rh/devtoolset-7/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/wuyue/ceph-13.2.2/src/test/rbd_mirror/test_PoolWatcher.cc > CMakeFiles/rbd_mirror_test.dir/test_PoolWatcher.cc.i

src/test/rbd_mirror/CMakeFiles/rbd_mirror_test.dir/test_PoolWatcher.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/rbd_mirror_test.dir/test_PoolWatcher.cc.s"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/rbd_mirror && /opt/rh/devtoolset-7/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/wuyue/ceph-13.2.2/src/test/rbd_mirror/test_PoolWatcher.cc -o CMakeFiles/rbd_mirror_test.dir/test_PoolWatcher.cc.s

src/test/rbd_mirror/CMakeFiles/rbd_mirror_test.dir/test_ImageDeleter.cc.o: src/test/rbd_mirror/CMakeFiles/rbd_mirror_test.dir/flags.make
src/test/rbd_mirror/CMakeFiles/rbd_mirror_test.dir/test_ImageDeleter.cc.o: ../src/test/rbd_mirror/test_ImageDeleter.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/wuyue/ceph-13.2.2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object src/test/rbd_mirror/CMakeFiles/rbd_mirror_test.dir/test_ImageDeleter.cc.o"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/rbd_mirror && /opt/rh/devtoolset-7/root/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/rbd_mirror_test.dir/test_ImageDeleter.cc.o -c /home/wuyue/ceph-13.2.2/src/test/rbd_mirror/test_ImageDeleter.cc

src/test/rbd_mirror/CMakeFiles/rbd_mirror_test.dir/test_ImageDeleter.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/rbd_mirror_test.dir/test_ImageDeleter.cc.i"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/rbd_mirror && /opt/rh/devtoolset-7/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/wuyue/ceph-13.2.2/src/test/rbd_mirror/test_ImageDeleter.cc > CMakeFiles/rbd_mirror_test.dir/test_ImageDeleter.cc.i

src/test/rbd_mirror/CMakeFiles/rbd_mirror_test.dir/test_ImageDeleter.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/rbd_mirror_test.dir/test_ImageDeleter.cc.s"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/rbd_mirror && /opt/rh/devtoolset-7/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/wuyue/ceph-13.2.2/src/test/rbd_mirror/test_ImageDeleter.cc -o CMakeFiles/rbd_mirror_test.dir/test_ImageDeleter.cc.s

src/test/rbd_mirror/CMakeFiles/rbd_mirror_test.dir/test_ImageReplayer.cc.o: src/test/rbd_mirror/CMakeFiles/rbd_mirror_test.dir/flags.make
src/test/rbd_mirror/CMakeFiles/rbd_mirror_test.dir/test_ImageReplayer.cc.o: ../src/test/rbd_mirror/test_ImageReplayer.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/wuyue/ceph-13.2.2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object src/test/rbd_mirror/CMakeFiles/rbd_mirror_test.dir/test_ImageReplayer.cc.o"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/rbd_mirror && /opt/rh/devtoolset-7/root/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/rbd_mirror_test.dir/test_ImageReplayer.cc.o -c /home/wuyue/ceph-13.2.2/src/test/rbd_mirror/test_ImageReplayer.cc

src/test/rbd_mirror/CMakeFiles/rbd_mirror_test.dir/test_ImageReplayer.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/rbd_mirror_test.dir/test_ImageReplayer.cc.i"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/rbd_mirror && /opt/rh/devtoolset-7/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/wuyue/ceph-13.2.2/src/test/rbd_mirror/test_ImageReplayer.cc > CMakeFiles/rbd_mirror_test.dir/test_ImageReplayer.cc.i

src/test/rbd_mirror/CMakeFiles/rbd_mirror_test.dir/test_ImageReplayer.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/rbd_mirror_test.dir/test_ImageReplayer.cc.s"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/rbd_mirror && /opt/rh/devtoolset-7/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/wuyue/ceph-13.2.2/src/test/rbd_mirror/test_ImageReplayer.cc -o CMakeFiles/rbd_mirror_test.dir/test_ImageReplayer.cc.s

src/test/rbd_mirror/CMakeFiles/rbd_mirror_test.dir/test_ImageSync.cc.o: src/test/rbd_mirror/CMakeFiles/rbd_mirror_test.dir/flags.make
src/test/rbd_mirror/CMakeFiles/rbd_mirror_test.dir/test_ImageSync.cc.o: ../src/test/rbd_mirror/test_ImageSync.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/wuyue/ceph-13.2.2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object src/test/rbd_mirror/CMakeFiles/rbd_mirror_test.dir/test_ImageSync.cc.o"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/rbd_mirror && /opt/rh/devtoolset-7/root/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/rbd_mirror_test.dir/test_ImageSync.cc.o -c /home/wuyue/ceph-13.2.2/src/test/rbd_mirror/test_ImageSync.cc

src/test/rbd_mirror/CMakeFiles/rbd_mirror_test.dir/test_ImageSync.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/rbd_mirror_test.dir/test_ImageSync.cc.i"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/rbd_mirror && /opt/rh/devtoolset-7/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/wuyue/ceph-13.2.2/src/test/rbd_mirror/test_ImageSync.cc > CMakeFiles/rbd_mirror_test.dir/test_ImageSync.cc.i

src/test/rbd_mirror/CMakeFiles/rbd_mirror_test.dir/test_ImageSync.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/rbd_mirror_test.dir/test_ImageSync.cc.s"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/rbd_mirror && /opt/rh/devtoolset-7/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/wuyue/ceph-13.2.2/src/test/rbd_mirror/test_ImageSync.cc -o CMakeFiles/rbd_mirror_test.dir/test_ImageSync.cc.s

src/test/rbd_mirror/CMakeFiles/rbd_mirror_test.dir/test_InstanceWatcher.cc.o: src/test/rbd_mirror/CMakeFiles/rbd_mirror_test.dir/flags.make
src/test/rbd_mirror/CMakeFiles/rbd_mirror_test.dir/test_InstanceWatcher.cc.o: ../src/test/rbd_mirror/test_InstanceWatcher.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/wuyue/ceph-13.2.2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object src/test/rbd_mirror/CMakeFiles/rbd_mirror_test.dir/test_InstanceWatcher.cc.o"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/rbd_mirror && /opt/rh/devtoolset-7/root/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/rbd_mirror_test.dir/test_InstanceWatcher.cc.o -c /home/wuyue/ceph-13.2.2/src/test/rbd_mirror/test_InstanceWatcher.cc

src/test/rbd_mirror/CMakeFiles/rbd_mirror_test.dir/test_InstanceWatcher.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/rbd_mirror_test.dir/test_InstanceWatcher.cc.i"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/rbd_mirror && /opt/rh/devtoolset-7/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/wuyue/ceph-13.2.2/src/test/rbd_mirror/test_InstanceWatcher.cc > CMakeFiles/rbd_mirror_test.dir/test_InstanceWatcher.cc.i

src/test/rbd_mirror/CMakeFiles/rbd_mirror_test.dir/test_InstanceWatcher.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/rbd_mirror_test.dir/test_InstanceWatcher.cc.s"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/rbd_mirror && /opt/rh/devtoolset-7/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/wuyue/ceph-13.2.2/src/test/rbd_mirror/test_InstanceWatcher.cc -o CMakeFiles/rbd_mirror_test.dir/test_InstanceWatcher.cc.s

src/test/rbd_mirror/CMakeFiles/rbd_mirror_test.dir/test_Instances.cc.o: src/test/rbd_mirror/CMakeFiles/rbd_mirror_test.dir/flags.make
src/test/rbd_mirror/CMakeFiles/rbd_mirror_test.dir/test_Instances.cc.o: ../src/test/rbd_mirror/test_Instances.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/wuyue/ceph-13.2.2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building CXX object src/test/rbd_mirror/CMakeFiles/rbd_mirror_test.dir/test_Instances.cc.o"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/rbd_mirror && /opt/rh/devtoolset-7/root/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/rbd_mirror_test.dir/test_Instances.cc.o -c /home/wuyue/ceph-13.2.2/src/test/rbd_mirror/test_Instances.cc

src/test/rbd_mirror/CMakeFiles/rbd_mirror_test.dir/test_Instances.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/rbd_mirror_test.dir/test_Instances.cc.i"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/rbd_mirror && /opt/rh/devtoolset-7/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/wuyue/ceph-13.2.2/src/test/rbd_mirror/test_Instances.cc > CMakeFiles/rbd_mirror_test.dir/test_Instances.cc.i

src/test/rbd_mirror/CMakeFiles/rbd_mirror_test.dir/test_Instances.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/rbd_mirror_test.dir/test_Instances.cc.s"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/rbd_mirror && /opt/rh/devtoolset-7/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/wuyue/ceph-13.2.2/src/test/rbd_mirror/test_Instances.cc -o CMakeFiles/rbd_mirror_test.dir/test_Instances.cc.s

src/test/rbd_mirror/CMakeFiles/rbd_mirror_test.dir/test_LeaderWatcher.cc.o: src/test/rbd_mirror/CMakeFiles/rbd_mirror_test.dir/flags.make
src/test/rbd_mirror/CMakeFiles/rbd_mirror_test.dir/test_LeaderWatcher.cc.o: ../src/test/rbd_mirror/test_LeaderWatcher.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/wuyue/ceph-13.2.2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building CXX object src/test/rbd_mirror/CMakeFiles/rbd_mirror_test.dir/test_LeaderWatcher.cc.o"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/rbd_mirror && /opt/rh/devtoolset-7/root/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/rbd_mirror_test.dir/test_LeaderWatcher.cc.o -c /home/wuyue/ceph-13.2.2/src/test/rbd_mirror/test_LeaderWatcher.cc

src/test/rbd_mirror/CMakeFiles/rbd_mirror_test.dir/test_LeaderWatcher.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/rbd_mirror_test.dir/test_LeaderWatcher.cc.i"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/rbd_mirror && /opt/rh/devtoolset-7/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/wuyue/ceph-13.2.2/src/test/rbd_mirror/test_LeaderWatcher.cc > CMakeFiles/rbd_mirror_test.dir/test_LeaderWatcher.cc.i

src/test/rbd_mirror/CMakeFiles/rbd_mirror_test.dir/test_LeaderWatcher.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/rbd_mirror_test.dir/test_LeaderWatcher.cc.s"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/rbd_mirror && /opt/rh/devtoolset-7/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/wuyue/ceph-13.2.2/src/test/rbd_mirror/test_LeaderWatcher.cc -o CMakeFiles/rbd_mirror_test.dir/test_LeaderWatcher.cc.s

src/test/rbd_mirror/CMakeFiles/rbd_mirror_test.dir/test_fixture.cc.o: src/test/rbd_mirror/CMakeFiles/rbd_mirror_test.dir/flags.make
src/test/rbd_mirror/CMakeFiles/rbd_mirror_test.dir/test_fixture.cc.o: ../src/test/rbd_mirror/test_fixture.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/wuyue/ceph-13.2.2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Building CXX object src/test/rbd_mirror/CMakeFiles/rbd_mirror_test.dir/test_fixture.cc.o"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/rbd_mirror && /opt/rh/devtoolset-7/root/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/rbd_mirror_test.dir/test_fixture.cc.o -c /home/wuyue/ceph-13.2.2/src/test/rbd_mirror/test_fixture.cc

src/test/rbd_mirror/CMakeFiles/rbd_mirror_test.dir/test_fixture.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/rbd_mirror_test.dir/test_fixture.cc.i"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/rbd_mirror && /opt/rh/devtoolset-7/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/wuyue/ceph-13.2.2/src/test/rbd_mirror/test_fixture.cc > CMakeFiles/rbd_mirror_test.dir/test_fixture.cc.i

src/test/rbd_mirror/CMakeFiles/rbd_mirror_test.dir/test_fixture.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/rbd_mirror_test.dir/test_fixture.cc.s"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/rbd_mirror && /opt/rh/devtoolset-7/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/wuyue/ceph-13.2.2/src/test/rbd_mirror/test_fixture.cc -o CMakeFiles/rbd_mirror_test.dir/test_fixture.cc.s

src/test/rbd_mirror/CMakeFiles/rbd_mirror_test.dir/image_map/test_Policy.cc.o: src/test/rbd_mirror/CMakeFiles/rbd_mirror_test.dir/flags.make
src/test/rbd_mirror/CMakeFiles/rbd_mirror_test.dir/image_map/test_Policy.cc.o: ../src/test/rbd_mirror/image_map/test_Policy.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/wuyue/ceph-13.2.2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_10) "Building CXX object src/test/rbd_mirror/CMakeFiles/rbd_mirror_test.dir/image_map/test_Policy.cc.o"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/rbd_mirror && /opt/rh/devtoolset-7/root/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/rbd_mirror_test.dir/image_map/test_Policy.cc.o -c /home/wuyue/ceph-13.2.2/src/test/rbd_mirror/image_map/test_Policy.cc

src/test/rbd_mirror/CMakeFiles/rbd_mirror_test.dir/image_map/test_Policy.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/rbd_mirror_test.dir/image_map/test_Policy.cc.i"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/rbd_mirror && /opt/rh/devtoolset-7/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/wuyue/ceph-13.2.2/src/test/rbd_mirror/image_map/test_Policy.cc > CMakeFiles/rbd_mirror_test.dir/image_map/test_Policy.cc.i

src/test/rbd_mirror/CMakeFiles/rbd_mirror_test.dir/image_map/test_Policy.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/rbd_mirror_test.dir/image_map/test_Policy.cc.s"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/rbd_mirror && /opt/rh/devtoolset-7/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/wuyue/ceph-13.2.2/src/test/rbd_mirror/image_map/test_Policy.cc -o CMakeFiles/rbd_mirror_test.dir/image_map/test_Policy.cc.s

# Object files for target rbd_mirror_test
rbd_mirror_test_OBJECTS = \
"CMakeFiles/rbd_mirror_test.dir/test_ClusterWatcher.cc.o" \
"CMakeFiles/rbd_mirror_test.dir/test_PoolWatcher.cc.o" \
"CMakeFiles/rbd_mirror_test.dir/test_ImageDeleter.cc.o" \
"CMakeFiles/rbd_mirror_test.dir/test_ImageReplayer.cc.o" \
"CMakeFiles/rbd_mirror_test.dir/test_ImageSync.cc.o" \
"CMakeFiles/rbd_mirror_test.dir/test_InstanceWatcher.cc.o" \
"CMakeFiles/rbd_mirror_test.dir/test_Instances.cc.o" \
"CMakeFiles/rbd_mirror_test.dir/test_LeaderWatcher.cc.o" \
"CMakeFiles/rbd_mirror_test.dir/test_fixture.cc.o" \
"CMakeFiles/rbd_mirror_test.dir/image_map/test_Policy.cc.o"

# External object files for target rbd_mirror_test
rbd_mirror_test_EXTERNAL_OBJECTS =

lib/librbd_mirror_test.a: src/test/rbd_mirror/CMakeFiles/rbd_mirror_test.dir/test_ClusterWatcher.cc.o
lib/librbd_mirror_test.a: src/test/rbd_mirror/CMakeFiles/rbd_mirror_test.dir/test_PoolWatcher.cc.o
lib/librbd_mirror_test.a: src/test/rbd_mirror/CMakeFiles/rbd_mirror_test.dir/test_ImageDeleter.cc.o
lib/librbd_mirror_test.a: src/test/rbd_mirror/CMakeFiles/rbd_mirror_test.dir/test_ImageReplayer.cc.o
lib/librbd_mirror_test.a: src/test/rbd_mirror/CMakeFiles/rbd_mirror_test.dir/test_ImageSync.cc.o
lib/librbd_mirror_test.a: src/test/rbd_mirror/CMakeFiles/rbd_mirror_test.dir/test_InstanceWatcher.cc.o
lib/librbd_mirror_test.a: src/test/rbd_mirror/CMakeFiles/rbd_mirror_test.dir/test_Instances.cc.o
lib/librbd_mirror_test.a: src/test/rbd_mirror/CMakeFiles/rbd_mirror_test.dir/test_LeaderWatcher.cc.o
lib/librbd_mirror_test.a: src/test/rbd_mirror/CMakeFiles/rbd_mirror_test.dir/test_fixture.cc.o
lib/librbd_mirror_test.a: src/test/rbd_mirror/CMakeFiles/rbd_mirror_test.dir/image_map/test_Policy.cc.o
lib/librbd_mirror_test.a: src/test/rbd_mirror/CMakeFiles/rbd_mirror_test.dir/build.make
lib/librbd_mirror_test.a: src/test/rbd_mirror/CMakeFiles/rbd_mirror_test.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/wuyue/ceph-13.2.2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_11) "Linking CXX static library ../../../lib/librbd_mirror_test.a"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/rbd_mirror && $(CMAKE_COMMAND) -P CMakeFiles/rbd_mirror_test.dir/cmake_clean_target.cmake
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/rbd_mirror && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/rbd_mirror_test.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/test/rbd_mirror/CMakeFiles/rbd_mirror_test.dir/build: lib/librbd_mirror_test.a

.PHONY : src/test/rbd_mirror/CMakeFiles/rbd_mirror_test.dir/build

src/test/rbd_mirror/CMakeFiles/rbd_mirror_test.dir/clean:
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/rbd_mirror && $(CMAKE_COMMAND) -P CMakeFiles/rbd_mirror_test.dir/cmake_clean.cmake
.PHONY : src/test/rbd_mirror/CMakeFiles/rbd_mirror_test.dir/clean

src/test/rbd_mirror/CMakeFiles/rbd_mirror_test.dir/depend:
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/wuyue/ceph-13.2.2 /home/wuyue/ceph-13.2.2/src/test/rbd_mirror /home/wuyue/ceph-13.2.2/cmake-build-debug /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/rbd_mirror /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/rbd_mirror/CMakeFiles/rbd_mirror_test.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/test/rbd_mirror/CMakeFiles/rbd_mirror_test.dir/depend

