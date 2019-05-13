# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="libxpm"
PKG_VERSION="3.5.12"
PKG_SHA256="fd6a6de3da48de8d1bb738ab6be4ad67f7cb0986c39bd3f7d51dd24f7854bdec"
PKG_LICENSE="GPL"
PKG_SITE="https://xorg.freedesktop.org"
PKG_URL="https://xorg.freedesktop.org/releases/individual/lib/libXpm-$PKG_VERSION.tar.bz2"
PKG_DEPENDS_TARGET="toolchain libXt libXext"
PKG_LONGDESC="X11 pixmap library"

PKG_CONFIGURE_OPTS_TARGET="--prefix=/usr --disable-static"

post_makeinstall_target() {
  rm -rf $INSTALL/usr/bin
}