# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2019-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="libwebsockets"
PKG_VERSION="4.3.0"
PKG_SHA256="ceef46e3bffb368efe4959202f128fd93d74e10cd2e6c3ac289a33b075645c3b"
PKG_LICENSE="MIT"
PKG_SITE="https://libwebsockets.org"
PKG_URL="https://github.com/warmcat/libwebsockets/archive/v${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain openssl json-c libuv"
PKG_LONGDESC="Library for implementing network protocols with a tiny footprint."

PKG_CMAKE_OPTS_TARGET="-DLWS_WITH_LIBUV=ON \
                       -DLWS_WITHOUT_TESTAPPS=ON"
