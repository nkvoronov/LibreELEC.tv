# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="openjpeg2"
PKG_VERSION="2.3.0"
PKG_SHA256="3dc787c1bb6023ba846c2a0d9b1f6e179f1cd255172bde9eb75b01f1e6c7d71a"
PKG_REV="1"
PKG_LICENSE="BSD"
PKG_SITE="https://github.com/uclouvain/openjpeg"
PKG_URL="https://github.com/uclouvain/openjpeg/archive/v${PKG_VERSION}.tar.gz"
PKG_SOURCE_DIR="openjpeg-$PKG_VERSION"
PKG_DEPENDS_TARGET="toolchain zlib libpng tiff lcms2"
PKG_LONGDESC="An open source JPEG 2000 codec"
PKG_BUILD_FLAGS="+pic"

PKG_CMAKE_OPTS_TARGET="-DCMAKE_BUILD_TYPE=Release \
                       -DBUILD_SHARED_LIBS=ON \
                       -DBUILD_STATIC_LIBS=OFF \
                       -DBUILD_DOC=OFF"
