# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="libmatroska"
PKG_VERSION="1.4.9"
PKG_SHA256="38a61dd5d87c070928b5deb3922b63b2b83c09e2e4a10f9393eecb6afa9795c8"
PKG_LICENSE="LGPL"
PKG_SITE="http://www.matroska.org"
PKG_URL="https://dl.matroska.org/downloads/libmatroska/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="toolchain libebml"
PKG_LONGDESC="Matroska is aiming to become the standard of Multimedia Container Formats one day. It is based on EBML (Extensible Binary Meta Language), a kind of binary version of XML. This way the significant advantages in terms of future format extensibility are gained without breaking file support in old parsers."
PKG_TOOLCHAIN="cmake"

PKG_CMAKE_OPTS_TARGET="-DCMAKE_INSTALL_PREFIX=/usr \
                       -DCMAKE_CXX_IMPLICIT_INCLUDE_DIRECTORIES=$SYSROOT_PREFIX/usr/include \
                       -DBUILD_SHARED_LIBS=1"