# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="libdvdread"
PKG_VERSION="6.0.0"
PKG_SHA256="b33b1953b4860545b75f6efc06e01d9849e2ea4f797652263b0b4af6dd10f935"
PKG_LICENSE="GPL"
PKG_SITE="https://www.videolan.org/developers/libdvdnav.html"
PKG_URL="https://download.videolan.org/videolan/$PKG_NAME/$PKG_VERSION/$PKG_NAME-$PKG_VERSION.tar.bz2"
PKG_SOURCE_DIR="libdvdread-$PKG_VERSION"
PKG_DEPENDS_TARGET="toolchain glibc libdvdcss"
PKG_LONGDESC="Provides a simple foundation for reading DVD video disks"
PKG_TOOLCHAIN="autotools"

PKG_CONFIGURE_OPTS_TARGET="--prefix=/usr"
