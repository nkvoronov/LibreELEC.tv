# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)

PKG_NAME="ImageMagick"
PKG_VERSION="6.9.9-47"
PKG_SHA256="8ea6f3fccf07ba96ceadec845042828315285dbe5625701065d1e7403bf7aea7"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.imagemagick.org"
PKG_URL="http://www.imagemagick.org/download/releases/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="graphics"
PKG_SHORTDESC="ImageMagick is a graphics library."
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
