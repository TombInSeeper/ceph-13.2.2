# Install script for directory: /home/wuyue/ceph-13.2.2/systemd

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/libexec/systemd/system" TYPE FILE FILES "/home/wuyue/ceph-13.2.2/cmake-build-debug/systemd/ceph-fuse@.service")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/libexec/systemd/system" TYPE FILE FILES "/home/wuyue/ceph-13.2.2/cmake-build-debug/systemd/ceph-mds@.service")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/libexec/systemd/system" TYPE FILE FILES "/home/wuyue/ceph-13.2.2/cmake-build-debug/systemd/ceph-mgr@.service")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/libexec/systemd/system" TYPE FILE FILES "/home/wuyue/ceph-13.2.2/cmake-build-debug/systemd/ceph-mon@.service")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/libexec/systemd/system" TYPE FILE FILES "/home/wuyue/ceph-13.2.2/cmake-build-debug/systemd/ceph-osd@.service")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/libexec/systemd/system" TYPE FILE FILES "/home/wuyue/ceph-13.2.2/cmake-build-debug/systemd/ceph-radosgw@.service")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/libexec/systemd/system" TYPE FILE FILES "/home/wuyue/ceph-13.2.2/cmake-build-debug/systemd/ceph-rbd-mirror@.service")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/libexec/systemd/system" TYPE FILE FILES "/home/wuyue/ceph-13.2.2/cmake-build-debug/systemd/rbdmap.service")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/libexec/systemd/system" TYPE FILE FILES
    "/home/wuyue/ceph-13.2.2/systemd/ceph.target"
    "/home/wuyue/ceph-13.2.2/systemd/ceph-fuse.target"
    "/home/wuyue/ceph-13.2.2/systemd/ceph-osd.target"
    "/home/wuyue/ceph-13.2.2/systemd/ceph-mgr.target"
    "/home/wuyue/ceph-13.2.2/systemd/ceph-mon.target"
    "/home/wuyue/ceph-13.2.2/systemd/ceph-mds.target"
    "/home/wuyue/ceph-13.2.2/systemd/ceph-radosgw.target"
    "/home/wuyue/ceph-13.2.2/systemd/ceph-rbd-mirror.target"
    "/home/wuyue/ceph-13.2.2/systemd/ceph-disk@.service"
    "/home/wuyue/ceph-13.2.2/systemd/ceph-volume@.service"
    )
endif()

