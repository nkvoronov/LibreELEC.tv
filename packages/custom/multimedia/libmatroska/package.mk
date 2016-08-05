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

PKG_NAME="libmatroska"
PKG_VERSION="1.4.1"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.matroska.org"
PKG_URL="https://dl.matroska.org/downloads/libmatroska/$PKG_NAME-$PKG_VERSION.tar.bz2"
PKG_DEPENDS_TARGET="toolchain libebml"
PKG_PRIORITY="optional"
PKG_SECTION="multimedia"
PKG_SHORTDESC="Matroska is aiming to become the standard of Multimedia Container Formats one day. It is based on EBML (Extensible Binary Meta Language), a kind of binary version of XML. This way the significant advantages in terms of future format extensibility are gained without breaking file support in old parsers."
PKG_LONGDESC="Matroska is aiming to become the standard of Multimedia Container Formats one day. It is based on EBML (Extensible Binary Meta Language), a kind of binary version of XML. This way the significant advantages in terms of future format extensibility are gained without breaking file support in old parsers."

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

make_target() {
  make -C make/linux
}

makeinstall_target() {
  make install -C make/linux prefix=$ROOT/$PKG_BUILD/.install_pkg/usr
}

post_makeinstall_target() {
  mkdir -p $SYSROOT_PREFIX/usr/include/matroska
    cp -PR $ROOT/$PKG_BUILD/matroska/* $SYSROOT_PREFIX/usr/include/matroska
  mkdir -p $SYSROOT_PREFIX/usr/lib
    cp -P $ROOT/$PKG_BUILD/make/linux/{*.a,*.so*} $SYSROOT_PREFIX/usr/lib
}
