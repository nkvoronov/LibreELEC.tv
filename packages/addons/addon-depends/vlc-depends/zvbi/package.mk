# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="zvbi"
PKG_VERSION="0.2.35"
PKG_SHA256="fc883c34111a487c4a783f91b1b2bb5610d8d8e58dcba80c7ab31e67e4765318"
PKG_LICENSE="GPL"
PKG_SITE="http://zapping.sourceforge.net/ZVBI/index.html"
PKG_URL="http://downloads.sourceforge.net/sourceforge/zapping/${PKG_NAME}-${PKG_VERSION}.tar.bz2"
PKG_DEPENDS_TARGET="toolchain libpng"
PKG_LONGDESC="The VBI devices capture the hidden lines on a television picture that carry further information like closed-caption data, Teletext (primarily in Europe), and now Intercast and the ATVEC Internet television encodings."
PKG_TOOLCHAIN="autotools"

post_makeinstall_target() {
  rm -rf ${INSTALL}/usr/bin
  rm -rf ${INSTALL}/usr/sbin
}
