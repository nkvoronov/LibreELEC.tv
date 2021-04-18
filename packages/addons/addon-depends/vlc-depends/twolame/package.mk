# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="twolame"
PKG_VERSION="0.4.0"
PKG_SHA256="cc35424f6019a88c6f52570b63e1baf50f62963a3eac52a03a800bb070d7c87d"
PKG_LICENSE="GPL"
PKG_SITE="https://www.libarchive.org"
PKG_URL="https://downloads.sourceforge.net/${PKG_NAME}/${PKG_NAME}-${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="An optimized MPEG Audio Layer 2 (MP2) encoder"

PKG_CONFIGURE_OPTS_TARGET="--prefix=/usr --disable-static"

post_makeinstall_target() {
  rm -rf ${INSTALL}/usr/bin
}