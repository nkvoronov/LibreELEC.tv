# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)

PKG_NAME="vdr-plugin-skindesigner"
PKG_VERSION="5b03953"
PKG_LICENSE="GPL"
PKG_SITE="http://projects.vdr-developer.org/projects/plg-skindesigner"
PKG_URL="https://github.com/vdr-projects/vdr-plugin-skindesigner.git"
PKG_DEPENDS_TARGET="toolchain vdr librsvg libxml2"
PKG_LONGDESC="A VDR skinning engine that displays XML based Skins"
PKG_TOOLCHAIN="manual"
PKG_BUILD_FLAGS="+pic"

VDR_DIR=$(get_build_dir vdr)

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
}
