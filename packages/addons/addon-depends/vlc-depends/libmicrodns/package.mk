# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="libmicrodns"
PKG_VERSION="0.0.10"
PKG_SHA256="623e3077bd940816215d9707c217dc8f957d3dee9b7fd3ea7aaa4de0cd881833"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/videolabs/libmicrodns"
PKG_URL="https://github.com/videolabs/libmicrodns/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain glibc"
PKG_SECTION="devel"
PKG_SHORTDESC="Minimal mDNS resolver library"
PKG_TOOLCHAIN="autotools"

PKG_CONFIGURE_OPTS_TARGET="--prefix=/usr"

post_makeinstall_target() {
  rm -rf $INSTALL/usr/bin
}