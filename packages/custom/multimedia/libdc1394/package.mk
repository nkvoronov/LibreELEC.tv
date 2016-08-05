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
#  the Free Software Foundation, 51 Franklin Street, Suite 500, Boston, MA 02110, USA.
#  http://www.gnu.org/copyleft/gpl.html
################################################################################

PKG_NAME="libdc1394"
PKG_VERSION="2.2.1"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://damien.douxchamps.net/ieee1394/libdc1394"
PKG_URL="$DISTRO_CUSTOM_SRC/$PKG_NAME/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="toolchain libraw1394 libusb libX11 SDL"
PKG_PRIORITY="optional"
PKG_SECTION="multimedia"
PKG_SHORTDESC="high level programming interface for IEEE1394 digital camera - development libdc1394 is a library that is intended to provide a high level programming interface for application developers who wish to control IEEE 1394 based cameras that conform to the 1394-based Digital Camera"
PKG_LONGDESC="high level programming interface for IEEE1394 digital camera - development libdc1394 is a library that is intended to provide a high level programming interface for application developers who wish to control IEEE 1394 based cameras that conform to the 1394-based Digital Camera"

PKG_IS_ADDON="no"
PKG_AUTORECONF="yes"

PKG_CONFIGURE_OPTS_TARGET="--enable-static --disable-shared --with-sdl-prefix=$SYSROOT_PREFIX/usr --disable-examples"

pre_configure_target() {
  mkdir -p $SYSROOT_PREFIX/usr/include/dc1394
    cp -P $ROOT/$BUILD/$PKG_NAME-$PKG_VERSION/dc1394/*.h $SYSROOT_PREFIX/usr/include/dc1394
}
