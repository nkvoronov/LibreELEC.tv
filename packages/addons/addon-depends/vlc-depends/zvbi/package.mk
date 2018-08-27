# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="zvbi"
PKG_VERSION="0.2.35"
#PKG_SHA256="9ba8b04bdb13f7860a2041768ac83b47b397a36549c71c530b94028a3cfd5b51"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://zapping.sourceforge.net/ZVBI/index.html"
PKG_URL="http://downloads.sourceforge.net/sourceforge/zapping/$PKG_NAME-$PKG_VERSION.tar.bz2"
PKG_DEPENDS_TARGET="toolchain libpng"
PKG_SECTION="multimedia"
PKG_SHORTDESC="Vertical Blanking Interval decoder (VBI)"
PKG_LONGDESC="The VBI devices capture the hidden lines on a television picture that carry further information like closed-caption data, Teletext (primarily in Europe), and now Intercast and the ATVEC Internet television encodings."
PKG_TOOLCHAIN="autotools"

PKG_CONFIGURE_OPTS_TARGET="--enable-static --disable-shared"

post_makeinstall_target() {
  rm -rf $INSTALL/usr/bin
  rm -rf $INSTALL/usr/sbin
}
