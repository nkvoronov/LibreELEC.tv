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

PKG_NAME="libmatroska"
PKG_VERSION="1.4.1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.matroska.org"
PKG_URL="https://dl.matroska.org/downloads/libmatroska/$PKG_NAME-$PKG_VERSION.tar.bz2"
PKG_DEPENDS_TARGET="toolchain libebml"
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
    cp -PR $PKG_BUILD/matroska/* $SYSROOT_PREFIX/usr/include/matroska
  mkdir -p $SYSROOT_PREFIX/usr/lib
    cp -P $PKG_BUILD/make/linux/{*.a,*.so*} $SYSROOT_PREFIX/usr/lib
}
