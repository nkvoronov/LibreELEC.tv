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

PKG_NAME="vdr-plugin-xineliboutput"
PKG_VERSION="fa97b86"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://sourceforge.net/projects/xineliboutput/"
PKG_GIT_URL="https://projects.vdr-developer.org/git/xineliboutput.git"
PKG_GIT_BRANCH="master"
PKG_KEEP_CHECKOUT="yes"
PKG_DEPENDS_TARGET="toolchain vdr xine-lib"
PKG_PRIORITY="optional"
PKG_SECTION="custom/multimedia/vdr-plugins"
PKG_SHORTDESC="xine-lib based software output device for VDR."
PKG_LONGDESC="xine-lib based software output device for VDR."
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

VDR_DIR=$(get_build_dir vdr)

export PKG_CONFIG_PATH="${PKG_CONFIG_SYSROOT_DIR}/usr/lib/pkgconfig:${PKG_CONFIG_SYSROOT_DIR}buildd/lib/pkgconfig"

pre_configure_target() {
  export CFLAGS="$CFLAGS -fPIC"
  export CXXFLAGS="$CXXFLAGS -fPIC"
  export LDFLAGS="$LDFLAGS -fPIC"
}

configure_target() {
  cd $ROOT/$BUILD/$PKG_NAME-$PKG_VERSION
  ./configure --enable-x11 \
              --enable-vdr \
              --enable-libxine \
              --disable-dbus-glib-1 \
              --disable-libcec \
              --cc=$CC \
              --cxx=$CXX \
              --add-cflags="$CFLAGS"
}

make_target() {
  make mpg2c \
  CC="$HOST_CC" \
  CFLAGS="$HOST_CFLAGS" \
  LDFLAGS="$HOST_LDFLAGS" \
  VDRDIR=$VDR_DIR \
  LIBDIR="." \
  LOCALEDIR="./locale"

  make -i VDRDIR=$VDR_DIR \
  LIBDIR="." \
  LOCALEDIR="./locale"
}

makeinstall_target() {
  : # installation not needed, done by create-addon script
}