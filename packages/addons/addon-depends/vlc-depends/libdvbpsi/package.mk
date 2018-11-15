# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="libdvbpsi"
PKG_VERSION="1.3.2"
PKG_SHA256="f7f1150d0c43083e9d7a5d060b4acf0c3d6c4bac7a9f21b5b344c948f4a9e415"
PKG_LICENSE="GPL"
PKG_SITE="http://www.videolan.org/developers/libdvbpsi.html"
PKG_URL="http://download.videolan.org/pub/libdvbpsi/$PKG_VERSION/libdvbpsi-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="libdvbpsi is a simple library designed for MPEG TS and DVB PSI tables decoding and generating."
PKG_TOOLCHAIN="autotools"
PKG_BUILD_FLAGS="+pic"

PKG_CONFIGURE_OPTS_TARGET="--enable-static --disable-shared"
