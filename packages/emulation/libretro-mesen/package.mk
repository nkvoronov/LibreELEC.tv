# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2019-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="libretro-mesen"
PKG_VERSION="373c489b01e6634c7c20174ee1f506e93586f2e6"
PKG_SHA256="4c6ceea14091ab11e30fadb1b14fde4f2f568b5b0a9704cd3b914129f1a7b240"
PKG_LICENSE="GPLv3"
PKG_SITE="https://github.com/SourMesen/Mesen/"
PKG_URL="https://github.com/SourMesen/Mesen/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain kodi-platform"
PKG_LONGDESC="game.libretro.mesen: mesen for Kodi"
PKG_TOOLCHAIN="make"

PKG_LIBNAME="mesen_libretro.so"
PKG_LIBPATH="Libretro/$PKG_LIBNAME"
PKG_LIBVAR="MESEN_LIB"

make_target() {
  make -C Libretro/
}

makeinstall_target() {
  mkdir -p $SYSROOT_PREFIX/usr/lib/cmake/$PKG_NAME
  cp $PKG_LIBPATH $SYSROOT_PREFIX/usr/lib/$PKG_LIBNAME
  echo "set($PKG_LIBVAR $SYSROOT_PREFIX/usr/lib/$PKG_LIBNAME)" > $SYSROOT_PREFIX/usr/lib/cmake/$PKG_NAME/$PKG_NAME-config.cmake
}
