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

PKG_NAME="xine-lib"
PKG_VERSION="e6a81be"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.xine-project.org/"
PKG_GIT_URL="git://projects.vdr-developer.org/xine-lib.git"
PKG_GIT_BRANCH="master"
PKG_KEEP_CHECKOUT="no"
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
             --disable-musepack \
             --disable-vpx
}

make_target() {
  make
  $MAKEINSTALL
}