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
include src/test/erasure-code/CMakeFiles/unittest_erasure_code_plugin.dir/depend.make

# Include the progress variables for this target.
include src/test/erasure-code/CMakeFiles/unittest_erasure_code_plugin.dir/progress.make

# Include the compile flags for this target's objects.
include src/test/erasure-code/CMakeFiles/unittest_erasure_code_plugin.dir/flags.make

src/test/erasure-code/CMakeFiles/unittest_erasure_code_plugin.dir/__/__/erasure-code/ErasureCode.cc.o: src/test/erasure-code/CMakeFiles/unittest_erasure_code_plugin.dir/flags.make
src/test/erasure-code/CMakeFiles/unittest_erasure_code_plugin.dir/__/__/erasure-code/ErasureCode.cc.o: ../src/erasure-code/ErasureCode.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/wuyue/ceph-13.2.2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/test/erasure-code/CMakeFiles/unittest_erasure_code_plugin.dir/__/__/erasure-code/ErasureCode.cc.o"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/erasure-code && /opt/rh/devtoolset-7/root/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/unittest_erasure_code_plugin.dir/__/__/erasure-code/ErasureCode.cc.o -c /home/wuyue/ceph-13.2.2/src/erasure-code/ErasureCode.cc

src/test/erasure-code/CMakeFiles/unittest_erasure_code_plugin.dir/__/__/erasure-code/ErasureCode.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/unittest_erasure_code_plugin.dir/__/__/erasure-code/ErasureCode.cc.i"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/erasure-code && /opt/rh/devtoolset-7/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/wuyue/ceph-13.2.2/src/erasure-code/ErasureCode.cc > CMakeFiles/unittest_erasure_code_plugin.dir/__/__/erasure-code/ErasureCode.cc.i

src/test/erasure-code/CMakeFiles/unittest_erasure_code_plugin.dir/__/__/erasure-code/ErasureCode.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/unittest_erasure_code_plugin.dir/__/__/erasure-code/ErasureCode.cc.s"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/erasure-code && /opt/rh/devtoolset-7/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/wuyue/ceph-13.2.2/src/erasure-code/ErasureCode.cc -o CMakeFiles/unittest_erasure_code_plugin.dir/__/__/erasure-code/ErasureCode.cc.s

src/test/erasure-code/CMakeFiles/unittest_erasure_code_plugin.dir/TestErasureCodePlugin.cc.o: src/test/erasure-code/CMakeFiles/unittest_erasure_code_plugin.dir/flags.make
src/test/erasure-code/CMakeFiles/unittest_erasure_code_plugin.dir/TestErasureCodePlugin.cc.o: ../src/test/erasure-code/TestErasureCodePlugin.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/wuyue/ceph-13.2.2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object src/test/erasure-code/CMakeFiles/unittest_erasure_code_plugin.dir/TestErasureCodePlugin.cc.o"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/erasure-code && /opt/rh/devtoolset-7/root/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/unittest_erasure_code_plugin.dir/TestErasureCodePlugin.cc.o -c /home/wuyue/ceph-13.2.2/src/test/erasure-code/TestErasureCodePlugin.cc

src/test/erasure-code/CMakeFiles/unittest_erasure_code_plugin.dir/TestErasureCodePlugin.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/unittest_erasure_code_plugin.dir/TestErasureCodePlugin.cc.i"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/erasure-code && /opt/rh/devtoolset-7/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/wuyue/ceph-13.2.2/src/test/erasure-code/TestErasureCodePlugin.cc > CMakeFiles/unittest_erasure_code_plugin.dir/TestErasureCodePlugin.cc.i

src/test/erasure-code/CMakeFiles/unittest_erasure_code_plugin.dir/TestErasureCodePlugin.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/unittest_erasure_code_plugin.dir/TestErasureCodePlugin.cc.s"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/erasure-code && /opt/rh/devtoolset-7/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/wuyue/ceph-13.2.2/src/test/erasure-code/TestErasureCodePlugin.cc -o CMakeFiles/unittest_erasure_code_plugin.dir/TestErasureCodePlugin.cc.s

# Object files for target unittest_erasure_code_plugin
unittest_erasure_code_plugin_OBJECTS = \
"CMakeFiles/unittest_erasure_code_plugin.dir/__/__/erasure-code/ErasureCode.cc.o" \
"CMakeFiles/unittest_erasure_code_plugin.dir/TestErasureCodePlugin.cc.o"

# External object files for target unittest_erasure_code_plugin
unittest_erasure_code_plugin_EXTERNAL_OBJECTS = \
"/home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/CMakeFiles/unit-main.dir/unit.cc.o"

bin/unittest_erasure_code_plugin: src/test/erasure-code/CMakeFiles/unittest_erasure_code_plugin.dir/__/__/erasure-code/ErasureCode.cc.o
bin/unittest_erasure_code_plugin: src/test/erasure-code/CMakeFiles/unittest_erasure_code_plugin.dir/TestErasureCodePlugin.cc.o
bin/unittest_erasure_code_plugin: src/test/CMakeFiles/unit-main.dir/unit.cc.o
bin/unittest_erasure_code_plugin: src/test/erasure-code/CMakeFiles/unittest_erasure_code_plugin.dir/build.make
bin/unittest_erasure_code_plugin: lib/libgmock_main.a
bin/unittest_erasure_code_plugin: lib/libgmock.a
bin/unittest_erasure_code_plugin: lib/libgtest.a
bin/unittest_erasure_code_plugin: lib/libglobal.a
bin/unittest_erasure_code_plugin: lib/libec_example.so
bin/unittest_erasure_code_plugin: lib/libceph-common.so.0
bin/unittest_erasure_code_plugin: lib/libjson_spirit.a
bin/unittest_erasure_code_plugin: lib/libcommon_utf8.a
bin/unittest_erasure_code_plugin: lib/liberasure_code.a
bin/unittest_erasure_code_plugin: boost/lib/libboost_thread.a
bin/unittest_erasure_code_plugin: boost/lib/libboost_chrono.a
bin/unittest_erasure_code_plugin: boost/lib/libboost_atomic.a
bin/unittest_erasure_code_plugin: boost/lib/libboost_system.a
bin/unittest_erasure_code_plugin: boost/lib/libboost_random.a
bin/unittest_erasure_code_plugin: boost/lib/libboost_program_options.a
bin/unittest_erasure_code_plugin: boost/lib/libboost_date_time.a
bin/unittest_erasure_code_plugin: boost/lib/libboost_iostreams.a
bin/unittest_erasure_code_plugin: boost/lib/libboost_regex.a
bin/unittest_erasure_code_plugin: /usr/lib64/libblkid.so
bin/unittest_erasure_code_plugin: /usr/lib64/libssl3.so
bin/unittest_erasure_code_plugin: /usr/lib64/libsmime3.so
bin/unittest_erasure_code_plugin: /usr/lib64/libnss3.so
bin/unittest_erasure_code_plugin: /usr/lib64/libnssutil3.so
bin/unittest_erasure_code_plugin: /usr/lib64/libplds4.so
bin/unittest_erasure_code_plugin: /usr/lib64/libplc4.so
bin/unittest_erasure_code_plugin: /usr/lib64/libnspr4.so
bin/unittest_erasure_code_plugin: /usr/lib64/libssl.so
bin/unittest_erasure_code_plugin: /usr/lib64/libcrypto.so
bin/unittest_erasure_code_plugin: /usr/lib64/libz.so
bin/unittest_erasure_code_plugin: /usr/lib64/libibverbs.so
bin/unittest_erasure_code_plugin: src/test/erasure-code/CMakeFiles/unittest_erasure_code_plugin.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/wuyue/ceph-13.2.2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable ../../../bin/unittest_erasure_code_plugin"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/erasure-code && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/unittest_erasure_code_plugin.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/test/erasure-code/CMakeFiles/unittest_erasure_code_plugin.dir/build: bin/unittest_erasure_code_plugin

.PHONY : src/test/erasure-code/CMakeFiles/unittest_erasure_code_plugin.dir/build

src/test/erasure-code/CMakeFiles/unittest_erasure_code_plugin.dir/clean:
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/erasure-code && $(CMAKE_COMMAND) -P CMakeFiles/unittest_erasure_code_plugin.dir/cmake_clean.cmake
.PHONY : src/test/erasure-code/CMakeFiles/unittest_erasure_code_plugin.dir/clean

src/test/erasure-code/CMakeFiles/unittest_erasure_code_plugin.dir/depend:
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/wuyue/ceph-13.2.2 /home/wuyue/ceph-13.2.2/src/test/erasure-code /home/wuyue/ceph-13.2.2/cmake-build-debug /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/erasure-code /home/wuyue/ceph-13.2.2/cmake-build-debug/src/test/erasure-code/CMakeFiles/unittest_erasure_code_plugin.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/test/erasure-code/CMakeFiles/unittest_erasure_code_plugin.dir/depend

