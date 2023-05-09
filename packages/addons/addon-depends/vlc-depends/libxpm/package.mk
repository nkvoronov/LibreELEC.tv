# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="libxpm"
PKG_VERSION="3.5.16"
PKG_SHA256="e6bc5da7a69dbd9bcc67e87c93d4904fe2f5177a0711c56e71fa2f6eff649f51"
PKG_LICENSE="GPL"
PKG_SITE="https://xorg.freedesktop.org"
PKG_URL="https://xorg.freedesktop.org/releases/individual/lib/libXpm-${PKG_VERSION}.tar.xz"
PKG_DEPENDS_TARGET="toolchain libXt libXext"
PKG_LONGDESC="X11 pixmap library"

PKG_CONFIGURE_OPTS_TARGET="--prefix=/usr --disable-static"

post_makeinstall_target() {
  rm -rf ${INSTALL}/usr/bin
}