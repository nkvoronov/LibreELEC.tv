# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="libdca"
PKG_VERSION="0.0.7"
PKG_SHA256="3a0b13815f582c661d2388ffcabc2f1ea82f471783c400f765f2ec6c81065f6a"
PKG_LICENSE="GPL"
PKG_SITE="http://www.videolan.org/developers/libdca.html"
PKG_URL="https://download.videolan.org/pub/videolan/${PKG_NAME}/${PKG_VERSION}/${PKG_NAME}-${PKG_VERSION}.tar.bz2"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="decoding library for DTS Coherent Acoustics streams (development) libdca provides a low-level interface to decode audio frames encoded using DTS Coherent Acoustics. DTS Coherent Acoustics streams are commonly found on DVDs, DTS audio CDs and some radio broadcastings. libdca also provides downmixing and dynamic range compression for various output configurations."
PKG_TOOLCHAIN="autotools"

post_makeinstall_target() {
  rm -rf ${INSTALL}/usr/bin
}
