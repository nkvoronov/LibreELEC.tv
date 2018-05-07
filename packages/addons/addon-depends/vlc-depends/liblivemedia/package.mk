################################################################################
#      This file is part of LibreELEC - http://www.libreelec.tv
#      Copyright (C) 2016 Team LibreELEC
#
#  LibreELEC is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 2 of the License, or
#  (at your option) any later version.
#
#  LibreELEC is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with LibreELEC.  If not, see <http://www.gnu.org/licenses/>.
################################################################################

PKG_NAME="liblivemedia"
PKG_VERSION="2018.04.25"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.live555.com/liveMedia"
PKG_URL="http://live555.com/liveMedia/public/live.$PKG_VERSION.tar.gz"
PKG_SOURCE_DIR="live"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="multimedia"
PKG_SHORTDESC="This code forms a set of C++ libraries for multimedia streaming, using open standard protocols (RTP/RTCP, RTSP, SIP)"
PKG_LONGDESC="This code forms a set of C++ libraries for multimedia streaming, using open standard protocols (RTP/RTCP, RTSP, SIP)"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

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
