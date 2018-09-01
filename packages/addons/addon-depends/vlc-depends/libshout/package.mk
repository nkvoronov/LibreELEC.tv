# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="libshout"
PKG_VERSION="2.3.1"
PKG_SHA256="cf3c5f6b4a5e3fcfbe09fb7024aa88ad4099a9945f7cb037ec06bcee7a23926e"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.icecast.org"
PKG_URL="http://download.videolan.org/pub/contrib/shout/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain libvorbis libtheora speex openssl"
PKG_SECTION="audio"
PKG_SHORTDESC="A library for communicating with and sending data to Icecast and Icecast 2 streaming audio servers.  It handles the socket connection, the timing of the data transmission, and prevents bad data from getting to the server."
PKG_LONGDESC="A library for communicating with and sending data to Icecast and Icecast 2 streaming audio servers.  It handles the socket connection, the timing of the data transmission, and prevents bad data from getting to the server."
PKG_TOOLCHAIN="autotools"
PKG_BUILD_FLAGS="+pic"

PKG_CONFIGURE_OPTS_TARGET="--disable-shared --enable-static"
