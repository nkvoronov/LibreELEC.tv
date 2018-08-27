# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="libmicrodns"
PKG_VERSION="0.0.10"
#PKG_SHA256="9ba8b04bdb13f7860a2041768ac83b47b397a36549c71c530b94028a3cfd5b51"
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