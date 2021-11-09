# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2021-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="libretro-opera"
PKG_VERSION="7369aa80f2e965036f705a311e5d5f30ab98cc14"
PKG_SHA256="8b4d50ace3afc277ea727ad81bd689797bbe76ee6eea8bf86063fb94b4c56619"
PKG_LICENSE="GPL-2.0-or-later"
PKG_SITE="https://github.com/libretro/opera-libretro"
PKG_URL="https://github.com/libretro/opera-libretro/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain kodi-platform"
PKG_LONGDESC="game.libretro.opera: Port of 4DO/libfreedo for Kodi."
PKG_TOOLCHAIN="make"
PKG_BUILD_FLAGS="+lto"

PKG_LIBNAME="opera_libretro.so"
PKG_LIBPATH="${PKG_LIBNAME}"
PKG_LIBVAR="OPERA_LIB"

PKG_MAKE_OPTS_TARGET="GIT_VERSION=${PKG_VERSION:0:7}"

makeinstall_target() {
  mkdir -p ${SYSROOT_PREFIX}/usr/lib/cmake/${PKG_NAME}
  cp ${PKG_LIBPATH} ${SYSROOT_PREFIX}/usr/lib/${PKG_LIBNAME}
  echo "set(${PKG_LIBVAR} ${SYSROOT_PREFIX}/usr/lib/${PKG_LIBNAME})" > ${SYSROOT_PREFIX}/usr/lib/cmake/${PKG_NAME}/${PKG_NAME}-config.cmake
}
