# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="libdvdnavv"
PKG_VERSION="6.0.0"
#PKG_SHA256="9ba8b04bdb13f7860a2041768ac83b47b397a36549c71c530b94028a3cfd5b51"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://www.videolan.org/developers/libdvdnav.html"
PKG_URL="https://download.videolan.org/videolan/libdvdnav/$PKG_VERSION/libdvdnav-$PKG_VERSION.tar.bz2"
PKG_SOURCE_DIR="libdvdnav-$PKG_VERSION"
PKG_DEPENDS_TARGET="toolchain libdvdreadv"
PKG_SECTION="devel"
PKG_SHORTDESC="The library for xine-dvdnav plugin."
PKG_LONGDESC="The library for xine-dvdnav plugin."
PKG_TOOLCHAIN="autotools"

PKG_CONFIGURE_OPTS_TARGET="--prefix=/usr"

