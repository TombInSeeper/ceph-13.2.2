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
include src/librbd/CMakeFiles/rbd_types.dir/depend.make

# Include the progress variables for this target.
include src/librbd/CMakeFiles/rbd_types.dir/progress.make

# Include the compile flags for this target's objects.
include src/librbd/CMakeFiles/rbd_types.dir/flags.make

src/librbd/CMakeFiles/rbd_types.dir/journal/Types.cc.o: src/librbd/CMakeFiles/rbd_types.dir/flags.make
src/librbd/CMakeFiles/rbd_types.dir/journal/Types.cc.o: ../src/librbd/journal/Types.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/wuyue/ceph-13.2.2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/librbd/CMakeFiles/rbd_types.dir/journal/Types.cc.o"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/librbd && /opt/rh/devtoolset-7/root/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/rbd_types.dir/journal/Types.cc.o -c /home/wuyue/ceph-13.2.2/src/librbd/journal/Types.cc

src/librbd/CMakeFiles/rbd_types.dir/journal/Types.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/rbd_types.dir/journal/Types.cc.i"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/librbd && /opt/rh/devtoolset-7/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/wuyue/ceph-13.2.2/src/librbd/journal/Types.cc > CMakeFiles/rbd_types.dir/journal/Types.cc.i

src/librbd/CMakeFiles/rbd_types.dir/journal/Types.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/rbd_types.dir/journal/Types.cc.s"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/librbd && /opt/rh/devtoolset-7/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/wuyue/ceph-13.2.2/src/librbd/journal/Types.cc -o CMakeFiles/rbd_types.dir/journal/Types.cc.s

src/librbd/CMakeFiles/rbd_types.dir/mirroring_watcher/Types.cc.o: src/librbd/CMakeFiles/rbd_types.dir/flags.make
src/librbd/CMakeFiles/rbd_types.dir/mirroring_watcher/Types.cc.o: ../src/librbd/mirroring_watcher/Types.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/wuyue/ceph-13.2.2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object src/librbd/CMakeFiles/rbd_types.dir/mirroring_watcher/Types.cc.o"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/librbd && /opt/rh/devtoolset-7/root/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/rbd_types.dir/mirroring_watcher/Types.cc.o -c /home/wuyue/ceph-13.2.2/src/librbd/mirroring_watcher/Types.cc

src/librbd/CMakeFiles/rbd_types.dir/mirroring_watcher/Types.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/rbd_types.dir/mirroring_watcher/Types.cc.i"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/librbd && /opt/rh/devtoolset-7/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/wuyue/ceph-13.2.2/src/librbd/mirroring_watcher/Types.cc > CMakeFiles/rbd_types.dir/mirroring_watcher/Types.cc.i

src/librbd/CMakeFiles/rbd_types.dir/mirroring_watcher/Types.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/rbd_types.dir/mirroring_watcher/Types.cc.s"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/librbd && /opt/rh/devtoolset-7/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/wuyue/ceph-13.2.2/src/librbd/mirroring_watcher/Types.cc -o CMakeFiles/rbd_types.dir/mirroring_watcher/Types.cc.s

src/librbd/CMakeFiles/rbd_types.dir/trash_watcher/Types.cc.o: src/librbd/CMakeFiles/rbd_types.dir/flags.make
src/librbd/CMakeFiles/rbd_types.dir/trash_watcher/Types.cc.o: ../src/librbd/trash_watcher/Types.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/wuyue/ceph-13.2.2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object src/librbd/CMakeFiles/rbd_types.dir/trash_watcher/Types.cc.o"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/librbd && /opt/rh/devtoolset-7/root/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/rbd_types.dir/trash_watcher/Types.cc.o -c /home/wuyue/ceph-13.2.2/src/librbd/trash_watcher/Types.cc

src/librbd/CMakeFiles/rbd_types.dir/trash_watcher/Types.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/rbd_types.dir/trash_watcher/Types.cc.i"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/librbd && /opt/rh/devtoolset-7/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/wuyue/ceph-13.2.2/src/librbd/trash_watcher/Types.cc > CMakeFiles/rbd_types.dir/trash_watcher/Types.cc.i

src/librbd/CMakeFiles/rbd_types.dir/trash_watcher/Types.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/rbd_types.dir/trash_watcher/Types.cc.s"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/librbd && /opt/rh/devtoolset-7/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/wuyue/ceph-13.2.2/src/librbd/trash_watcher/Types.cc -o CMakeFiles/rbd_types.dir/trash_watcher/Types.cc.s

src/librbd/CMakeFiles/rbd_types.dir/watcher/Types.cc.o: src/librbd/CMakeFiles/rbd_types.dir/flags.make
src/librbd/CMakeFiles/rbd_types.dir/watcher/Types.cc.o: ../src/librbd/watcher/Types.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/wuyue/ceph-13.2.2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object src/librbd/CMakeFiles/rbd_types.dir/watcher/Types.cc.o"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/librbd && /opt/rh/devtoolset-7/root/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/rbd_types.dir/watcher/Types.cc.o -c /home/wuyue/ceph-13.2.2/src/librbd/watcher/Types.cc

src/librbd/CMakeFiles/rbd_types.dir/watcher/Types.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/rbd_types.dir/watcher/Types.cc.i"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/librbd && /opt/rh/devtoolset-7/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/wuyue/ceph-13.2.2/src/librbd/watcher/Types.cc > CMakeFiles/rbd_types.dir/watcher/Types.cc.i

src/librbd/CMakeFiles/rbd_types.dir/watcher/Types.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/rbd_types.dir/watcher/Types.cc.s"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/librbd && /opt/rh/devtoolset-7/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/wuyue/ceph-13.2.2/src/librbd/watcher/Types.cc -o CMakeFiles/rbd_types.dir/watcher/Types.cc.s

src/librbd/CMakeFiles/rbd_types.dir/WatchNotifyTypes.cc.o: src/librbd/CMakeFiles/rbd_types.dir/flags.make
src/librbd/CMakeFiles/rbd_types.dir/WatchNotifyTypes.cc.o: ../src/librbd/WatchNotifyTypes.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/wuyue/ceph-13.2.2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object src/librbd/CMakeFiles/rbd_types.dir/WatchNotifyTypes.cc.o"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/librbd && /opt/rh/devtoolset-7/root/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/rbd_types.dir/WatchNotifyTypes.cc.o -c /home/wuyue/ceph-13.2.2/src/librbd/WatchNotifyTypes.cc

src/librbd/CMakeFiles/rbd_types.dir/WatchNotifyTypes.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/rbd_types.dir/WatchNotifyTypes.cc.i"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/librbd && /opt/rh/devtoolset-7/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/wuyue/ceph-13.2.2/src/librbd/WatchNotifyTypes.cc > CMakeFiles/rbd_types.dir/WatchNotifyTypes.cc.i

src/librbd/CMakeFiles/rbd_types.dir/WatchNotifyTypes.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/rbd_types.dir/WatchNotifyTypes.cc.s"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/librbd && /opt/rh/devtoolset-7/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/wuyue/ceph-13.2.2/src/librbd/WatchNotifyTypes.cc -o CMakeFiles/rbd_types.dir/WatchNotifyTypes.cc.s

# Object files for target rbd_types
rbd_types_OBJECTS = \
"CMakeFiles/rbd_types.dir/journal/Types.cc.o" \
"CMakeFiles/rbd_types.dir/mirroring_watcher/Types.cc.o" \
"CMakeFiles/rbd_types.dir/trash_watcher/Types.cc.o" \
"CMakeFiles/rbd_types.dir/watcher/Types.cc.o" \
"CMakeFiles/rbd_types.dir/WatchNotifyTypes.cc.o"

# External object files for target rbd_types
rbd_types_EXTERNAL_OBJECTS =

lib/librbd_types.a: src/librbd/CMakeFiles/rbd_types.dir/journal/Types.cc.o
lib/librbd_types.a: src/librbd/CMakeFiles/rbd_types.dir/mirroring_watcher/Types.cc.o
lib/librbd_types.a: src/librbd/CMakeFiles/rbd_types.dir/trash_watcher/Types.cc.o
lib/librbd_types.a: src/librbd/CMakeFiles/rbd_types.dir/watcher/Types.cc.o
lib/librbd_types.a: src/librbd/CMakeFiles/rbd_types.dir/WatchNotifyTypes.cc.o
lib/librbd_types.a: src/librbd/CMakeFiles/rbd_types.dir/build.make
lib/librbd_types.a: src/librbd/CMakeFiles/rbd_types.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/wuyue/ceph-13.2.2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Linking CXX static library ../../lib/librbd_types.a"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/librbd && $(CMAKE_COMMAND) -P CMakeFiles/rbd_types.dir/cmake_clean_target.cmake
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/librbd && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/rbd_types.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/librbd/CMakeFiles/rbd_types.dir/build: lib/librbd_types.a

.PHONY : src/librbd/CMakeFiles/rbd_types.dir/build

src/librbd/CMakeFiles/rbd_types.dir/clean:
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/librbd && $(CMAKE_COMMAND) -P CMakeFiles/rbd_types.dir/cmake_clean.cmake
.PHONY : src/librbd/CMakeFiles/rbd_types.dir/clean

src/librbd/CMakeFiles/rbd_types.dir/depend:
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/wuyue/ceph-13.2.2 /home/wuyue/ceph-13.2.2/src/librbd /home/wuyue/ceph-13.2.2/cmake-build-debug /home/wuyue/ceph-13.2.2/cmake-build-debug/src/librbd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/librbd/CMakeFiles/rbd_types.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/librbd/CMakeFiles/rbd_types.dir/depend

