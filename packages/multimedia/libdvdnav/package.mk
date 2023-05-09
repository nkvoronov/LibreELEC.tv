# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="libdvdnav"
PKG_VERSION="6.1.1"
PKG_SHA256="c191a7475947d323ff7680cf92c0fb1be8237701885f37656c64d04e98d18d48"
PKG_LICENSE="GPL"
PKG_SITE="https://www.videolan.org/developers/libdvdnav.html"
PKG_URL="https://download.videolan.org/videolan/${PKG_NAME}/${PKG_VERSION}/${PKG_NAME}-${PKG_VERSION}.tar.bz2"
PKG_SOURCE_DIR="${PKG_NAME}-${PKG_VERSION}"
PKG_DEPENDS_TARGET="toolchain libdvdread"
PKG_LONGDESC="The library for xine-dvdnav plugin."
PKG_TOOLCHAIN="autotools"

PKG_CONFIGURE_OPTS_TARGET="--prefix=/usr"
