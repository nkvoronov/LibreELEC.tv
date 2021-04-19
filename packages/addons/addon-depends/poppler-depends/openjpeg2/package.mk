# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2019-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="openjpeg2"
PKG_VERSION="2.3.1"
PKG_SHA256="63f5a4713ecafc86de51bfad89cc07bb788e9bba24ebbf0c4ca637621aadb6a9"
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
