################################################################################
#      This file is part of OpenELEC - http://www.openelec.tv
#      Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
#
#  This Program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2, or (at your option)
#  any later version.
#
#  This Program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with OpenELEC.tv; see the file COPYING.  If not, write to
#  the Free Software Foundation, 675 Mass Ave, Cambridge, MA 02139, USA.
#  http://www.gnu.org/copyleft/gpl.html
################################################################################

PKG_NAME="ImageMagick"
PKG_VERSION="6.9.5-5"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.imagemagick.org"
PKG_URL="http://www.imagemagick.org/download/releases/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="graphics"
PKG_SHORTDESC="ImageMagick is a graphics library."
PKG_LONGDESC="ImageMagick is a graphics library for file loading, saving, rendering, manipulation."

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

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