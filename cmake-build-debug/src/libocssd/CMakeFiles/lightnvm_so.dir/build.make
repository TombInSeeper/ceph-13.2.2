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
include src/libocssd/CMakeFiles/lightnvm_so.dir/depend.make

# Include the progress variables for this target.
include src/libocssd/CMakeFiles/lightnvm_so.dir/progress.make

# Include the compile flags for this target's objects.
include src/libocssd/CMakeFiles/lightnvm_so.dir/flags.make

src/libocssd/CMakeFiles/lightnvm_so.dir/src/nvm_spec.c.o: src/libocssd/CMakeFiles/lightnvm_so.dir/flags.make
src/libocssd/CMakeFiles/lightnvm_so.dir/src/nvm_spec.c.o: ../src/libocssd/src/nvm_spec.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/wuyue/ceph-13.2.2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object src/libocssd/CMakeFiles/lightnvm_so.dir/src/nvm_spec.c.o"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/libocssd && /opt/rh/devtoolset-7/root/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/lightnvm_so.dir/src/nvm_spec.c.o   -c /home/wuyue/ceph-13.2.2/src/libocssd/src/nvm_spec.c

src/libocssd/CMakeFiles/lightnvm_so.dir/src/nvm_spec.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/lightnvm_so.dir/src/nvm_spec.c.i"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/libocssd && /opt/rh/devtoolset-7/root/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/wuyue/ceph-13.2.2/src/libocssd/src/nvm_spec.c > CMakeFiles/lightnvm_so.dir/src/nvm_spec.c.i

src/libocssd/CMakeFiles/lightnvm_so.dir/src/nvm_spec.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/lightnvm_so.dir/src/nvm_spec.c.s"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/libocssd && /opt/rh/devtoolset-7/root/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/wuyue/ceph-13.2.2/src/libocssd/src/nvm_spec.c -o CMakeFiles/lightnvm_so.dir/src/nvm_spec.c.s

src/libocssd/CMakeFiles/lightnvm_so.dir/src/nvm_be.c.o: src/libocssd/CMakeFiles/lightnvm_so.dir/flags.make
src/libocssd/CMakeFiles/lightnvm_so.dir/src/nvm_be.c.o: ../src/libocssd/src/nvm_be.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/wuyue/ceph-13.2.2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object src/libocssd/CMakeFiles/lightnvm_so.dir/src/nvm_be.c.o"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/libocssd && /opt/rh/devtoolset-7/root/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/lightnvm_so.dir/src/nvm_be.c.o   -c /home/wuyue/ceph-13.2.2/src/libocssd/src/nvm_be.c

src/libocssd/CMakeFiles/lightnvm_so.dir/src/nvm_be.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/lightnvm_so.dir/src/nvm_be.c.i"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/libocssd && /opt/rh/devtoolset-7/root/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/wuyue/ceph-13.2.2/src/libocssd/src/nvm_be.c > CMakeFiles/lightnvm_so.dir/src/nvm_be.c.i

src/libocssd/CMakeFiles/lightnvm_so.dir/src/nvm_be.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/lightnvm_so.dir/src/nvm_be.c.s"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/libocssd && /opt/rh/devtoolset-7/root/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/wuyue/ceph-13.2.2/src/libocssd/src/nvm_be.c -o CMakeFiles/lightnvm_so.dir/src/nvm_be.c.s

src/libocssd/CMakeFiles/lightnvm_so.dir/src/be_lightnvm/nvm_be_ioctl.c.o: src/libocssd/CMakeFiles/lightnvm_so.dir/flags.make
src/libocssd/CMakeFiles/lightnvm_so.dir/src/be_lightnvm/nvm_be_ioctl.c.o: ../src/libocssd/src/be_lightnvm/nvm_be_ioctl.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/wuyue/ceph-13.2.2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object src/libocssd/CMakeFiles/lightnvm_so.dir/src/be_lightnvm/nvm_be_ioctl.c.o"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/libocssd && /opt/rh/devtoolset-7/root/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/lightnvm_so.dir/src/be_lightnvm/nvm_be_ioctl.c.o   -c /home/wuyue/ceph-13.2.2/src/libocssd/src/be_lightnvm/nvm_be_ioctl.c

src/libocssd/CMakeFiles/lightnvm_so.dir/src/be_lightnvm/nvm_be_ioctl.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/lightnvm_so.dir/src/be_lightnvm/nvm_be_ioctl.c.i"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/libocssd && /opt/rh/devtoolset-7/root/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/wuyue/ceph-13.2.2/src/libocssd/src/be_lightnvm/nvm_be_ioctl.c > CMakeFiles/lightnvm_so.dir/src/be_lightnvm/nvm_be_ioctl.c.i

src/libocssd/CMakeFiles/lightnvm_so.dir/src/be_lightnvm/nvm_be_ioctl.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/lightnvm_so.dir/src/be_lightnvm/nvm_be_ioctl.c.s"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/libocssd && /opt/rh/devtoolset-7/root/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/wuyue/ceph-13.2.2/src/libocssd/src/be_lightnvm/nvm_be_ioctl.c -o CMakeFiles/lightnvm_so.dir/src/be_lightnvm/nvm_be_ioctl.c.s

src/libocssd/CMakeFiles/lightnvm_so.dir/src/nvm_dev.c.o: src/libocssd/CMakeFiles/lightnvm_so.dir/flags.make
src/libocssd/CMakeFiles/lightnvm_so.dir/src/nvm_dev.c.o: ../src/libocssd/src/nvm_dev.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/wuyue/ceph-13.2.2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building C object src/libocssd/CMakeFiles/lightnvm_so.dir/src/nvm_dev.c.o"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/libocssd && /opt/rh/devtoolset-7/root/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/lightnvm_so.dir/src/nvm_dev.c.o   -c /home/wuyue/ceph-13.2.2/src/libocssd/src/nvm_dev.c

src/libocssd/CMakeFiles/lightnvm_so.dir/src/nvm_dev.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/lightnvm_so.dir/src/nvm_dev.c.i"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/libocssd && /opt/rh/devtoolset-7/root/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/wuyue/ceph-13.2.2/src/libocssd/src/nvm_dev.c > CMakeFiles/lightnvm_so.dir/src/nvm_dev.c.i

src/libocssd/CMakeFiles/lightnvm_so.dir/src/nvm_dev.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/lightnvm_so.dir/src/nvm_dev.c.s"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/libocssd && /opt/rh/devtoolset-7/root/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/wuyue/ceph-13.2.2/src/libocssd/src/nvm_dev.c -o CMakeFiles/lightnvm_so.dir/src/nvm_dev.c.s

src/libocssd/CMakeFiles/lightnvm_so.dir/src/nvm_buf.c.o: src/libocssd/CMakeFiles/lightnvm_so.dir/flags.make
src/libocssd/CMakeFiles/lightnvm_so.dir/src/nvm_buf.c.o: ../src/libocssd/src/nvm_buf.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/wuyue/ceph-13.2.2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building C object src/libocssd/CMakeFiles/lightnvm_so.dir/src/nvm_buf.c.o"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/libocssd && /opt/rh/devtoolset-7/root/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/lightnvm_so.dir/src/nvm_buf.c.o   -c /home/wuyue/ceph-13.2.2/src/libocssd/src/nvm_buf.c

src/libocssd/CMakeFiles/lightnvm_so.dir/src/nvm_buf.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/lightnvm_so.dir/src/nvm_buf.c.i"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/libocssd && /opt/rh/devtoolset-7/root/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/wuyue/ceph-13.2.2/src/libocssd/src/nvm_buf.c > CMakeFiles/lightnvm_so.dir/src/nvm_buf.c.i

src/libocssd/CMakeFiles/lightnvm_so.dir/src/nvm_buf.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/lightnvm_so.dir/src/nvm_buf.c.s"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/libocssd && /opt/rh/devtoolset-7/root/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/wuyue/ceph-13.2.2/src/libocssd/src/nvm_buf.c -o CMakeFiles/lightnvm_so.dir/src/nvm_buf.c.s

src/libocssd/CMakeFiles/lightnvm_so.dir/src/nvm_bbt.c.o: src/libocssd/CMakeFiles/lightnvm_so.dir/flags.make
src/libocssd/CMakeFiles/lightnvm_so.dir/src/nvm_bbt.c.o: ../src/libocssd/src/nvm_bbt.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/wuyue/ceph-13.2.2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building C object src/libocssd/CMakeFiles/lightnvm_so.dir/src/nvm_bbt.c.o"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/libocssd && /opt/rh/devtoolset-7/root/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/lightnvm_so.dir/src/nvm_bbt.c.o   -c /home/wuyue/ceph-13.2.2/src/libocssd/src/nvm_bbt.c

src/libocssd/CMakeFiles/lightnvm_so.dir/src/nvm_bbt.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/lightnvm_so.dir/src/nvm_bbt.c.i"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/libocssd && /opt/rh/devtoolset-7/root/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/wuyue/ceph-13.2.2/src/libocssd/src/nvm_bbt.c > CMakeFiles/lightnvm_so.dir/src/nvm_bbt.c.i

src/libocssd/CMakeFiles/lightnvm_so.dir/src/nvm_bbt.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/lightnvm_so.dir/src/nvm_bbt.c.s"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/libocssd && /opt/rh/devtoolset-7/root/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/wuyue/ceph-13.2.2/src/libocssd/src/nvm_bbt.c -o CMakeFiles/lightnvm_so.dir/src/nvm_bbt.c.s

src/libocssd/CMakeFiles/lightnvm_so.dir/src/nvm_cmd.c.o: src/libocssd/CMakeFiles/lightnvm_so.dir/flags.make
src/libocssd/CMakeFiles/lightnvm_so.dir/src/nvm_cmd.c.o: ../src/libocssd/src/nvm_cmd.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/wuyue/ceph-13.2.2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building C object src/libocssd/CMakeFiles/lightnvm_so.dir/src/nvm_cmd.c.o"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/libocssd && /opt/rh/devtoolset-7/root/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/lightnvm_so.dir/src/nvm_cmd.c.o   -c /home/wuyue/ceph-13.2.2/src/libocssd/src/nvm_cmd.c

src/libocssd/CMakeFiles/lightnvm_so.dir/src/nvm_cmd.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/lightnvm_so.dir/src/nvm_cmd.c.i"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/libocssd && /opt/rh/devtoolset-7/root/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/wuyue/ceph-13.2.2/src/libocssd/src/nvm_cmd.c > CMakeFiles/lightnvm_so.dir/src/nvm_cmd.c.i

src/libocssd/CMakeFiles/lightnvm_so.dir/src/nvm_cmd.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/lightnvm_so.dir/src/nvm_cmd.c.s"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/libocssd && /opt/rh/devtoolset-7/root/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/wuyue/ceph-13.2.2/src/libocssd/src/nvm_cmd.c -o CMakeFiles/lightnvm_so.dir/src/nvm_cmd.c.s

src/libocssd/CMakeFiles/lightnvm_so.dir/src/nvm_addr.c.o: src/libocssd/CMakeFiles/lightnvm_so.dir/flags.make
src/libocssd/CMakeFiles/lightnvm_so.dir/src/nvm_addr.c.o: ../src/libocssd/src/nvm_addr.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/wuyue/ceph-13.2.2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building C object src/libocssd/CMakeFiles/lightnvm_so.dir/src/nvm_addr.c.o"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/libocssd && /opt/rh/devtoolset-7/root/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/lightnvm_so.dir/src/nvm_addr.c.o   -c /home/wuyue/ceph-13.2.2/src/libocssd/src/nvm_addr.c

src/libocssd/CMakeFiles/lightnvm_so.dir/src/nvm_addr.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/lightnvm_so.dir/src/nvm_addr.c.i"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/libocssd && /opt/rh/devtoolset-7/root/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/wuyue/ceph-13.2.2/src/libocssd/src/nvm_addr.c > CMakeFiles/lightnvm_so.dir/src/nvm_addr.c.i

src/libocssd/CMakeFiles/lightnvm_so.dir/src/nvm_addr.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/lightnvm_so.dir/src/nvm_addr.c.s"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/libocssd && /opt/rh/devtoolset-7/root/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/wuyue/ceph-13.2.2/src/libocssd/src/nvm_addr.c -o CMakeFiles/lightnvm_so.dir/src/nvm_addr.c.s

src/libocssd/CMakeFiles/lightnvm_so.dir/src/nvm_vblk.c.o: src/libocssd/CMakeFiles/lightnvm_so.dir/flags.make
src/libocssd/CMakeFiles/lightnvm_so.dir/src/nvm_vblk.c.o: ../src/libocssd/src/nvm_vblk.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/wuyue/ceph-13.2.2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Building C object src/libocssd/CMakeFiles/lightnvm_so.dir/src/nvm_vblk.c.o"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/libocssd && /opt/rh/devtoolset-7/root/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/lightnvm_so.dir/src/nvm_vblk.c.o   -c /home/wuyue/ceph-13.2.2/src/libocssd/src/nvm_vblk.c

src/libocssd/CMakeFiles/lightnvm_so.dir/src/nvm_vblk.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/lightnvm_so.dir/src/nvm_vblk.c.i"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/libocssd && /opt/rh/devtoolset-7/root/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/wuyue/ceph-13.2.2/src/libocssd/src/nvm_vblk.c > CMakeFiles/lightnvm_so.dir/src/nvm_vblk.c.i

src/libocssd/CMakeFiles/lightnvm_so.dir/src/nvm_vblk.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/lightnvm_so.dir/src/nvm_vblk.c.s"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/libocssd && /opt/rh/devtoolset-7/root/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/wuyue/ceph-13.2.2/src/libocssd/src/nvm_vblk.c -o CMakeFiles/lightnvm_so.dir/src/nvm_vblk.c.s

src/libocssd/CMakeFiles/lightnvm_so.dir/src/be_nvme/nvm_baidu.c.o: src/libocssd/CMakeFiles/lightnvm_so.dir/flags.make
src/libocssd/CMakeFiles/lightnvm_so.dir/src/be_nvme/nvm_baidu.c.o: ../src/libocssd/src/be_nvme/nvm_baidu.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/wuyue/ceph-13.2.2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_10) "Building C object src/libocssd/CMakeFiles/lightnvm_so.dir/src/be_nvme/nvm_baidu.c.o"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/libocssd && /opt/rh/devtoolset-7/root/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/lightnvm_so.dir/src/be_nvme/nvm_baidu.c.o   -c /home/wuyue/ceph-13.2.2/src/libocssd/src/be_nvme/nvm_baidu.c

src/libocssd/CMakeFiles/lightnvm_so.dir/src/be_nvme/nvm_baidu.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/lightnvm_so.dir/src/be_nvme/nvm_baidu.c.i"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/libocssd && /opt/rh/devtoolset-7/root/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/wuyue/ceph-13.2.2/src/libocssd/src/be_nvme/nvm_baidu.c > CMakeFiles/lightnvm_so.dir/src/be_nvme/nvm_baidu.c.i

src/libocssd/CMakeFiles/lightnvm_so.dir/src/be_nvme/nvm_baidu.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/lightnvm_so.dir/src/be_nvme/nvm_baidu.c.s"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/libocssd && /opt/rh/devtoolset-7/root/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/wuyue/ceph-13.2.2/src/libocssd/src/be_nvme/nvm_baidu.c -o CMakeFiles/lightnvm_so.dir/src/be_nvme/nvm_baidu.c.s

src/libocssd/CMakeFiles/lightnvm_so.dir/src/be_nvme/nvm_async.c.o: src/libocssd/CMakeFiles/lightnvm_so.dir/flags.make
src/libocssd/CMakeFiles/lightnvm_so.dir/src/be_nvme/nvm_async.c.o: ../src/libocssd/src/be_nvme/nvm_async.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/wuyue/ceph-13.2.2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_11) "Building C object src/libocssd/CMakeFiles/lightnvm_so.dir/src/be_nvme/nvm_async.c.o"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/libocssd && /opt/rh/devtoolset-7/root/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/lightnvm_so.dir/src/be_nvme/nvm_async.c.o   -c /home/wuyue/ceph-13.2.2/src/libocssd/src/be_nvme/nvm_async.c

src/libocssd/CMakeFiles/lightnvm_so.dir/src/be_nvme/nvm_async.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/lightnvm_so.dir/src/be_nvme/nvm_async.c.i"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/libocssd && /opt/rh/devtoolset-7/root/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/wuyue/ceph-13.2.2/src/libocssd/src/be_nvme/nvm_async.c > CMakeFiles/lightnvm_so.dir/src/be_nvme/nvm_async.c.i

src/libocssd/CMakeFiles/lightnvm_so.dir/src/be_nvme/nvm_async.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/lightnvm_so.dir/src/be_nvme/nvm_async.c.s"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/libocssd && /opt/rh/devtoolset-7/root/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/wuyue/ceph-13.2.2/src/libocssd/src/be_nvme/nvm_async.c -o CMakeFiles/lightnvm_so.dir/src/be_nvme/nvm_async.c.s

src/libocssd/CMakeFiles/lightnvm_so.dir/src/be_nvme/nvm_cmb.c.o: src/libocssd/CMakeFiles/lightnvm_so.dir/flags.make
src/libocssd/CMakeFiles/lightnvm_so.dir/src/be_nvme/nvm_cmb.c.o: ../src/libocssd/src/be_nvme/nvm_cmb.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/wuyue/ceph-13.2.2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_12) "Building C object src/libocssd/CMakeFiles/lightnvm_so.dir/src/be_nvme/nvm_cmb.c.o"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/libocssd && /opt/rh/devtoolset-7/root/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/lightnvm_so.dir/src/be_nvme/nvm_cmb.c.o   -c /home/wuyue/ceph-13.2.2/src/libocssd/src/be_nvme/nvm_cmb.c

src/libocssd/CMakeFiles/lightnvm_so.dir/src/be_nvme/nvm_cmb.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/lightnvm_so.dir/src/be_nvme/nvm_cmb.c.i"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/libocssd && /opt/rh/devtoolset-7/root/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/wuyue/ceph-13.2.2/src/libocssd/src/be_nvme/nvm_cmb.c > CMakeFiles/lightnvm_so.dir/src/be_nvme/nvm_cmb.c.i

src/libocssd/CMakeFiles/lightnvm_so.dir/src/be_nvme/nvm_cmb.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/lightnvm_so.dir/src/be_nvme/nvm_cmb.c.s"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/libocssd && /opt/rh/devtoolset-7/root/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/wuyue/ceph-13.2.2/src/libocssd/src/be_nvme/nvm_cmb.c -o CMakeFiles/lightnvm_so.dir/src/be_nvme/nvm_cmb.c.s

src/libocssd/CMakeFiles/lightnvm_so.dir/src/be_nvme/nvm_aer.c.o: src/libocssd/CMakeFiles/lightnvm_so.dir/flags.make
src/libocssd/CMakeFiles/lightnvm_so.dir/src/be_nvme/nvm_aer.c.o: ../src/libocssd/src/be_nvme/nvm_aer.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/wuyue/ceph-13.2.2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_13) "Building C object src/libocssd/CMakeFiles/lightnvm_so.dir/src/be_nvme/nvm_aer.c.o"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/libocssd && /opt/rh/devtoolset-7/root/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/lightnvm_so.dir/src/be_nvme/nvm_aer.c.o   -c /home/wuyue/ceph-13.2.2/src/libocssd/src/be_nvme/nvm_aer.c

src/libocssd/CMakeFiles/lightnvm_so.dir/src/be_nvme/nvm_aer.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/lightnvm_so.dir/src/be_nvme/nvm_aer.c.i"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/libocssd && /opt/rh/devtoolset-7/root/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/wuyue/ceph-13.2.2/src/libocssd/src/be_nvme/nvm_aer.c > CMakeFiles/lightnvm_so.dir/src/be_nvme/nvm_aer.c.i

src/libocssd/CMakeFiles/lightnvm_so.dir/src/be_nvme/nvm_aer.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/lightnvm_so.dir/src/be_nvme/nvm_aer.c.s"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/libocssd && /opt/rh/devtoolset-7/root/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/wuyue/ceph-13.2.2/src/libocssd/src/be_nvme/nvm_aer.c -o CMakeFiles/lightnvm_so.dir/src/be_nvme/nvm_aer.c.s

src/libocssd/CMakeFiles/lightnvm_so.dir/objssd/objssd-nvme.c.o: src/libocssd/CMakeFiles/lightnvm_so.dir/flags.make
src/libocssd/CMakeFiles/lightnvm_so.dir/objssd/objssd-nvme.c.o: ../src/libocssd/objssd/objssd-nvme.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/wuyue/ceph-13.2.2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_14) "Building C object src/libocssd/CMakeFiles/lightnvm_so.dir/objssd/objssd-nvme.c.o"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/libocssd && /opt/rh/devtoolset-7/root/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/lightnvm_so.dir/objssd/objssd-nvme.c.o   -c /home/wuyue/ceph-13.2.2/src/libocssd/objssd/objssd-nvme.c

src/libocssd/CMakeFiles/lightnvm_so.dir/objssd/objssd-nvme.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/lightnvm_so.dir/objssd/objssd-nvme.c.i"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/libocssd && /opt/rh/devtoolset-7/root/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/wuyue/ceph-13.2.2/src/libocssd/objssd/objssd-nvme.c > CMakeFiles/lightnvm_so.dir/objssd/objssd-nvme.c.i

src/libocssd/CMakeFiles/lightnvm_so.dir/objssd/objssd-nvme.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/lightnvm_so.dir/objssd/objssd-nvme.c.s"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/libocssd && /opt/rh/devtoolset-7/root/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/wuyue/ceph-13.2.2/src/libocssd/objssd/objssd-nvme.c -o CMakeFiles/lightnvm_so.dir/objssd/objssd-nvme.c.s

src/libocssd/CMakeFiles/lightnvm_so.dir/objssd/objssd-bbt.c.o: src/libocssd/CMakeFiles/lightnvm_so.dir/flags.make
src/libocssd/CMakeFiles/lightnvm_so.dir/objssd/objssd-bbt.c.o: ../src/libocssd/objssd/objssd-bbt.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/wuyue/ceph-13.2.2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_15) "Building C object src/libocssd/CMakeFiles/lightnvm_so.dir/objssd/objssd-bbt.c.o"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/libocssd && /opt/rh/devtoolset-7/root/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/lightnvm_so.dir/objssd/objssd-bbt.c.o   -c /home/wuyue/ceph-13.2.2/src/libocssd/objssd/objssd-bbt.c

src/libocssd/CMakeFiles/lightnvm_so.dir/objssd/objssd-bbt.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/lightnvm_so.dir/objssd/objssd-bbt.c.i"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/libocssd && /opt/rh/devtoolset-7/root/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/wuyue/ceph-13.2.2/src/libocssd/objssd/objssd-bbt.c > CMakeFiles/lightnvm_so.dir/objssd/objssd-bbt.c.i

src/libocssd/CMakeFiles/lightnvm_so.dir/objssd/objssd-bbt.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/lightnvm_so.dir/objssd/objssd-bbt.c.s"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/libocssd && /opt/rh/devtoolset-7/root/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/wuyue/ceph-13.2.2/src/libocssd/objssd/objssd-bbt.c -o CMakeFiles/lightnvm_so.dir/objssd/objssd-bbt.c.s

src/libocssd/CMakeFiles/lightnvm_so.dir/objssd/objssd-map.c.o: src/libocssd/CMakeFiles/lightnvm_so.dir/flags.make
src/libocssd/CMakeFiles/lightnvm_so.dir/objssd/objssd-map.c.o: ../src/libocssd/objssd/objssd-map.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/wuyue/ceph-13.2.2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_16) "Building C object src/libocssd/CMakeFiles/lightnvm_so.dir/objssd/objssd-map.c.o"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/libocssd && /opt/rh/devtoolset-7/root/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/lightnvm_so.dir/objssd/objssd-map.c.o   -c /home/wuyue/ceph-13.2.2/src/libocssd/objssd/objssd-map.c

src/libocssd/CMakeFiles/lightnvm_so.dir/objssd/objssd-map.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/lightnvm_so.dir/objssd/objssd-map.c.i"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/libocssd && /opt/rh/devtoolset-7/root/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/wuyue/ceph-13.2.2/src/libocssd/objssd/objssd-map.c > CMakeFiles/lightnvm_so.dir/objssd/objssd-map.c.i

src/libocssd/CMakeFiles/lightnvm_so.dir/objssd/objssd-map.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/lightnvm_so.dir/objssd/objssd-map.c.s"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/libocssd && /opt/rh/devtoolset-7/root/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/wuyue/ceph-13.2.2/src/libocssd/objssd/objssd-map.c -o CMakeFiles/lightnvm_so.dir/objssd/objssd-map.c.s

src/libocssd/CMakeFiles/lightnvm_so.dir/objssd/objssd-rw.c.o: src/libocssd/CMakeFiles/lightnvm_so.dir/flags.make
src/libocssd/CMakeFiles/lightnvm_so.dir/objssd/objssd-rw.c.o: ../src/libocssd/objssd/objssd-rw.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/wuyue/ceph-13.2.2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_17) "Building C object src/libocssd/CMakeFiles/lightnvm_so.dir/objssd/objssd-rw.c.o"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/libocssd && /opt/rh/devtoolset-7/root/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/lightnvm_so.dir/objssd/objssd-rw.c.o   -c /home/wuyue/ceph-13.2.2/src/libocssd/objssd/objssd-rw.c

src/libocssd/CMakeFiles/lightnvm_so.dir/objssd/objssd-rw.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/lightnvm_so.dir/objssd/objssd-rw.c.i"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/libocssd && /opt/rh/devtoolset-7/root/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/wuyue/ceph-13.2.2/src/libocssd/objssd/objssd-rw.c > CMakeFiles/lightnvm_so.dir/objssd/objssd-rw.c.i

src/libocssd/CMakeFiles/lightnvm_so.dir/objssd/objssd-rw.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/lightnvm_so.dir/objssd/objssd-rw.c.s"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/libocssd && /opt/rh/devtoolset-7/root/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/wuyue/ceph-13.2.2/src/libocssd/objssd/objssd-rw.c -o CMakeFiles/lightnvm_so.dir/objssd/objssd-rw.c.s

src/libocssd/CMakeFiles/lightnvm_so.dir/objssd/objssd-thread.c.o: src/libocssd/CMakeFiles/lightnvm_so.dir/flags.make
src/libocssd/CMakeFiles/lightnvm_so.dir/objssd/objssd-thread.c.o: ../src/libocssd/objssd/objssd-thread.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/wuyue/ceph-13.2.2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_18) "Building C object src/libocssd/CMakeFiles/lightnvm_so.dir/objssd/objssd-thread.c.o"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/libocssd && /opt/rh/devtoolset-7/root/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/lightnvm_so.dir/objssd/objssd-thread.c.o   -c /home/wuyue/ceph-13.2.2/src/libocssd/objssd/objssd-thread.c

src/libocssd/CMakeFiles/lightnvm_so.dir/objssd/objssd-thread.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/lightnvm_so.dir/objssd/objssd-thread.c.i"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/libocssd && /opt/rh/devtoolset-7/root/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/wuyue/ceph-13.2.2/src/libocssd/objssd/objssd-thread.c > CMakeFiles/lightnvm_so.dir/objssd/objssd-thread.c.i

src/libocssd/CMakeFiles/lightnvm_so.dir/objssd/objssd-thread.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/lightnvm_so.dir/objssd/objssd-thread.c.s"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/libocssd && /opt/rh/devtoolset-7/root/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/wuyue/ceph-13.2.2/src/libocssd/objssd/objssd-thread.c -o CMakeFiles/lightnvm_so.dir/objssd/objssd-thread.c.s

src/libocssd/CMakeFiles/lightnvm_so.dir/objssd/queue.c.o: src/libocssd/CMakeFiles/lightnvm_so.dir/flags.make
src/libocssd/CMakeFiles/lightnvm_so.dir/objssd/queue.c.o: ../src/libocssd/objssd/queue.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/wuyue/ceph-13.2.2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_19) "Building C object src/libocssd/CMakeFiles/lightnvm_so.dir/objssd/queue.c.o"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/libocssd && /opt/rh/devtoolset-7/root/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/lightnvm_so.dir/objssd/queue.c.o   -c /home/wuyue/ceph-13.2.2/src/libocssd/objssd/queue.c

src/libocssd/CMakeFiles/lightnvm_so.dir/objssd/queue.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/lightnvm_so.dir/objssd/queue.c.i"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/libocssd && /opt/rh/devtoolset-7/root/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/wuyue/ceph-13.2.2/src/libocssd/objssd/queue.c > CMakeFiles/lightnvm_so.dir/objssd/queue.c.i

src/libocssd/CMakeFiles/lightnvm_so.dir/objssd/queue.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/lightnvm_so.dir/objssd/queue.c.s"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/libocssd && /opt/rh/devtoolset-7/root/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/wuyue/ceph-13.2.2/src/libocssd/objssd/queue.c -o CMakeFiles/lightnvm_so.dir/objssd/queue.c.s

# Object files for target lightnvm_so
lightnvm_so_OBJECTS = \
"CMakeFiles/lightnvm_so.dir/src/nvm_spec.c.o" \
"CMakeFiles/lightnvm_so.dir/src/nvm_be.c.o" \
"CMakeFiles/lightnvm_so.dir/src/be_lightnvm/nvm_be_ioctl.c.o" \
"CMakeFiles/lightnvm_so.dir/src/nvm_dev.c.o" \
"CMakeFiles/lightnvm_so.dir/src/nvm_buf.c.o" \
"CMakeFiles/lightnvm_so.dir/src/nvm_bbt.c.o" \
"CMakeFiles/lightnvm_so.dir/src/nvm_cmd.c.o" \
"CMakeFiles/lightnvm_so.dir/src/nvm_addr.c.o" \
"CMakeFiles/lightnvm_so.dir/src/nvm_vblk.c.o" \
"CMakeFiles/lightnvm_so.dir/src/be_nvme/nvm_baidu.c.o" \
"CMakeFiles/lightnvm_so.dir/src/be_nvme/nvm_async.c.o" \
"CMakeFiles/lightnvm_so.dir/src/be_nvme/nvm_cmb.c.o" \
"CMakeFiles/lightnvm_so.dir/src/be_nvme/nvm_aer.c.o" \
"CMakeFiles/lightnvm_so.dir/objssd/objssd-nvme.c.o" \
"CMakeFiles/lightnvm_so.dir/objssd/objssd-bbt.c.o" \
"CMakeFiles/lightnvm_so.dir/objssd/objssd-map.c.o" \
"CMakeFiles/lightnvm_so.dir/objssd/objssd-rw.c.o" \
"CMakeFiles/lightnvm_so.dir/objssd/objssd-thread.c.o" \
"CMakeFiles/lightnvm_so.dir/objssd/queue.c.o"

# External object files for target lightnvm_so
lightnvm_so_EXTERNAL_OBJECTS =

lib/liblightnvm.so: src/libocssd/CMakeFiles/lightnvm_so.dir/src/nvm_spec.c.o
lib/liblightnvm.so: src/libocssd/CMakeFiles/lightnvm_so.dir/src/nvm_be.c.o
lib/liblightnvm.so: src/libocssd/CMakeFiles/lightnvm_so.dir/src/be_lightnvm/nvm_be_ioctl.c.o
lib/liblightnvm.so: src/libocssd/CMakeFiles/lightnvm_so.dir/src/nvm_dev.c.o
lib/liblightnvm.so: src/libocssd/CMakeFiles/lightnvm_so.dir/src/nvm_buf.c.o
lib/liblightnvm.so: src/libocssd/CMakeFiles/lightnvm_so.dir/src/nvm_bbt.c.o
lib/liblightnvm.so: src/libocssd/CMakeFiles/lightnvm_so.dir/src/nvm_cmd.c.o
lib/liblightnvm.so: src/libocssd/CMakeFiles/lightnvm_so.dir/src/nvm_addr.c.o
lib/liblightnvm.so: src/libocssd/CMakeFiles/lightnvm_so.dir/src/nvm_vblk.c.o
lib/liblightnvm.so: src/libocssd/CMakeFiles/lightnvm_so.dir/src/be_nvme/nvm_baidu.c.o
lib/liblightnvm.so: src/libocssd/CMakeFiles/lightnvm_so.dir/src/be_nvme/nvm_async.c.o
lib/liblightnvm.so: src/libocssd/CMakeFiles/lightnvm_so.dir/src/be_nvme/nvm_cmb.c.o
lib/liblightnvm.so: src/libocssd/CMakeFiles/lightnvm_so.dir/src/be_nvme/nvm_aer.c.o
lib/liblightnvm.so: src/libocssd/CMakeFiles/lightnvm_so.dir/objssd/objssd-nvme.c.o
lib/liblightnvm.so: src/libocssd/CMakeFiles/lightnvm_so.dir/objssd/objssd-bbt.c.o
lib/liblightnvm.so: src/libocssd/CMakeFiles/lightnvm_so.dir/objssd/objssd-map.c.o
lib/liblightnvm.so: src/libocssd/CMakeFiles/lightnvm_so.dir/objssd/objssd-rw.c.o
lib/liblightnvm.so: src/libocssd/CMakeFiles/lightnvm_so.dir/objssd/objssd-thread.c.o
lib/liblightnvm.so: src/libocssd/CMakeFiles/lightnvm_so.dir/objssd/queue.c.o
lib/liblightnvm.so: src/libocssd/CMakeFiles/lightnvm_so.dir/build.make
lib/liblightnvm.so: src/libocssd/CMakeFiles/lightnvm_so.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/wuyue/ceph-13.2.2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_20) "Linking C shared library ../../lib/liblightnvm.so"
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/libocssd && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/lightnvm_so.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/libocssd/CMakeFiles/lightnvm_so.dir/build: lib/liblightnvm.so

.PHONY : src/libocssd/CMakeFiles/lightnvm_so.dir/build

src/libocssd/CMakeFiles/lightnvm_so.dir/clean:
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/libocssd && $(CMAKE_COMMAND) -P CMakeFiles/lightnvm_so.dir/cmake_clean.cmake
.PHONY : src/libocssd/CMakeFiles/lightnvm_so.dir/clean

src/libocssd/CMakeFiles/lightnvm_so.dir/depend:
	cd /home/wuyue/ceph-13.2.2/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/wuyue/ceph-13.2.2 /home/wuyue/ceph-13.2.2/src/libocssd /home/wuyue/ceph-13.2.2/cmake-build-debug /home/wuyue/ceph-13.2.2/cmake-build-debug/src/libocssd /home/wuyue/ceph-13.2.2/cmake-build-debug/src/libocssd/CMakeFiles/lightnvm_so.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/libocssd/CMakeFiles/lightnvm_so.dir/depend

