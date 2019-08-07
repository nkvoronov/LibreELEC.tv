# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)

PKG_NAME="ImageMagick"
PKG_VERSION="6.9.10-33"
#PKG_VERSION="6.9.10-12"
#PKG_SHA256="bb0224b9a530dc89b792594c5d1f04e568a976b456fd6c738715d2cf80ab8409"
PKG_LICENSE="GPL"
PKG_SITE="http://www.imagemagick.org"
PKG_URL="http://www.imagemagick.org/download/releases/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="Software suite to create, edit, compose, or convert bitmap images"

PKG_CONFIGURE_OPTS_TARGET="--enable-shared \
                           --enable-static \
                           --disable-docs \
                           --without-perl \
                           --without-dps \
                           --without-fpx \
                           --without-gslib \
                           --without-jbig \
                           --without-jp2 \
                           --without-lcms \
                           --without-tiff \
                           --without-xml \
                           --without-x \
                           --without-utilities"

makeinstall_target() {
  make install DESTDIR=$INSTALL $PKG_MAKEINSTALL_OPTS_TARGET
}
