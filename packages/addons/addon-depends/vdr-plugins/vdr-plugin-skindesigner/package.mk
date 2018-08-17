################################################################################
#      This file is part of OpenELEC - http://www.openelec.tv
#      Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
#
#  OpenELEC is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 2 of the License, or
#  (at your option) any later version.
#
#  OpenELEC is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with OpenELEC.  If not, see <http://www.gnu.org/licenses/>.
################################################################################

PKG_NAME="vdr-plugin-skindesigner"
PKG_VERSION="5b03953"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://projects.vdr-developer.org/projects/plg-skindesigner"
PKG_URL="https://github.com/vdr-projects/vdr-plugin-skindesigner.git"
PKG_TYPE="git"
PKG_DEPENDS_TARGET="toolchain vdr librsvg libxml2"
PKG_SECTION="multimedia"
PKG_SHORTDESC="A VDR skinning engine that displays XML based Skins"
PKG_LONGDESC="A VDR skinning engine that displays XML based Skins"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

VDR_DIR=$(get_build_dir vdr)

pre_configure_target() {
  export CFLAGS="$CFLAGS -fPIC"
  export CXXFLAGS="$CXXFLAGS -fPIC"
  export LDFLAGS="$LDFLAGS -fPIC"
}

make_target() {
  make subprojects VDRDIR=$VDR_DIR
  make VDRDIR=$VDR_DIR \
  LIBDIR="." \
  LOCDIR="./locale" \
  all install-i18n

  mkdir -p $PKG_BUILD/installs
    cp -PR $PKG_DIR/configs/* $PKG_BUILD/installs

  mkdir -p $SYSROOT_PREFIX/usr/include/libskindesignerapi
    cp -PR $PKG_BUILD/libskindesignerapi/*.h $SYSROOT_PREFIX/usr/include/libskindesignerapi
  mkdir -p $SYSROOT_PREFIX/usr/lib
    rm -f $SYSROOT_PREFIX/usr/lib/libskindesignerapi.*
    cp -PR $PKG_BUILD/libskindesignerapi/libskindesignerapi.so.0.1.2 $SYSROOT_PREFIX/usr/lib
    ln -s libskindesignerapi.so.0.1.2 $SYSROOT_PREFIX/usr/lib/libskindesignerapi.so.0
    ln -s libskindesignerapi.so.0.1.2 $SYSROOT_PREFIX/usr/lib/libskindesignerapi.so
  mkdir -p $SYSROOT_PREFIX/usr/lib/pkgconfig
    cp -PR $PKG_BUILD/libskindesignerapi/libskindesignerapi.pc $SYSROOT_PREFIX/usr/lib/pkgconfig
}

post_make_target() {
  VDR_DIR=$(get_build_dir vdr)
  VDR_APIVERSION=`sed -ne '/define APIVERSION/s/^.*"\(.*\)".*$/\1/p' $VDR_DIR/config.h`
  LIB_NAME=lib${PKG_NAME/-plugin/}

  cp --remove-destination $PKG_BUILD/${LIB_NAME}.so $PKG_BUILD/${LIB_NAME}.so.${VDR_APIVERSION}
  $STRIP libvdr-*.so*
}

makeinstall_target() {
  : # installation not needed, done by create-addon script
}