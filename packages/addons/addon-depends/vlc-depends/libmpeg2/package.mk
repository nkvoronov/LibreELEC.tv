# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="libmpeg2"
PKG_VERSION="0.5.1"
#PKG_SHA256="9ba8b04bdb13f7860a2041768ac83b47b397a36549c71c530b94028a3cfd5b51"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://libmpeg2.sourceforge.net/"
PKG_URL="http://libmpeg2.sourceforge.net/files/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="multimedia"
PKG_SHORTDESC="libmpeg2: The MPEG Library - version 2"
PKG_LONGDESC="The MPEG Library is a collection of C routines to decode MPEG-1 and MPEG-2 movies and dither them in a variety of colour schemes."
PKG_TOOLCHAIN="autotools"

PKG_CONFIGURE_OPTS_TARGET="--disable-sdl --without-x"

post_makeinstall_target() {
  rm -rf $INSTALL/usr/bin
}

