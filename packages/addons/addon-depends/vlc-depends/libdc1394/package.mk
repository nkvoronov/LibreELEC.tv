# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="libdc1394"
PKG_VERSION="2.2.1"
#PKG_SHA256="9ba8b04bdb13f7860a2041768ac83b47b397a36549c71c530b94028a3cfd5b51"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://damien.douxchamps.net/ieee1394/libdc1394"
PKG_URL="http://downloads.sourceforge.net/$PKG_NAME/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain libraw1394 libusb libX11 SDL"
PKG_SECTION="multimedia"
PKG_SHORTDESC="high level programming interface for IEEE1394 digital camera - development libdc1394 is a library that is intended to provide a high level programming interface for application developers who wish to control IEEE 1394 based cameras that conform to the 1394-based Digital Camera"
PKG_LONGDESC="high level programming interface for IEEE1394 digital camera - development libdc1394 is a library that is intended to provide a high level programming interface for application developers who wish to control IEEE 1394 based cameras that conform to the 1394-based Digital Camera"
PKG_TOOLCHAIN="autotools"

PKG_CONFIGURE_OPTS_TARGET="--enable-static --disable-shared --with-sdl-prefix=$SYSROOT_PREFIX/usr --disable-examples"

pre_configure_target() {
  mkdir -p $SYSROOT_PREFIX/usr/include/dc1394
    cp -P $BUILD/$PKG_NAME-$PKG_VERSION/dc1394/*.h $SYSROOT_PREFIX/usr/include/dc1394
}
