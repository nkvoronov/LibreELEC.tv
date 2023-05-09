# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="libshout"
PKG_VERSION="2.4.6"
PKG_SHA256="39cbd4f0efdfddc9755d88217e47f8f2d7108fa767f9d58a2ba26a16d8f7c910"
PKG_LICENSE="GPL"
PKG_SITE="http://www.icecast.org"
PKG_URL="https://downloads.xiph.org/releases/${PKG_NAME}/${PKG_NAME}-${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain libvorbis libtheora speex openssl"
PKG_LONGDESC="A library for communicating with and sending data to Icecast and Icecast 2 streaming audio servers.  It handles the socket connection, the timing of the data transmission, and prevents bad data from getting to the server."
PKG_TOOLCHAIN="autotools"