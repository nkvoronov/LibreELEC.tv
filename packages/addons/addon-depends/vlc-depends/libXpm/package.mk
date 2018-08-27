# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="libXpm"
PKG_VERSION="3.5.12"
#PKG_SHA256="9ba8b04bdb13f7860a2041768ac83b47b397a36549c71c530b94028a3cfd5b51"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://xorg.freedesktop.org"
PKG_URL="https://xorg.freedesktop.org/releases/individual/lib/$PKG_NAME-$PKG_VERSION.tar.bz2"
PKG_DEPENDS_TARGET="toolchain libXt libXext"
PKG_SECTION="devel"
PKG_SHORTDESC="X11 pixmap library"
PKG_LONGDESC="X11 pixmap library"

PKG_CONFIGURE_OPTS_TARGET="--prefix=/usr --disable-static"

post_makeinstall_target() {
  rm -rf $INSTALL/usr/bin
}