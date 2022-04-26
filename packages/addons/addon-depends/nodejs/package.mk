# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2021-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="nodejs"
PKG_VERSION="18.0.0"
PKG_SHA256="00c50016496baa72dae1e6f6d6a77e1d4fff30f21060285bf64836a9fc2ea2ba"
PKG_LICENSE="MIT"
PKG_SITE="https://nodejs.org"
PKG_URL="https://github.com/nodejs/node/archive/v${PKG_VERSION}/nodejs-${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain Python3"
PKG_LONGDESC="Evented I/O for V8 javascript"
PKG_TOOLCHAIN="manual"

#PKG_CONFIGURE_OPTS_TARGET="--enable-static --disable-shared"

