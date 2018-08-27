# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="libarchive"
PKG_VERSION="3.3.2"
#PKG_SHA256="9ba8b04bdb13f7860a2041768ac83b47b397a36549c71c530b94028a3cfd5b51"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://www.libarchive.org"
PKG_URL="https://www.libarchive.org/downloads/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain attr bzip2 expat lz4 openssl xz zlib"
PKG_SECTION="devel"
PKG_SHORTDESC="Multi-format archive and compression library"
PKG_TOOLCHAIN="autotools"

PKG_CONFIGURE_OPTS_TARGET="--prefix=/usr --without-xml2 --without-nettle --disable-static"

post_makeinstall_target() {
  rm -rf $INSTALL/usr/bin
}