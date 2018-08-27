# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="libdvbpsi"
PKG_VERSION="1.3.2"
#PKG_SHA256="9ba8b04bdb13f7860a2041768ac83b47b397a36549c71c530b94028a3cfd5b51"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.videolan.org/developers/libdvbpsi.html"
PKG_URL="http://download.videolan.org/pub/libdvbpsi/$PKG_VERSION/libdvbpsi-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="multimedia"
PKG_SHORTDESC="library for MPEG TS and DVB PSI tables decoding and generating"
PKG_LONGDESC="libdvbpsi is a simple library designed for MPEG TS and DVB PSI tables decoding and generating."
PKG_TOOLCHAIN="autotools"

PKG_CONFIGURE_OPTS_TARGET="--enable-static --disable-shared"
