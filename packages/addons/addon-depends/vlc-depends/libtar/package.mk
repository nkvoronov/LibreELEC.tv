# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="libtar"
PKG_VERSION="9c2e044"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://www.libarchive.org"
PKG_URL="https://github.com/tklauser/libtar.git"
PKG_DEPENDS_TARGET="toolchain zlib"
PKG_SECTION="devel"
PKG_SHORTDESC="C library for manipulating POSIX tar files"
PKG_TOOLCHAIN="autotools"

PKG_CONFIGURE_OPTS_TARGET="--prefix=/usr --disable-static --disable-tls --disable-encap --disable-epkg-install"

post_makeinstall_target() {
  rm -rf $INSTALL/usr/bin
}