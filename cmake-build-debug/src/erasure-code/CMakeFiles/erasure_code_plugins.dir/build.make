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

# Utility rule file for erasure_code_plugins.

# Include the progress variables for this target.
include src/erasure-code/CMakeFiles/erasure_code_plugins.dir/progress.make

src/erasure-code/CMakeFiles/erasure_code_plugins: lib/libec_isa.so
src/erasure-code/CMakeFiles/erasure_code_plugins: lib/libec_lrc.so
src/erasure-code/CMakeFiles/erasure_code_plugins: lib/libec_jerasure.so
src/erasure-code/CMakeFiles/erasure_code_plugins: lib/libec_shec.so


erasure_code_plugins: src/erasure-code/CMakeFiles/erasure_code_plugins
erasure_code_plugins: src/erasure-code/CMakeFiles/erasure_code_plugins.dir/build.make

.PHONY : erasure_code_plugins

# Rule to build all files generated by this target.
src/erasure-code/CMakeFiles/erasure_code_plugins.dir/build: erasure_code_plugins

.PHONY : src/erasure-code/CMakeFiles/erasure_code_plugins.dir/build

src/erasure-code/CMakeFiles/erasure_code_plugins.dir/clean:
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/erasure-code && $(CMAKE_COMMAND) -P CMakeFiles/erasure_code_plugins.dir/cmake_clean.cmake
.PHONY : src/erasure-code/CMakeFiles/erasure_code_plugins.dir/clean

src/erasure-code/CMakeFiles/erasure_code_plugins.dir/depend:
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/wuyue/ceph-13.2.2 /home/wuyue/ceph-13.2.2/src/erasure-code /home/wuyue/ceph-13.2.2/cmake-build-debug /home/wuyue/ceph-13.2.2/cmake-build-debug/src/erasure-code /home/wuyue/ceph-13.2.2/cmake-build-debug/src/erasure-code/CMakeFiles/erasure_code_plugins.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/erasure-code/CMakeFiles/erasure_code_plugins.dir/depend

