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

# Utility rule file for mgr-dashboard-nodeenv.

# Include the progress variables for this target.
include src/pybind/mgr/dashboard/CMakeFiles/mgr-dashboard-nodeenv.dir/progress.make

src/pybind/mgr/dashboard/CMakeFiles/mgr-dashboard-nodeenv: src/pybind/mgr/dashboard/node-env/bin/npm


src/pybind/mgr/dashboard/node-env/bin/npm:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/wuyue/ceph-13.2.2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "dashboard nodeenv is being installed"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/pybind/mgr/dashboard && /home/wuyue/ceph-13.2.2/src/tools/setup-virtualenv.sh --python=/usr/bin/python2.7 /home/wuyue/ceph-13.2.2/cmake-build-debug/src/pybind/mgr/dashboard/node-env
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/pybind/mgr/dashboard && /home/wuyue/ceph-13.2.2/cmake-build-debug/src/pybind/mgr/dashboard/node-env/bin/pip install nodeenv
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/pybind/mgr/dashboard && /home/wuyue/ceph-13.2.2/cmake-build-debug/src/pybind/mgr/dashboard/node-env/bin/nodeenv -p -n 8.10.0

mgr-dashboard-nodeenv: src/pybind/mgr/dashboard/CMakeFiles/mgr-dashboard-nodeenv
mgr-dashboard-nodeenv: src/pybind/mgr/dashboard/node-env/bin/npm
mgr-dashboard-nodeenv: src/pybind/mgr/dashboard/CMakeFiles/mgr-dashboard-nodeenv.dir/build.make

.PHONY : mgr-dashboard-nodeenv

# Rule to build all files generated by this target.
src/pybind/mgr/dashboard/CMakeFiles/mgr-dashboard-nodeenv.dir/build: mgr-dashboard-nodeenv

.PHONY : src/pybind/mgr/dashboard/CMakeFiles/mgr-dashboard-nodeenv.dir/build

src/pybind/mgr/dashboard/CMakeFiles/mgr-dashboard-nodeenv.dir/clean:
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/pybind/mgr/dashboard && $(CMAKE_COMMAND) -P CMakeFiles/mgr-dashboard-nodeenv.dir/cmake_clean.cmake
.PHONY : src/pybind/mgr/dashboard/CMakeFiles/mgr-dashboard-nodeenv.dir/clean

src/pybind/mgr/dashboard/CMakeFiles/mgr-dashboard-nodeenv.dir/depend:
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/wuyue/ceph-13.2.2 /home/wuyue/ceph-13.2.2/src/pybind/mgr/dashboard /home/wuyue/ceph-13.2.2/cmake-build-debug /home/wuyue/ceph-13.2.2/cmake-build-debug/src/pybind/mgr/dashboard /home/wuyue/ceph-13.2.2/cmake-build-debug/src/pybind/mgr/dashboard/CMakeFiles/mgr-dashboard-nodeenv.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/pybind/mgr/dashboard/CMakeFiles/mgr-dashboard-nodeenv.dir/depend

