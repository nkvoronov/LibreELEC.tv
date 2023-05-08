# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="libmatroska"
PKG_VERSION="f5315fddda2d434e47035c038549a808d8b8eac7"
PKG_GIT_CLONE_BRANCH="v1.x"
PKG_VERSION_NUMBER="1.7.1"
PKG_LICENSE="LGPL"
PKG_SITE="https://github.com/Matroska-Org/libmatroska"
PKG_URL="https://github.com/Matroska-Org/libmatroska.git"
PKG_DEPENDS_TARGET="toolchain libebml"
PKG_LONGDESC="Matroska is aiming to become the standard of Multimedia Container Formats one day. It is based on EBML (Extensible Binary Meta Language), a kind of binary version of XML. This way the significant advantages in terms of future format extensibility are gained without breaking file support in old parsers."
PKG_TOOLCHAIN="cmake"

PKG_CMAKE_OPTS_TARGET="-DCMAKE_INSTALL_PREFIX=/usr \
                       -DCMAKE_CXX_IMPLICIT_INCLUDE_DIRECTORIES=${SYSROOT_PREFIX}/usr/include \
                       -DBUILD_SHARED_LIBS=1"