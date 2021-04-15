# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="libebml"
PKG_VERSION="1.3.6"
PKG_SHA256="57ee73eacca8dc13d3c2c064fb757950450da9185e02e863cac34674681de1a8"
PKG_LICENSE="LGPL"
PKG_SITE="https://github.com/Matroska-Org/libebml"
PKG_URL="https://github.com/Matroska-Org/libebml/archive/release-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="The libebml library allows one to read and write files using EBML (the Extensible Binary Meta Language), a binary pendant to XML. Using libebml makes it easier to extend a file format without breaking support in older parsers."
PKG_TOOLCHAIN="cmake"

PKG_CMAKE_OPTS_TARGET="-DCMAKE_INSTALL_PREFIX=/usr \
                       -DCMAKE_CXX_IMPLICIT_INCLUDE_DIRECTORIES=$SYSROOT_PREFIX/usr/include \
                       -DBUILD_SHARED_LIBS=1"

