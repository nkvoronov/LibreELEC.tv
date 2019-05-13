# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="libprojectm2"
PKG_VERSION="2.0.0"
PKG_SHA256="c4c744fe225ab995df60921c2c74696290f6b76b33fbc5f13db70b4f9a379095"
PKG_LICENSE="GPL"
PKG_SITE="http://projectm.sourceforge.net/"
PKG_URL="https://downloads.sourceforge.net/project/projectm/libprojectM/libprojectM-$PKG_VERSION/libprojectM-$PKG_VERSION-Source.tar.gz"
PKG_DEPENDS_TARGET="toolchain ftgl freetype glew $OPENGL"
PKG_LONGDESC="A MilkDrop compatible opensource music visualizer."

PKG_CMAKE_OPTS_TARGET="-DBUILD_PROJECTM_STATIC=1"
