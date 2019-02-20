# Install script for directory: /home/wuyue/ceph-13.2.2/src/pybind

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
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/lib/python2.7/site-packages/ceph_argparse.py;/usr/local/lib/python2.7/site-packages/ceph_daemon.py;/usr/local/lib/python2.7/site-packages/ceph_volume_client.py")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/usr/local/lib/python2.7/site-packages" TYPE FILE FILES
    "/home/wuyue/ceph-13.2.2/src/pybind/ceph_argparse.py"
    "/home/wuyue/ceph-13.2.2/src/pybind/ceph_daemon.py"
    "/home/wuyue/ceph-13.2.2/src/pybind/ceph_volume_client.py"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib64/ceph" TYPE DIRECTORY FILES "/home/wuyue/ceph-13.2.2/src/pybind/mgr" REGEX ".*/\\.gitignore" EXCLUDE)
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/wuyue/ceph-13.2.2/cmake-build-debug/src/pybind/rados/cmake_install.cmake")
  include("/home/wuyue/ceph-13.2.2/cmake-build-debug/src/pybind/rbd/cmake_install.cmake")
  include("/home/wuyue/ceph-13.2.2/cmake-build-debug/src/pybind/cephfs/cmake_install.cmake")
  include("/home/wuyue/ceph-13.2.2/cmake-build-debug/src/pybind/rgw/cmake_install.cmake")
  include("/home/wuyue/ceph-13.2.2/cmake-build-debug/src/pybind/mgr/cmake_install.cmake")

endif()

