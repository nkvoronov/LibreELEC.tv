# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="libshout"
PKG_VERSION="2.3.1"
#PKG_SHA256="9ba8b04bdb13f7860a2041768ac83b47b397a36549c71c530b94028a3cfd5b51"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.icecast.org"
PKG_URL="http://download.videolan.org/pub/contrib/shout/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain libvorbis libtheora speex"
PKG_SECTION="audio"
PKG_SHORTDESC="A library for communicating with and sending data to Icecast and Icecast 2 streaming audio servers.  It handles the socket connection, the timing of the data transmission, and prevents bad data from getting to the server."
PKG_LONGDESC="A library for communicating with and sending data to Icecast and Icecast 2 streaming audio servers.  It handles the socket connection, the timing of the data transmission, and prevents bad data from getting to the server."
PKG_TOOLCHAIN="autotools"

PKG_CONFIGURE_OPTS_TARGET="--disable-shared --enable-static"
