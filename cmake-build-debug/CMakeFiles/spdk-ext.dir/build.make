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

# Utility rule file for spdk-ext.

# Include the progress variables for this target.
include CMakeFiles/spdk-ext.dir/progress.make

CMakeFiles/spdk-ext: CMakeFiles/spdk-ext-complete


CMakeFiles/spdk-ext-complete: spdk-ext-prefix/src/spdk-ext-stamp/spdk-ext-install
CMakeFiles/spdk-ext-complete: spdk-ext-prefix/src/spdk-ext-stamp/spdk-ext-mkdir
CMakeFiles/spdk-ext-complete: spdk-ext-prefix/src/spdk-ext-stamp/spdk-ext-download
CMakeFiles/spdk-ext-complete: spdk-ext-prefix/src/spdk-ext-stamp/spdk-ext-update
CMakeFiles/spdk-ext-complete: spdk-ext-prefix/src/spdk-ext-stamp/spdk-ext-patch
CMakeFiles/spdk-ext-complete: spdk-ext-prefix/src/spdk-ext-stamp/spdk-ext-configure
CMakeFiles/spdk-ext-complete: spdk-ext-prefix/src/spdk-ext-stamp/spdk-ext-build
CMakeFiles/spdk-ext-complete: spdk-ext-prefix/src/spdk-ext-stamp/spdk-ext-install
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/wuyue/ceph-13.2.2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Completed 'spdk-ext'"
	/home/wuyue/clion-2018.2.5/bin/cmake/linux/bin/cmake -E make_directory /home/wuyue/ceph-13.2.2/cmake-build-debug/CMakeFiles
	/home/wuyue/clion-2018.2.5/bin/cmake/linux/bin/cmake -E touch /home/wuyue/ceph-13.2.2/cmake-build-debug/CMakeFiles/spdk-ext-complete
	/home/wuyue/clion-2018.2.5/bin/cmake/linux/bin/cmake -E touch /home/wuyue/ceph-13.2.2/cmake-build-debug/spdk-ext-prefix/src/spdk-ext-stamp/spdk-ext-done

spdk-ext-prefix/src/spdk-ext-stamp/spdk-ext-install: spdk-ext-prefix/src/spdk-ext-stamp/spdk-ext-build
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/wuyue/ceph-13.2.2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Performing install step for 'spdk-ext'"
	cd /home/wuyue/ceph-13.2.2/src/spdk && true
	cd /home/wuyue/ceph-13.2.2/src/spdk && /home/wuyue/clion-2018.2.5/bin/cmake/linux/bin/cmake -E touch /home/wuyue/ceph-13.2.2/cmake-build-debug/spdk-ext-prefix/src/spdk-ext-stamp/spdk-ext-install

spdk-ext-prefix/src/spdk-ext-stamp/spdk-ext-mkdir:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/wuyue/ceph-13.2.2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Creating directories for 'spdk-ext'"
	/home/wuyue/clion-2018.2.5/bin/cmake/linux/bin/cmake -E make_directory /home/wuyue/ceph-13.2.2/src/spdk
	/home/wuyue/clion-2018.2.5/bin/cmake/linux/bin/cmake -E make_directory /home/wuyue/ceph-13.2.2/src/spdk
	/home/wuyue/clion-2018.2.5/bin/cmake/linux/bin/cmake -E make_directory /home/wuyue/ceph-13.2.2/cmake-build-debug/spdk-ext-prefix
	/home/wuyue/clion-2018.2.5/bin/cmake/linux/bin/cmake -E make_directory /home/wuyue/ceph-13.2.2/cmake-build-debug/spdk-ext-prefix/tmp
	/home/wuyue/clion-2018.2.5/bin/cmake/linux/bin/cmake -E make_directory /home/wuyue/ceph-13.2.2/cmake-build-debug/spdk-ext-prefix/src/spdk-ext-stamp
	/home/wuyue/clion-2018.2.5/bin/cmake/linux/bin/cmake -E make_directory /home/wuyue/ceph-13.2.2/cmake-build-debug/spdk-ext-prefix/src
	/home/wuyue/clion-2018.2.5/bin/cmake/linux/bin/cmake -E touch /home/wuyue/ceph-13.2.2/cmake-build-debug/spdk-ext-prefix/src/spdk-ext-stamp/spdk-ext-mkdir

spdk-ext-prefix/src/spdk-ext-stamp/spdk-ext-download: spdk-ext-prefix/src/spdk-ext-stamp/spdk-ext-mkdir
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/wuyue/ceph-13.2.2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "No download step for 'spdk-ext'"
	/home/wuyue/clion-2018.2.5/bin/cmake/linux/bin/cmake -E echo_append
	/home/wuyue/clion-2018.2.5/bin/cmake/linux/bin/cmake -E touch /home/wuyue/ceph-13.2.2/cmake-build-debug/spdk-ext-prefix/src/spdk-ext-stamp/spdk-ext-download

spdk-ext-prefix/src/spdk-ext-stamp/spdk-ext-update: spdk-ext-prefix/src/spdk-ext-stamp/spdk-ext-download
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/wuyue/ceph-13.2.2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "No update step for 'spdk-ext'"
	/home/wuyue/clion-2018.2.5/bin/cmake/linux/bin/cmake -E echo_append
	/home/wuyue/clion-2018.2.5/bin/cmake/linux/bin/cmake -E touch /home/wuyue/ceph-13.2.2/cmake-build-debug/spdk-ext-prefix/src/spdk-ext-stamp/spdk-ext-update

spdk-ext-prefix/src/spdk-ext-stamp/spdk-ext-patch: spdk-ext-prefix/src/spdk-ext-stamp/spdk-ext-download
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/wuyue/ceph-13.2.2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "No patch step for 'spdk-ext'"
	/home/wuyue/clion-2018.2.5/bin/cmake/linux/bin/cmake -E echo_append
	/home/wuyue/clion-2018.2.5/bin/cmake/linux/bin/cmake -E touch /home/wuyue/ceph-13.2.2/cmake-build-debug/spdk-ext-prefix/src/spdk-ext-stamp/spdk-ext-patch

spdk-ext-prefix/src/spdk-ext-stamp/spdk-ext-configure: dpdk-ext-prefix/src/dpdk-ext-stamp/dpdk-ext-done
spdk-ext-prefix/src/spdk-ext-stamp/spdk-ext-configure: spdk-ext-prefix/tmp/spdk-ext-cfgcmd.txt
spdk-ext-prefix/src/spdk-ext-stamp/spdk-ext-configure: spdk-ext-prefix/src/spdk-ext-stamp/spdk-ext-update
spdk-ext-prefix/src/spdk-ext-stamp/spdk-ext-configure: spdk-ext-prefix/src/spdk-ext-stamp/spdk-ext-patch
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/wuyue/ceph-13.2.2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Performing configure step for 'spdk-ext'"
	cd /home/wuyue/ceph-13.2.2/src/spdk && ./configure --with-dpdk=/home/wuyue/ceph-13.2.2/cmake-build-debug/src/dpdk
	cd /home/wuyue/ceph-13.2.2/src/spdk && /home/wuyue/clion-2018.2.5/bin/cmake/linux/bin/cmake -E touch /home/wuyue/ceph-13.2.2/cmake-build-debug/spdk-ext-prefix/src/spdk-ext-stamp/spdk-ext-configure

spdk-ext-prefix/src/spdk-ext-stamp/spdk-ext-build: spdk-ext-prefix/src/spdk-ext-stamp/spdk-ext-configure
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/wuyue/ceph-13.2.2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Performing build step for 'spdk-ext'"
	cd /home/wuyue/ceph-13.2.2/src/spdk && env -i PATH=/opt/rh/devtoolset-7/root/usr/bin:/usr/lib64/qt-3.3/bin:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/home/wuyue/.local/bin:/home/wuyue/bin CC=/opt/rh/devtoolset-7/root/usr/bin/cc $(MAKE) EXTRA_CFLAGS=\"-fPIC\"
	cd /home/wuyue/ceph-13.2.2/src/spdk && /home/wuyue/clion-2018.2.5/bin/cmake/linux/bin/cmake -E touch /home/wuyue/ceph-13.2.2/cmake-build-debug/spdk-ext-prefix/src/spdk-ext-stamp/spdk-ext-build

spdk-ext: CMakeFiles/spdk-ext
spdk-ext: CMakeFiles/spdk-ext-complete
spdk-ext: spdk-ext-prefix/src/spdk-ext-stamp/spdk-ext-install
spdk-ext: spdk-ext-prefix/src/spdk-ext-stamp/spdk-ext-mkdir
spdk-ext: spdk-ext-prefix/src/spdk-ext-stamp/spdk-ext-download
spdk-ext: spdk-ext-prefix/src/spdk-ext-stamp/spdk-ext-update
spdk-ext: spdk-ext-prefix/src/spdk-ext-stamp/spdk-ext-patch
spdk-ext: spdk-ext-prefix/src/spdk-ext-stamp/spdk-ext-configure
spdk-ext: spdk-ext-prefix/src/spdk-ext-stamp/spdk-ext-build
spdk-ext: CMakeFiles/spdk-ext.dir/build.make

.PHONY : spdk-ext

# Rule to build all files generated by this target.
CMakeFiles/spdk-ext.dir/build: spdk-ext

.PHONY : CMakeFiles/spdk-ext.dir/build

CMakeFiles/spdk-ext.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/spdk-ext.dir/cmake_clean.cmake
.PHONY : CMakeFiles/spdk-ext.dir/clean

CMakeFiles/spdk-ext.dir/depend:
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/wuyue/ceph-13.2.2 /home/wuyue/ceph-13.2.2 /home/wuyue/ceph-13.2.2/cmake-build-debug /home/wuyue/ceph-13.2.2/cmake-build-debug /home/wuyue/ceph-13.2.2/cmake-build-debug/CMakeFiles/spdk-ext.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/spdk-ext.dir/depend

