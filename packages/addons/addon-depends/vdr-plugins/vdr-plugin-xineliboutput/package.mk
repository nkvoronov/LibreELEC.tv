# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)

PKG_NAME="vdr-plugin-xineliboutput"
PKG_VERSION="97b7e78"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://sourceforge.net/projects/xineliboutput/"
PKG_URL="https://github.com/vdr-projects/vdr-plugin-xineliboutput.git"
PKG_DEPENDS_TARGET="toolchain vdr xine-lib"
PKG_SECTION="multimedia"
PKG_SHORTDESC="xine-lib based software output device for VDR."
PKG_LONGDESC="xine-lib based software output device for VDR."
PKG_TOOLCHAIN="manual"
PKG_BUILD_FLAGS="+pic"

configure_target() {
  cd $BUILD/$PKG_NAME-$PKG_VERSION
  ./configure --enable-x11 \
              --enable-vdr \
              --enable-libxine \
              --disable-dbus-glib-1 \
              --enable-libcec \
              --cc=$CC \
              --cxx=$CXX \
              --add-cflags="$CFLAGS"
}

make_target() {
  VDR_DIR=$(get_build_dir vdr)
  export PKG_CONFIG_PATH=$VDR_DIR:$PKG_CONFIG_PATH
  export CPLUS_INCLUDE_PATH=$VDR_DIR/include

  make VDRDIR=$VDR_DIR \
    LIBDIR="." \
    LOCDIR="./locale" \
    all install-i18n
}

post_make_target() {
  VDR_DIR=$(get_build_dir vdr)
  VDR_APIVERSION=`sed -ne '/define APIVERSION/s/^.*"\(.*\)".*$/\1/p' $VDR_DIR/config.h`
  LIB_NAME=lib${PKG_NAME/-plugin/}
  #cp --remove-destination $PKG_BUILD/${LIB_NAME}.so $PKG_BUILD/${LIB_NAME}.so.${VDR_APIVERSION}
}
