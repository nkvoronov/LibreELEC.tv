# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="libretro-mgba"
PKG_VERSION="70ed83cf849ddd620d9ad66e0fc46980184dda89"
PKG_SHA256="5737a0803ffe3254043e764a7ac6ffb7dd20386d8421c33598d6223ac1214b9b"
PKG_LICENSE="MPL 2.0"
PKG_SITE="https://github.com/libretro/mgba"
PKG_URL="https://github.com/libretro/mgba/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain kodi-platform zlib"
PKG_LONGDESC="game.libretro.mgba: mGBA for Kodi"
PKG_TOOLCHAIN="make"

PKG_LIBNAME="mgba_libretro.so"
PKG_LIBPATH="${PKG_LIBNAME}"
PKG_LIBVAR="MGBA_LIB"

pre_configure_target() {
  # fails to build in subdirs
  cd ${PKG_BUILD}
  rm -rf .${TARGET_NAME}
}

make_target() {
  make -f Makefile.libretro
}

makeinstall_target() {
  mkdir -p ${SYSROOT_PREFIX}/usr/lib/cmake/${PKG_NAME}
  cp ${PKG_LIBPATH} ${SYSROOT_PREFIX}/usr/lib/${PKG_LIBNAME}
  echo "set(${PKG_LIBVAR} ${SYSROOT_PREFIX}/usr/lib/${PKG_LIBNAME})" > ${SYSROOT_PREFIX}/usr/lib/cmake/${PKG_NAME}/${PKG_NAME}-config.cmake
}
