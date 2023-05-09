# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="liblivemedia"
PKG_VERSION="2023.01.19"
PKG_SHA256="a7c64913f7f7007c5fdc29ea811e3ca781f262271b3e42afdd4bc1041d86fa99"
PKG_LICENSE="GPL"
PKG_SITE="http://www.live555.com/liveMedia"
PKG_URL="https://download.videolan.org/pub/contrib/live555/live.${PKG_VERSION}.tar.gz"
PKG_SOURCE_DIR="live"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="This code forms a set of C++ libraries for multimedia streaming, using open standard protocols (RTP/RTCP, RTSP, SIP)"
PKG_BUILD_FLAGS="+pic"

pre_build_target() {
  mkdir -p ${PKG_BUILD}/.${TARGET_NAME}
  cp -RP ${PKG_BUILD}/* ${PKG_BUILD}/.${TARGET_NAME}
}

pre_configure_target() {
  ./genMakefiles linux
}

post_makeinstall_target() {

  mkdir -p ${SYSROOT_PREFIX}/usr/lib
  mkdir -p ${SYSROOT_PREFIX}/usr/lib/pkgconfig
    cat > ${SYSROOT_PREFIX}/usr/lib/pkgconfig/live555.pc << "EOF"
prefix=/usr
exec_prefix=${prefix}
libdir=${exec_prefix}/lib
includedir=${prefix}/include

Name: live555
Description: multimedia RTSP streaming library
Version: 2023.01.19
Cflags: -I${includedir}/liveMedia -I${includedir}/groupsock -I${includedir}/BasicUsageEnvironment -I${includedir}/UsageEnvironment
Libs: -L${libdir} -lliveMedia -lgroupsock -lBasicUsageEnvironment -lUsageEnvironment
EOF

  rm -fR ${SYSROOT_PREFIX}/usr/include/BasicUsageEnvironment
  mkdir -p ${SYSROOT_PREFIX}/usr/include/BasicUsageEnvironment
    cp -P ${PKG_BUILD}/.${TARGET_NAME}/BasicUsageEnvironment/include/* ${SYSROOT_PREFIX}/usr/include/BasicUsageEnvironment
    cp -P ${PKG_BUILD}/.${TARGET_NAME}/BasicUsageEnvironment/*.a ${SYSROOT_PREFIX}/usr/lib
  rm -fR  ${SYSROOT_PREFIX}/usr/include/UsageEnvironment
  mkdir -p ${SYSROOT_PREFIX}/usr/include/UsageEnvironment
    cp -P ${PKG_BUILD}/.${TARGET_NAME}/UsageEnvironment/include/* ${SYSROOT_PREFIX}/usr/include/UsageEnvironment
    cp -P ${PKG_BUILD}/.${TARGET_NAME}/UsageEnvironment/*.a ${SYSROOT_PREFIX}/usr/lib
  rm -fR ${SYSROOT_PREFIX}/usr/include/groupsock
  mkdir -p ${SYSROOT_PREFIX}/usr/include/groupsock
    cp -P ${PKG_BUILD}/.${TARGET_NAME}/groupsock/include/* ${SYSROOT_PREFIX}/usr/include/groupsock
    cp -P ${PKG_BUILD}/.${TARGET_NAME}/groupsock/*.a ${SYSROOT_PREFIX}/usr/lib
  rm -fR ${SYSROOT_PREFIX}/usr/include/liveMedia
  mkdir -p ${SYSROOT_PREFIX}/usr/include/liveMedia
    cp -P ${PKG_BUILD}/.${TARGET_NAME}/liveMedia/include/* ${SYSROOT_PREFIX}/usr/include/liveMedia
    cp -P ${PKG_BUILD}/.${TARGET_NAME}/liveMedia/*.a ${SYSROOT_PREFIX}/usr/lib
}
