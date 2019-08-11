# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2019-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="libarchive"
PKG_VERSION="3.3.3"
PKG_SHA256="720da414e7aebb255fcdaee106894e4d30e2472ac1390c2c15b70c84c7479658"
PKG_LICENSE="GPL"
PKG_SITE="http://libarchive.org/"
PKG_URL="https://github.com/$PKG_NAME/$PKG_NAME/archive/v$PKG_VERSION.tar.gz"
PKG_DEPENDS_HOST="toolchain"
PKG_DEPENDS_TARGET="toolchain"
PKG_SHORTDESC="A multi-format archive and compression library."
PKG_TOOLCHAIN="autotools"

PKG_CONFIGURE_OPTS_TARGET="--prefix=/usr --without-xml2 --without-nettle --disable-static"
