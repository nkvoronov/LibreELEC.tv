################################################################################
#      This file is part of LibreELEC - https://libreelec.tv
#      Copyright (C) 2016-present Team LibreELEC
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

PKG_NAME="libgdiplus"
PKG_VERSION="5.6"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/mono/libgdiplus"
PKG_URL="https://github.com/mono/libgdiplus/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain giflib libjpeg-turbo tiff libXext libexif glib cairo"
PKG_LONGDESC="An Open Source implementation of the GDI+ API"
PKG_AUTORECONF="yes"

PKG_CONFIGURE_OPTS_TARGET="--enable-shared               \
                           --with-libgif=$TARGET_PREFIX  \
                           --with-libjpeg=$TARGET_PREFIX \
                           --with-libtiff=$TARGET_PREFIX"

makeinstall_target() {
  make install DESTDIR=$INSTALL
}