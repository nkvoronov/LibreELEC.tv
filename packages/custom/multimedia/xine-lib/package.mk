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

PKG_NAME="xine-lib"
PKG_VERSION="1.2.8"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.xine-project.org/"
PKG_URL="https://xine-lib.alioth.debian.org/releases/xine-lib-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="toolchain ffmpeg"
PKG_SECTION="multimedia"
PKG_SHORTDESC="xine is a high-performance, portable and reusable multimedia playback engine."
PKG_LONGDESC="xine is a high-performance, portable and reusable multimedia playback engine."

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

pre_build_target() {
  mkdir -p $PKG_BUILD/.$TARGET_NAME
  cp -RP $PKG_BUILD/* $PKG_BUILD/.$TARGET_NAME
}

pre_configure_target() {
  strip_lto
}

configure_target() {
  ./autogen.sh --host=$TARGET_NAME \
             --build=$HOST_NAME \
             --prefix=/usr \
             --with-external-ffmpeg \
             --disable-dxr3 \
             --disable-aalib \
             --disable-vcd \
             --disable-musepack
}

make_target() {
  make
  $MAKEINSTALL
}