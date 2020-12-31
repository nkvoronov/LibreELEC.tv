# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="libhdhomerun"
PKG_VERSION="20200907"
PKG_SHA256="cbaeb779c5a4e07db45310ef4271872bcb7c472402ebc3c58e224653c09400ed"
PKG_LICENSE="LGPL"
PKG_SITE="http://www.silicondust.com"
PKG_URL="https://download.silicondust.com/hdhomerun/${PKG_NAME}_${PKG_VERSION}.tgz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="The library provides functionality to setup the HDHomeRun."

PKG_MAKE_OPTS_TARGET="CROSS_COMPILE=$TARGET_PREFIX"

makeinstall_target() {
  mkdir -p $INSTALL/usr/bin
    cp -PR hdhomerun_config $INSTALL/usr/bin

  mkdir -p $INSTALL/usr/lib/
    cp -PR libhdhomerun.so $INSTALL/usr/lib/

  mkdir -p $SYSROOT_PREFIX/usr/include/hdhomerun
    cp *.h $SYSROOT_PREFIX/usr/include/hdhomerun

  mkdir -p $SYSROOT_PREFIX/usr/lib
    cp libhdhomerun.so $SYSROOT_PREFIX/usr/lib
}
