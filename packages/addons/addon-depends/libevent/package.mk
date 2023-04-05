# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2019-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="libevent"
PKG_VERSION="2.1.12"
PKG_SHA256="92e6de1be9ec176428fd2367677e61ceffc2ee1cb119035037a27d346b0403bb"
PKG_LICENSE="BSD"
PKG_SITE="http://libevent.org/"
PKG_URL="https://github.com/libevent/libevent/releases/download/release-${PKG_VERSION}-stable/${PKG_NAME}-${PKG_VERSION}-stable.tar.gz"
PKG_DEPENDS_TARGET="toolchain openssl zlib"
PKG_LONGDESC="The libevent API provides a mechanism to execute a callback function when a specific event occurs on a file descriptor or after a timeout has been reached. It is meant to replace the asynchronous event loop found in event-driven network servers."
PKG_TOOLCHAIN="autotools"

PKG_CONFIGURE_OPTS_TARGET="--disable-shared --enable-static --disable-libevent-regress"

post_makeinstall_target() {
  rm -r ${INSTALL}
}