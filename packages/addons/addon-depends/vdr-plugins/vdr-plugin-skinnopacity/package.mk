# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)

PKG_NAME="vdr-plugin-skinnopacity"
PKG_VERSION="f593ad5"
PKG_LICENSE="GPL"
PKG_SITE="http://projects.vdr-developer.org/projects/skin-nopacity"
PKG_URL="https://github.com/vdr-projects/vdr-plugin-skinnopacity.git"
PKG_DEPENDS_TARGET="toolchain vdr ImageMagick"
PKG_LONGDESC="nOpacity skin for VDR. nOpacity is a highly customizable true color skin for the on-screen-display (OSD) of the Linux Video Disc Recorder VDR."
PKG_TOOLCHAIN="manual"
PKG_BUILD_FLAGS="+pic"

IMAGELIB=imagemagick

make_target() {
  VDR_DIR=$(get_build_dir vdr)
  export PKG_CONFIG_PATH=$VDR_DIR:$PKG_CONFIG_PATH
  export CPLUS_INCLUDE_PATH=$VDR_DIR/include

  make VDRDIR=$VDR_DIR \
  LIBDIR="." \
  LOCDIR="./locale" \
  IMAGELIB=$IMAGELIB \
  all install-i18n
}

post_make_target() {
  VDR_DIR=$(get_build_dir vdr)
  VDR_APIVERSION=`sed -ne '/define APIVERSION/s/^.*"\(.*\)".*$/\1/p' $VDR_DIR/config.h`
  LIB_NAME=lib${PKG_NAME/-plugin/}

  cp --remove-destination $PKG_BUILD/${LIB_NAME}.so $PKG_BUILD/${LIB_NAME}.so.${VDR_APIVERSION}
}
