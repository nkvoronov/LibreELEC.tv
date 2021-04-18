# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="libmicrodns"
PKG_VERSION="0.2.0"
#PKG_SHA256="2b4d733f9472e11b71d66208c025de2e1f4a1087814bdc1e12e1aa78aca670e5"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/videolabs/libmicrodns"
PKG_URL="https://github.com/videolabs/libmicrodns/archive/${PKG_VERSION}/${PKG_NAME}-${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain glibc"

# Meson version is 0.49.1 but project requires >= 0.50.0 !!!!

post_makeinstall_target() {
  rm -rf ${INSTALL}/usr/bin
}