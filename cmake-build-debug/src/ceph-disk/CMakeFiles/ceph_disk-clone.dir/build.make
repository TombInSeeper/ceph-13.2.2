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

# Utility rule file for ceph_disk-clone.

# Include the progress variables for this target.
include src/ceph-disk/CMakeFiles/ceph_disk-clone.dir/progress.make

src/ceph-disk/CMakeFiles/ceph_disk-clone: src/ceph-disk/setup.py
src/ceph-disk/CMakeFiles/ceph_disk-clone: src/ceph-disk/README.rst
src/ceph-disk/CMakeFiles/ceph_disk-clone: src/ceph-disk/requirements.txt
src/ceph-disk/CMakeFiles/ceph_disk-clone: src/ceph-disk/test-requirements.txt
src/ceph-disk/CMakeFiles/ceph_disk-clone: src/ceph-disk/ceph_disk


src/ceph-disk/setup.py: ../src/ceph-disk/setup.py
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/wuyue/ceph-13.2.2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating setup.py"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/ceph-disk && /home/wuyue/clion-2018.2.5/bin/cmake/linux/bin/cmake -E create_symlink /home/wuyue/ceph-13.2.2/src/ceph-disk/setup.py setup.py

src/ceph-disk/README.rst: ../src/ceph-disk/README.rst
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/wuyue/ceph-13.2.2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Generating README.rst"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/ceph-disk && /home/wuyue/clion-2018.2.5/bin/cmake/linux/bin/cmake -E create_symlink /home/wuyue/ceph-13.2.2/src/ceph-disk/README.rst README.rst

src/ceph-disk/requirements.txt: ../src/ceph-disk/requirements.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/wuyue/ceph-13.2.2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Generating requirements.txt"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/ceph-disk && /home/wuyue/clion-2018.2.5/bin/cmake/linux/bin/cmake -E create_symlink /home/wuyue/ceph-13.2.2/src/ceph-disk/requirements.txt requirements.txt

src/ceph-disk/test-requirements.txt: ../src/ceph-disk/test-requirements.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/wuyue/ceph-13.2.2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Generating test-requirements.txt"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/ceph-disk && /home/wuyue/clion-2018.2.5/bin/cmake/linux/bin/cmake -E create_symlink /home/wuyue/ceph-13.2.2/src/ceph-disk/test-requirements.txt test-requirements.txt

src/ceph-disk/ceph_disk: ../src/ceph-disk/ceph_disk
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/wuyue/ceph-13.2.2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Generating ceph_disk"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/ceph-disk && /home/wuyue/clion-2018.2.5/bin/cmake/linux/bin/cmake -E create_symlink /home/wuyue/ceph-13.2.2/src/ceph-disk/ceph_disk ceph_disk

ceph_disk-clone: src/ceph-disk/CMakeFiles/ceph_disk-clone
ceph_disk-clone: src/ceph-disk/setup.py
ceph_disk-clone: src/ceph-disk/README.rst
ceph_disk-clone: src/ceph-disk/requirements.txt
ceph_disk-clone: src/ceph-disk/test-requirements.txt
ceph_disk-clone: src/ceph-disk/ceph_disk
ceph_disk-clone: src/ceph-disk/CMakeFiles/ceph_disk-clone.dir/build.make

.PHONY : ceph_disk-clone

# Rule to build all files generated by this target.
src/ceph-disk/CMakeFiles/ceph_disk-clone.dir/build: ceph_disk-clone

.PHONY : src/ceph-disk/CMakeFiles/ceph_disk-clone.dir/build

src/ceph-disk/CMakeFiles/ceph_disk-clone.dir/clean:
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/ceph-disk && $(CMAKE_COMMAND) -P CMakeFiles/ceph_disk-clone.dir/cmake_clean.cmake
.PHONY : src/ceph-disk/CMakeFiles/ceph_disk-clone.dir/clean

src/ceph-disk/CMakeFiles/ceph_disk-clone.dir/depend:
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/wuyue/ceph-13.2.2 /home/wuyue/ceph-13.2.2/src/ceph-disk /home/wuyue/ceph-13.2.2/cmake-build-debug /home/wuyue/ceph-13.2.2/cmake-build-debug/src/ceph-disk /home/wuyue/ceph-13.2.2/cmake-build-debug/src/ceph-disk/CMakeFiles/ceph_disk-clone.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/ceph-disk/CMakeFiles/ceph_disk-clone.dir/depend

