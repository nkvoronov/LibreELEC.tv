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

PKG_NAME="mupen64plus"
PKG_VERSION="2.5.0"
PKG_REV="4"
PKG_ARCH="any"
PKG_LICENSE="LGPL"
PKG_SITE="http://mupen64plus.googlecode.com"
PKG_URL="$DISTRO_CUSTOM_SRC/$PKG_NAME/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="toolchain SDL2 libpng glib freetype"
PKG_SECTION="multimedia"
PKG_SHORTDESC="Nintendo 64 emulator"
PKG_LONGDESC="Nintendo 64 emulator"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"


pre_configure_target() {
  export CFLAGS="$CFLAGS -I$SYSROOT_PREFIX/usr/include/SDL2"
}

make_target() {
  cd $ROOT/$PKG_BUILD
  ./m64p_build.sh V=1 LIRC=1
}

makeinstall_target() {
  : # nothing to do here
}

post_install() {

  mkdir -p $INSTALL/usr/bin
    cp -P $PKG_DIR/scripts/* $INSTALL/usr/bin
    cp -P $PKG_BUILD/test/mupen64plus $INSTALL/usr/bin

  mkdir -p $INSTALL/usr/lib
    cp -P $PKG_BUILD/test/libmupen64plus.so.* $INSTALL/usr/lib
    cp -P $PKG_BUILD/test/mupen64plus-*.so $INSTALL/usr/lib

  mkdir -p $INSTALL/usr/config/mupen64plus
    cp -P $PKG_DIR/config/* $INSTALL/usr/config/mupen64plus
    cp -PR $PKG_BUILD/test/*.ini $INSTALL/usr/config/mupen64plus
    cp -P $PKG_BUILD/test/mupencheat.txt $INSTALL/usr/config/mupen64plus
    cp -P $PKG_BUILD/test/font.ttf $INSTALL/usr/config/mupen64plus
    cp -P $PKG_BUILD/test/m64p_test_rom.v64 $INSTALL/usr/config/mupen64plus

}
