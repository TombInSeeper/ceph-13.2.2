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
include src/json_spirit/CMakeFiles/json_spirit.dir/depend.make

# Include the progress variables for this target.
include src/json_spirit/CMakeFiles/json_spirit.dir/progress.make

# Include the compile flags for this target's objects.
include src/json_spirit/CMakeFiles/json_spirit.dir/flags.make

src/json_spirit/CMakeFiles/json_spirit.dir/json_spirit_reader.cpp.o: src/json_spirit/CMakeFiles/json_spirit.dir/flags.make
src/json_spirit/CMakeFiles/json_spirit.dir/json_spirit_reader.cpp.o: ../src/json_spirit/json_spirit_reader.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/wuyue/ceph-13.2.2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/json_spirit/CMakeFiles/json_spirit.dir/json_spirit_reader.cpp.o"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/json_spirit && /opt/rh/devtoolset-7/root/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/json_spirit.dir/json_spirit_reader.cpp.o -c /home/wuyue/ceph-13.2.2/src/json_spirit/json_spirit_reader.cpp

src/json_spirit/CMakeFiles/json_spirit.dir/json_spirit_reader.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/json_spirit.dir/json_spirit_reader.cpp.i"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/json_spirit && /opt/rh/devtoolset-7/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/wuyue/ceph-13.2.2/src/json_spirit/json_spirit_reader.cpp > CMakeFiles/json_spirit.dir/json_spirit_reader.cpp.i

src/json_spirit/CMakeFiles/json_spirit.dir/json_spirit_reader.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/json_spirit.dir/json_spirit_reader.cpp.s"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/json_spirit && /opt/rh/devtoolset-7/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/wuyue/ceph-13.2.2/src/json_spirit/json_spirit_reader.cpp -o CMakeFiles/json_spirit.dir/json_spirit_reader.cpp.s

src/json_spirit/CMakeFiles/json_spirit.dir/json_spirit_writer.cpp.o: src/json_spirit/CMakeFiles/json_spirit.dir/flags.make
src/json_spirit/CMakeFiles/json_spirit.dir/json_spirit_writer.cpp.o: ../src/json_spirit/json_spirit_writer.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/wuyue/ceph-13.2.2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object src/json_spirit/CMakeFiles/json_spirit.dir/json_spirit_writer.cpp.o"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/json_spirit && /opt/rh/devtoolset-7/root/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/json_spirit.dir/json_spirit_writer.cpp.o -c /home/wuyue/ceph-13.2.2/src/json_spirit/json_spirit_writer.cpp

src/json_spirit/CMakeFiles/json_spirit.dir/json_spirit_writer.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/json_spirit.dir/json_spirit_writer.cpp.i"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/json_spirit && /opt/rh/devtoolset-7/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/wuyue/ceph-13.2.2/src/json_spirit/json_spirit_writer.cpp > CMakeFiles/json_spirit.dir/json_spirit_writer.cpp.i

src/json_spirit/CMakeFiles/json_spirit.dir/json_spirit_writer.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/json_spirit.dir/json_spirit_writer.cpp.s"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/json_spirit && /opt/rh/devtoolset-7/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/wuyue/ceph-13.2.2/src/json_spirit/json_spirit_writer.cpp -o CMakeFiles/json_spirit.dir/json_spirit_writer.cpp.s

# Object files for target json_spirit
json_spirit_OBJECTS = \
"CMakeFiles/json_spirit.dir/json_spirit_reader.cpp.o" \
"CMakeFiles/json_spirit.dir/json_spirit_writer.cpp.o"

# External object files for target json_spirit
json_spirit_EXTERNAL_OBJECTS =

lib/libjson_spirit.a: src/json_spirit/CMakeFiles/json_spirit.dir/json_spirit_reader.cpp.o
lib/libjson_spirit.a: src/json_spirit/CMakeFiles/json_spirit.dir/json_spirit_writer.cpp.o
lib/libjson_spirit.a: src/json_spirit/CMakeFiles/json_spirit.dir/build.make
lib/libjson_spirit.a: src/json_spirit/CMakeFiles/json_spirit.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/wuyue/ceph-13.2.2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX static library ../../lib/libjson_spirit.a"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/json_spirit && $(CMAKE_COMMAND) -P CMakeFiles/json_spirit.dir/cmake_clean_target.cmake
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/json_spirit && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/json_spirit.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/json_spirit/CMakeFiles/json_spirit.dir/build: lib/libjson_spirit.a

.PHONY : src/json_spirit/CMakeFiles/json_spirit.dir/build

src/json_spirit/CMakeFiles/json_spirit.dir/clean:
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/json_spirit && $(CMAKE_COMMAND) -P CMakeFiles/json_spirit.dir/cmake_clean.cmake
.PHONY : src/json_spirit/CMakeFiles/json_spirit.dir/clean

src/json_spirit/CMakeFiles/json_spirit.dir/depend:
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/wuyue/ceph-13.2.2 /home/wuyue/ceph-13.2.2/src/json_spirit /home/wuyue/ceph-13.2.2/cmake-build-debug /home/wuyue/ceph-13.2.2/cmake-build-debug/src/json_spirit /home/wuyue/ceph-13.2.2/cmake-build-debug/src/json_spirit/CMakeFiles/json_spirit.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/json_spirit/CMakeFiles/json_spirit.dir/depend

