# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="libdc1394"
PKG_VERSION="2.2.6"
PKG_SHA256="2b905fc9aa4eec6bdcf6a2ae5f5ba021232739f5be047dec8fe8dd6049c10fed"
PKG_LICENSE="GPL"
PKG_SITE="http://damien.douxchamps.net/ieee1394/libdc1394"
PKG_URL="http://downloads.sourceforge.net/${PKG_NAME}/${PKG_NAME}-${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain libraw1394 libusb libX11 SDL"
PKG_LONGDESC="high level programming interface for IEEE1394 digital camera - development libdc1394 is a library that is intended to provide a high level programming interface for application developers who wish to control IEEE 1394 based cameras that conform to the 1394-based Digital Camera"
PKG_TOOLCHAIN="autotools"

PKG_CONFIGURE_OPTS_TARGET="--with-sdl-prefix=${SYSROOT_PREFIX}/usr --disable-examples"
