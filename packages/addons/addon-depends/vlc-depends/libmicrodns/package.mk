# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="libmicrodns"
PKG_VERSION="0.2.0"
PKG_SHA256="9864a088ffef4d4255d5abf63c6f603d1dc343dfec2809ff0c3f1624045b80fa"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/videolabs/libmicrodns"
PKG_URL="https://github.com/videolabs/libmicrodns/archive/${PKG_VERSION}/${PKG_NAME}-${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain glibc"

post_makeinstall_target() {
  rm -rf ${INSTALL}/usr/bin
}