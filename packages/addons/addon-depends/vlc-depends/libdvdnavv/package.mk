# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="libdvdnavv"
PKG_VERSION="6.0.0"
PKG_SHA256="f0a2711b08a021759792f8eb14bb82ff8a3c929bf88c33b64ffcddaa27935618"
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

