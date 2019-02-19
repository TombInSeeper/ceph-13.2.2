# Install script for directory: /home/wuyue/ceph-13.2.2/src/pybind/rgw

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Debug")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "0")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  
    set(ENV{CC} " /opt/rh/devtoolset-7/root/usr/bin/cc")
    set(ENV{LDSHARED} " /opt/rh/devtoolset-7/root/usr/bin/cc -shared")
    set(ENV{CPPFLAGS} "-iquote/home/wuyue/ceph-13.2.2/src/include")
    set(ENV{LDFLAGS} "-L/home/wuyue/ceph-13.2.2/cmake-build-debug/lib")
    set(ENV{CYTHON_BUILD_DIR} "/home/wuyue/ceph-13.2.2/cmake-build-debug/src/pybind/rgw")
    set(ENV{CEPH_LIBDIR} "/home/wuyue/ceph-13.2.2/cmake-build-debug/lib")

    set(options --prefix=/usr/local)
    if(DEFINED ENV{DESTDIR})
      if(EXISTS /etc/debian_version)
        list(APPEND options --install-layout=deb)
      endif()
      list(APPEND options --root=$ENV{DESTDIR})
    else()
      list(APPEND options --root=/)
    endif()
    execute_process(
       COMMAND
           /usr/bin/python2.7 /home/wuyue/ceph-13.2.2/src/pybind/rgw/setup.py
           build --verbose --build-base /home/wuyue/ceph-13.2.2/cmake-build-debug/lib/cython_modules
           --build-platlib /home/wuyue/ceph-13.2.2/cmake-build-debug/lib/cython_modules/lib.2
           build_ext --cython-c-in-temp --build-temp /home/wuyue/ceph-13.2.2/cmake-build-debug/src/pybind/rgw --cython-include-dirs /home/wuyue/ceph-13.2.2/src/pybind/rados
           install ${options} --single-version-externally-managed --record /dev/null
           egg_info --egg-base /home/wuyue/ceph-13.2.2/cmake-build-debug/src/pybind/rgw
           --verbose
       WORKING_DIRECTORY "/home/wuyue/ceph-13.2.2/src/pybind/rgw"
       RESULT_VARIABLE install_res)
    if(NOT "${install_res}" STREQUAL 0)
      message(FATAL_ERROR "Failed to build and install cython_rgw python module")
    endif()
  
endif()

