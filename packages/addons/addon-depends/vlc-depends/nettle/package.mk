# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="nettle"
PKG_VERSION="3.1.1"
#PKG_SHA256="9ba8b04bdb13f7860a2041768ac83b47b397a36549c71c530b94028a3cfd5b51"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.lysator.liu.se/~nisse/nettle"
PKG_URL="https://ftp.gnu.org/gnu/nettle/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="devel"
PKG_SHORTDESC="The Nettle package contains the low-level cryptographic library that is designed to fit easily in many contexts."
PKG_LONGDESC="The Nettle package contains the low-level cryptographic library that is designed to fit easily in many contexts."
PKG_TOOLCHAIN="autotools"

PKG_CONFIGURE_OPTS_TARGET="--enable-static --disable-shared --enable-mini-gmp"

post_makeinstall_target() {
  rm -rf $INSTALL/usr/bin
}