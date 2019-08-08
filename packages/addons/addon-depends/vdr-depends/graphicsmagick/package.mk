# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2009-2019 Stephan Raue (stephan@openelec.tv)

PKG_NAME="graphicsmagick"
PKG_VERSION="1.3.32"
PKG_SHA256="b842a5a0d6c84fd6c5f161b5cd8e02bbd210b0c0b6728dd762b7c53062ba94e1"
PKG_LICENSE="MIT"
PKG_SITE="http://www.graphicsmagick.org/"
PKG_URL="https://downloads.sourceforge.net/project/$PKG_NAME/$PKG_NAME/$PKG_VERSION/GraphicsMagick-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="Image processing system"

PKG_CONFIGURE_OPTS_TARGET="--disable-docs \
                           --without-perl \
                           --without-dps \
                           --without-fpx \
                           --without-gslib \
                           --without-jbig \
                           --without-jp2 \
                           --without-lcms \
                           --without-tiff \
                           --without-xml \
                           --without-x"
