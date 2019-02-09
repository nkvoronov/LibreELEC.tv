# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)

PKG_NAME="ImageMagick"
PKG_VERSION="6.9.10-12"
PKG_SHA256="bb0224b9a530dc89b792594c5d1f04e568a976b456fd6c738715d2cf80ab8409"
PKG_LICENSE="GPL"
PKG_SITE="http://www.imagemagick.org"
PKG_URL="http://www.imagemagick.org/download/releases/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="ImageMagick is a graphics library for file loading, saving, rendering, manipulation."

pre_build_target() {
  mkdir -p $PKG_BUILD/.$TARGET_NAME
  cp -RP $PKG_BUILD/* $PKG_BUILD/.$TARGET_NAME
}

configure_target() {
  ./configure --host=$TARGET_NAME \
            --build=$HOST_NAME \
            --prefix=/usr \
            --enable-shared \
            --enable-static \
            --without-perl \
            --without-dps \
            --without-fpx \
            --without-gslib \
            --without-jbig \
            --without-jp2 \
            --without-lcms \
            --without-tiff \
            --without-xml \
            --without-x
}

make_target() {
  make
  $MAKEINSTALL
}