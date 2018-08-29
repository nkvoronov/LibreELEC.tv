# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="libebml"
PKG_VERSION="1.3.5"
PKG_SHA256="d818413f60742c2f036ba6f582c5e0320d12bffec1b0fc0fc17a398b6f04aa00"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://dl.matroska.org/downloads/libebml"
PKG_URL="http://dl.matroska.org/downloads/libebml/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="devel"
PKG_SHORTDESC="The libebml library allows one to read and write files using EBML (the Extensible Binary Meta Language), a binary pendant to XML. Using libebml makes it easier to extend a file format without breaking support in older parsers."
PKG_LONGDESC="The libebml library allows one to read and write files using EBML (the Extensible Binary Meta Language), a binary pendant to XML. Using libebml makes it easier to extend a file format without breaking support in older parsers."
PKG_TOOLCHAIN="autotools"

PKG_CONFIGURE_OPTS_TARGET="--prefix=/usr"

