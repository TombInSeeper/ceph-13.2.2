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

# Utility rule file for cython_rgw.

# Include the progress variables for this target.
include src/pybind/rgw/CMakeFiles/cython_rgw.dir/progress.make

src/pybind/rgw/CMakeFiles/cython_rgw: ../src/pybind/rgw/rgw.pyx
	cd /home/wuyue/ceph-13.2.2/src/pybind/rgw && env CC=" /opt/rh/devtoolset-7/root/usr/bin/cc" CXX=" /opt/rh/devtoolset-7/root/usr/bin/c++" LDSHARED=" /opt/rh/devtoolset-7/root/usr/bin/cc -shared" OPT="-DNDEBUG -g -fwrapv -O2 -w" LDFLAGS=-L/home/wuyue/ceph-13.2.2/cmake-build-debug/lib CYTHON_BUILD_DIR=/home/wuyue/ceph-13.2.2/cmake-build-debug/src/pybind/rgw CEPH_LIBDIR=/home/wuyue/ceph-13.2.2/cmake-build-debug/lib CFLAGS="-iquote/home/wuyue/ceph-13.2.2/src/include -w" /usr/bin/python2.7 /home/wuyue/ceph-13.2.2/src/pybind/rgw/setup.py build --verbose --build-base /home/wuyue/ceph-13.2.2/cmake-build-debug/lib/cython_modules --build-platlib /home/wuyue/ceph-13.2.2/cmake-build-debug/lib/cython_modules/lib.2

cython_rgw: src/pybind/rgw/CMakeFiles/cython_rgw
cython_rgw: src/pybind/rgw/CMakeFiles/cython_rgw.dir/build.make

.PHONY : cython_rgw

# Rule to build all files generated by this target.
src/pybind/rgw/CMakeFiles/cython_rgw.dir/build: cython_rgw

.PHONY : src/pybind/rgw/CMakeFiles/cython_rgw.dir/build

src/pybind/rgw/CMakeFiles/cython_rgw.dir/clean:
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/pybind/rgw && $(CMAKE_COMMAND) -P CMakeFiles/cython_rgw.dir/cmake_clean.cmake
.PHONY : src/pybind/rgw/CMakeFiles/cython_rgw.dir/clean

src/pybind/rgw/CMakeFiles/cython_rgw.dir/depend:
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/wuyue/ceph-13.2.2 /home/wuyue/ceph-13.2.2/src/pybind/rgw /home/wuyue/ceph-13.2.2/cmake-build-debug /home/wuyue/ceph-13.2.2/cmake-build-debug/src/pybind/rgw /home/wuyue/ceph-13.2.2/cmake-build-debug/src/pybind/rgw/CMakeFiles/cython_rgw.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/pybind/rgw/CMakeFiles/cython_rgw.dir/depend

