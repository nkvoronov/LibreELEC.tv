# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="liblivemedia"
PKG_VERSION="2018.04.25"
#PKG_SHA256="9ba8b04bdb13f7860a2041768ac83b47b397a36549c71c530b94028a3cfd5b51"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.live555.com/liveMedia"
PKG_URL="http://live555.com/liveMedia/public/live.$PKG_VERSION.tar.gz"
PKG_SOURCE_DIR="live"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="multimedia"
PKG_SHORTDESC="This code forms a set of C++ libraries for multimedia streaming, using open standard protocols (RTP/RTCP, RTSP, SIP)"
PKG_LONGDESC="This code forms a set of C++ libraries for multimedia streaming, using open standard protocols (RTP/RTCP, RTSP, SIP)"

pre_build_target() {
  mkdir -p $PKG_BUILD/.$TARGET_NAME
  cp -RP $PKG_BUILD/* $PKG_BUILD/.$TARGET_NAME
}

pre_configure_target() {
  strip_lto
  export CFLAGS="$CFLAGS -fPIC -DPIC"
  export CXXFLAGS="$CXXFLAGS -fPIC -DPIC"
  export LDFLAGS="$LDFLAGS -fPIC -DPIC"
  ./genMakefiles linux
}

makeinstall_target() {
  : # nothing to do here
}

post_makeinstall_target() {

  mkdir -p $SYSROOT_PREFIX/usr/lib
  mkdir -p $SYSROOT_PREFIX/usr/lib/pkgconfig
    cat > $SYSROOT_PREFIX/usr/lib/pkgconfig/live555.pc << "EOF"
prefix=/usr
exec_prefix=${prefix}
libdir=${exec_prefix}/lib
includedir=${prefix}/include

Name: live555
Description: multimedia RTSP streaming library
Version: 2015.06.24
Cflags: -I${includedir}/liveMedia -I${includedir}/groupsock -I${includedir}/BasicUsageEnvironment -I${includedir}/UsageEnvironment
Libs: -L${libdir} -lliveMedia -lgroupsock -lBasicUsageEnvironment -lUsageEnvironment
EOF

  rm -fR $SYSROOT_PREFIX/usr/include/BasicUsageEnvironment
  mkdir -p $SYSROOT_PREFIX/usr/include/BasicUsageEnvironment
    cp -P $PKG_BUILD/.$TARGET_NAME/BasicUsageEnvironment/include/* $SYSROOT_PREFIX/usr/include/BasicUsageEnvironment
    cp -P $PKG_BUILD/.$TARGET_NAME/BasicUsageEnvironment/*.a $SYSROOT_PREFIX/usr/lib
  rm -fR  $SYSROOT_PREFIX/usr/include/UsageEnvironment
  mkdir -p $SYSROOT_PREFIX/usr/include/UsageEnvironment
    cp -P $PKG_BUILD/.$TARGET_NAME/UsageEnvironment/include/* $SYSROOT_PREFIX/usr/include/UsageEnvironment
    cp -P $PKG_BUILD/.$TARGET_NAME/UsageEnvironment/*.a $SYSROOT_PREFIX/usr/lib
  rm -fR $SYSROOT_PREFIX/usr/include/groupsock
  mkdir -p $SYSROOT_PREFIX/usr/include/groupsock
    cp -P $PKG_BUILD/.$TARGET_NAME/groupsock/include/* $SYSROOT_PREFIX/usr/include/groupsock
    cp -P $PKG_BUILD/.$TARGET_NAME/groupsock/*.a $SYSROOT_PREFIX/usr/lib
  rm -fR $SYSROOT_PREFIX/usr/include/liveMedia
  mkdir -p $SYSROOT_PREFIX/usr/include/liveMedia
    cp -P $PKG_BUILD/.$TARGET_NAME/liveMedia/include/* $SYSROOT_PREFIX/usr/include/liveMedia
    cp -P $PKG_BUILD/.$TARGET_NAME/liveMedia/*.a $SYSROOT_PREFIX/usr/lib
}
