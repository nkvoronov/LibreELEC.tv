# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="libxpm"
PKG_VERSION="3.5.13"
PKG_SHA256="9cd1da57588b6cb71450eff2273ef6b657537a9ac4d02d0014228845b935ac25"
PKG_LICENSE="GPL"
PKG_SITE="https://xorg.freedesktop.org"
PKG_URL="https://xorg.freedesktop.org/releases/individual/lib/libXpm-${PKG_VERSION}.tar.bz2"
PKG_DEPENDS_TARGET="toolchain libXt libXext"
PKG_LONGDESC="X11 pixmap library"

PKG_CONFIGURE_OPTS_TARGET="--prefix=/usr --disable-static"

post_makeinstall_target() {
  rm -rf ${INSTALL}/usr/bin
}