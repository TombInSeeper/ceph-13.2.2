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

# Utility rule file for dpdk-ext-patch-config.

# Include the progress variables for this target.
include CMakeFiles/dpdk-ext-patch-config.dir/progress.make

CMakeFiles/dpdk-ext-patch-config: dpdk-ext-prefix/src/dpdk-ext-stamp/dpdk-ext-patch-config


dpdk-ext-prefix/src/dpdk-ext-stamp/dpdk-ext-patch-config: dpdk-ext-prefix/src/dpdk-ext-stamp/dpdk-ext-configure
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/wuyue/ceph-13.2.2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Performing patch-config step for 'dpdk-ext'"
	../cmake/modules//patch-dpdk-conf.sh /home/wuyue/ceph-13.2.2/cmake-build-debug/src/dpdk default x86_64
	/home/wuyue/clion-2018.2.5/bin/cmake/linux/bin/cmake -E touch /home/wuyue/ceph-13.2.2/cmake-build-debug/dpdk-ext-prefix/src/dpdk-ext-stamp/dpdk-ext-patch-config

dpdk-ext-prefix/src/dpdk-ext-stamp/dpdk-ext-configure: dpdk-ext-prefix/tmp/dpdk-ext-cfgcmd.txt
dpdk-ext-prefix/src/dpdk-ext-stamp/dpdk-ext-configure: dpdk-ext-prefix/src/dpdk-ext-stamp/dpdk-ext-update
dpdk-ext-prefix/src/dpdk-ext-stamp/dpdk-ext-configure: dpdk-ext-prefix/src/dpdk-ext-stamp/dpdk-ext-patch
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/wuyue/ceph-13.2.2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Performing configure step for 'dpdk-ext'"
	cd /home/wuyue/ceph-13.2.2/src/spdk/dpdk && $(MAKE) config O=/home/wuyue/ceph-13.2.2/cmake-build-debug/src/dpdk T=x86_64-native-linuxapp-gcc
	cd /home/wuyue/ceph-13.2.2/src/spdk/dpdk && /home/wuyue/clion-2018.2.5/bin/cmake/linux/bin/cmake -E touch /home/wuyue/ceph-13.2.2/cmake-build-debug/dpdk-ext-prefix/src/dpdk-ext-stamp/dpdk-ext-configure

dpdk-ext-prefix/src/dpdk-ext-stamp/dpdk-ext-update: dpdk-ext-prefix/src/dpdk-ext-stamp/dpdk-ext-download
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/wuyue/ceph-13.2.2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "No update step for 'dpdk-ext'"
	/home/wuyue/clion-2018.2.5/bin/cmake/linux/bin/cmake -E echo_append
	/home/wuyue/clion-2018.2.5/bin/cmake/linux/bin/cmake -E touch /home/wuyue/ceph-13.2.2/cmake-build-debug/dpdk-ext-prefix/src/dpdk-ext-stamp/dpdk-ext-update

dpdk-ext-prefix/src/dpdk-ext-stamp/dpdk-ext-patch: dpdk-ext-prefix/src/dpdk-ext-stamp/dpdk-ext-download
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/wuyue/ceph-13.2.2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "No patch step for 'dpdk-ext'"
	/home/wuyue/clion-2018.2.5/bin/cmake/linux/bin/cmake -E echo_append
	/home/wuyue/clion-2018.2.5/bin/cmake/linux/bin/cmake -E touch /home/wuyue/ceph-13.2.2/cmake-build-debug/dpdk-ext-prefix/src/dpdk-ext-stamp/dpdk-ext-patch

dpdk-ext-prefix/src/dpdk-ext-stamp/dpdk-ext-download: dpdk-ext-prefix/src/dpdk-ext-stamp/dpdk-ext-mkdir
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/wuyue/ceph-13.2.2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "No download step for 'dpdk-ext'"
	/home/wuyue/clion-2018.2.5/bin/cmake/linux/bin/cmake -E echo_append
	/home/wuyue/clion-2018.2.5/bin/cmake/linux/bin/cmake -E touch /home/wuyue/ceph-13.2.2/cmake-build-debug/dpdk-ext-prefix/src/dpdk-ext-stamp/dpdk-ext-download

dpdk-ext-prefix/src/dpdk-ext-stamp/dpdk-ext-mkdir:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/wuyue/ceph-13.2.2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Creating directories for 'dpdk-ext'"
	/home/wuyue/clion-2018.2.5/bin/cmake/linux/bin/cmake -E make_directory /home/wuyue/ceph-13.2.2/src/spdk/dpdk
	/home/wuyue/clion-2018.2.5/bin/cmake/linux/bin/cmake -E make_directory /home/wuyue/ceph-13.2.2/src/spdk/dpdk
	/home/wuyue/clion-2018.2.5/bin/cmake/linux/bin/cmake -E make_directory /home/wuyue/ceph-13.2.2/cmake-build-debug/dpdk-ext-prefix
	/home/wuyue/clion-2018.2.5/bin/cmake/linux/bin/cmake -E make_directory /home/wuyue/ceph-13.2.2/cmake-build-debug/dpdk-ext-prefix/tmp
	/home/wuyue/clion-2018.2.5/bin/cmake/linux/bin/cmake -E make_directory /home/wuyue/ceph-13.2.2/cmake-build-debug/dpdk-ext-prefix/src/dpdk-ext-stamp
	/home/wuyue/clion-2018.2.5/bin/cmake/linux/bin/cmake -E make_directory /home/wuyue/ceph-13.2.2/cmake-build-debug/dpdk-ext-prefix/src
	/home/wuyue/clion-2018.2.5/bin/cmake/linux/bin/cmake -E touch /home/wuyue/ceph-13.2.2/cmake-build-debug/dpdk-ext-prefix/src/dpdk-ext-stamp/dpdk-ext-mkdir

dpdk-ext-patch-config: CMakeFiles/dpdk-ext-patch-config
dpdk-ext-patch-config: dpdk-ext-prefix/src/dpdk-ext-stamp/dpdk-ext-patch-config
dpdk-ext-patch-config: dpdk-ext-prefix/src/dpdk-ext-stamp/dpdk-ext-configure
dpdk-ext-patch-config: dpdk-ext-prefix/src/dpdk-ext-stamp/dpdk-ext-update
dpdk-ext-patch-config: dpdk-ext-prefix/src/dpdk-ext-stamp/dpdk-ext-patch
dpdk-ext-patch-config: dpdk-ext-prefix/src/dpdk-ext-stamp/dpdk-ext-download
dpdk-ext-patch-config: dpdk-ext-prefix/src/dpdk-ext-stamp/dpdk-ext-mkdir
dpdk-ext-patch-config: CMakeFiles/dpdk-ext-patch-config.dir/build.make

.PHONY : dpdk-ext-patch-config

# Rule to build all files generated by this target.
CMakeFiles/dpdk-ext-patch-config.dir/build: dpdk-ext-patch-config

.PHONY : CMakeFiles/dpdk-ext-patch-config.dir/build

CMakeFiles/dpdk-ext-patch-config.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/dpdk-ext-patch-config.dir/cmake_clean.cmake
.PHONY : CMakeFiles/dpdk-ext-patch-config.dir/clean

CMakeFiles/dpdk-ext-patch-config.dir/depend:
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/wuyue/ceph-13.2.2 /home/wuyue/ceph-13.2.2 /home/wuyue/ceph-13.2.2/cmake-build-debug /home/wuyue/ceph-13.2.2/cmake-build-debug /home/wuyue/ceph-13.2.2/cmake-build-debug/CMakeFiles/dpdk-ext-patch-config.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/dpdk-ext-patch-config.dir/depend

