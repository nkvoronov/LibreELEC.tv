# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="twolame"
PKG_VERSION="0.3.13"
PKG_SHA256="98f332f48951f47f23f70fd0379463aff7d7fb26f07e1e24e42ddef22cc6112a"
PKG_LICENSE="GPL"
PKG_SITE="https://www.libarchive.org"
PKG_URL="https://downloads.sourceforge.net/$PKG_NAME/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="An optimized MPEG Audio Layer 2 (MP2) encoder"

PKG_CONFIGURE_OPTS_TARGET="--prefix=/usr --disable-static"

post_makeinstall_target() {
  rm -rf $INSTALL/usr/bin
}