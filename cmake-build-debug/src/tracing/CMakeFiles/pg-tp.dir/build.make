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

# Utility rule file for pg-tp.

# Include the progress variables for this target.
include src/tracing/CMakeFiles/pg-tp.dir/progress.make

src/tracing/CMakeFiles/pg-tp: include/tracing/pg.h


include/tracing/pg.h: ../src/tracing/pg.tp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/wuyue/ceph-13.2.2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "generating /home/wuyue/ceph-13.2.2/cmake-build-debug/include/tracing/pg.h"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/include && /usr/bin/lttng-gen-tp /home/wuyue/ceph-13.2.2/src/tracing/pg.tp -o tracing/pg.h

pg-tp: src/tracing/CMakeFiles/pg-tp
pg-tp: include/tracing/pg.h
pg-tp: src/tracing/CMakeFiles/pg-tp.dir/build.make

.PHONY : pg-tp

# Rule to build all files generated by this target.
src/tracing/CMakeFiles/pg-tp.dir/build: pg-tp

.PHONY : src/tracing/CMakeFiles/pg-tp.dir/build

src/tracing/CMakeFiles/pg-tp.dir/clean:
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/tracing && $(CMAKE_COMMAND) -P CMakeFiles/pg-tp.dir/cmake_clean.cmake
.PHONY : src/tracing/CMakeFiles/pg-tp.dir/clean

src/tracing/CMakeFiles/pg-tp.dir/depend:
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/wuyue/ceph-13.2.2 /home/wuyue/ceph-13.2.2/src/tracing /home/wuyue/ceph-13.2.2/cmake-build-debug /home/wuyue/ceph-13.2.2/cmake-build-debug/src/tracing /home/wuyue/ceph-13.2.2/cmake-build-debug/src/tracing/CMakeFiles/pg-tp.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/tracing/CMakeFiles/pg-tp.dir/depend

