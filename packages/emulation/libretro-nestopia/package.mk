# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="libretro-nestopia"
PKG_VERSION="70c53f08c0cc92e90d095d6558ab737ce20431ac"
PKG_SHA256="343f547dc057f8e2929801aefe5c40abb9c35feffcefb2b5eaa2880bad8de8eb"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/libretro/nestopia"
PKG_URL="https://github.com/libretro/nestopia/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain kodi-platform"
PKG_LONGDESC="game.libretro.nestopia: Nestopia for Kodi"
PKG_TOOLCHAIN="make"

PKG_LIBNAME="nestopia_libretro.so"
PKG_LIBPATH="libretro/$PKG_LIBNAME"
PKG_LIBVAR="NESTOPIA_LIB"

PKG_MAKE_OPTS_TARGET="-C libretro GIT_VERSION=${PKG_VERSION:0:7}"

pre_configure_target() {
  if [ "${ARCH}" = "arm" ]; then
    if [ "${PROJECT}" = "RPi" ]; then
      PKG_MAKE_OPTS_TARGET+=" platform=rpi2"
    else
      PKG_MAKE_OPTS_TARGET+=" platform=armv"
      # ARM NEON support
      if target_has_feature neon; then
        PKG_MAKE_OPTS_TARGET+="-neon"
      fi
      PKG_MAKE_OPTS_TARGET+="-${TARGET_FLOAT}float-${TARGET_CPU}"
    fi
  fi
}

makeinstall_target() {
  mkdir -p $SYSROOT_PREFIX/usr/lib/cmake/$PKG_NAME
  cp $PKG_LIBPATH $SYSROOT_PREFIX/usr/lib/$PKG_LIBNAME
  echo "set($PKG_LIBVAR $SYSROOT_PREFIX/usr/lib/$PKG_LIBNAME)" > $SYSROOT_PREFIX/usr/lib/cmake/$PKG_NAME/$PKG_NAME-config.cmake
}
