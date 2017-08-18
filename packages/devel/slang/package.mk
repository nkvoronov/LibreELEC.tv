################################################################################
#      This file is part of LibreELEC - https://libreelec.tv
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

PKG_NAME="slang"
PKG_VERSION="2.3.1a"
PKG_ARCH="any"
PKG_LICENSE="LGPL"
PKG_SITE="http://www.jedsoft.org/slang/"
PKG_URL="http://www.jedsoft.org/releases/slang/${PKG_NAME}-${PKG_VERSION}.tar.bz2"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="devel"
PKG_SHORTDESC="slang: multi-platform programmer's library designed to allow a developer to create robust multi-platform software."
PKG_LONGDESC="S-Lang is a multi-platform programmer's library designed to allow a developer to create robust multi-platform software. It provides facilities required by interactive applications such as display/screen management, keyboard input, keymaps, and so on. The most exciting feature of the library is the slang interpreter that may be easily embedded into a program to make it extensible. While the emphasis has always been on the embedded nature of the interpreter, it may also be used in a stand-alone fashion through the use of slsh, which is part of the S-Lang distribution."

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

pre_build_target() {
  mkdir -p $PKG_BUILD/.$TARGET_NAME
  cp -RP $PKG_BUILD/* $PKG_BUILD/.$TARGET_NAME
}

configure_target() {
  ./configure --host=$TARGET_NAME \
            --build=$HOST_NAME \
            --prefix=/usr \
            --exec-prefix=/usr \
            --sysconfdir=/etc \
            --datadir=/usr/share \
            --without-iconv \
            --without-onig \
            --without-pcre \
            --without-png \
            --without-z \
            --without-x
}

make_target() {
  MAKEFLAGS=-j1
  make

  mkdir -p $SYSROOT_PREFIX/usr/lib
    cp -P src/"$ARCH"elfobjs/libslan* $SYSROOT_PREFIX/usr/lib
  mkdir -p $SYSROOT_PREFIX/usr/lib/slang/v2/modules
    cp -P modules/"$ARCH"objs/*-module.so $SYSROOT_PREFIX/usr/lib/slang/v2/modules
  mkdir -p $SYSROOT_PREFIX/usr/include
    cp -P src/slang.h $SYSROOT_PREFIX/usr/include
    cp -P src/slcurses.h $SYSROOT_PREFIX/usr/include
  mkdir -p $SYSROOT_PREFIX/usr/lib/pkgconfig
    cp -P slang.pc $SYSROOT_PREFIX/usr/lib/pkgconfig
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib
  cp -P src/"$ARCH"elfobjs/libslan* $INSTALL/usr/lib
}