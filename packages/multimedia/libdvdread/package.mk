# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="libdvdread"
PKG_VERSION="6.1.3"
PKG_SHA256="ce35454997a208cbe50e91232f0e73fb1ac3471965813a13b8730a8f18a15369"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/xbmc/libdvdread"
PKG_URL="https://download.videolan.org/videolan/${PKG_NAME}/${PKG_VERSION}/${PKG_NAME}-${PKG_VERSION}.tar.bz2"
PKG_SOURCE_DIR="${PKG_NAME}-${PKG_VERSION}"
PKG_DEPENDS_TARGET="toolchain glibc libdvdcss"
PKG_LONGDESC="libdvdread is a library which provides a simple foundation for reading DVDs."
PKG_TOOLCHAIN="autotools"

PKG_CONFIGURE_OPTS_TARGET="--prefix=/usr"
