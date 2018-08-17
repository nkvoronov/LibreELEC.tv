################################################################################
#      This file is part of LibreELEC - http://www.libreelec.tv
#      Copyright (C) 2016 Team LibreELEC
#
#  LibreELEC is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 2 of the License, or
#  (at your option) any later version.
#
#  LibreELEC is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with LibreELEC.  If not, see <http://www.gnu.org/licenses/>.
################################################################################

PKG_NAME="libdc1394"
PKG_VERSION="2.2.1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://damien.douxchamps.net/ieee1394/libdc1394"
PKG_URL="http://downloads.sourceforge.net/$PKG_NAME/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain libraw1394 libusb libX11 SDL"
PKG_SECTION="multimedia"
PKG_SHORTDESC="high level programming interface for IEEE1394 digital camera - development libdc1394 is a library that is intended to provide a high level programming interface for application developers who wish to control IEEE 1394 based cameras that conform to the 1394-based Digital Camera"
PKG_LONGDESC="high level programming interface for IEEE1394 digital camera - development libdc1394 is a library that is intended to provide a high level programming interface for application developers who wish to control IEEE 1394 based cameras that conform to the 1394-based Digital Camera"

PKG_IS_ADDON="no"
PKG_AUTORECONF="yes"

PKG_CONFIGURE_OPTS_TARGET="--enable-static --disable-shared --with-sdl-prefix=$SYSROOT_PREFIX/usr --disable-examples"

pre_configure_target() {
  mkdir -p $SYSROOT_PREFIX/usr/include/dc1394
    cp -P $BUILD/$PKG_NAME-$PKG_VERSION/dc1394/*.h $SYSROOT_PREFIX/usr/include/dc1394
}
