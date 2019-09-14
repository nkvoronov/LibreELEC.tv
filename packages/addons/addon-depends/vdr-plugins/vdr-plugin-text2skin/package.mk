# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2017-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="vdr-plugin-text2skin"
PKG_VERSION="8f7954da2488ced734c30e7c2704b92a44e6e1ad"
PKG_LICENSE="GPL"
PKG_SITE="http://projects.vdr-developer.org/projects/plg-text2skin"
PKG_URL="https://github.com/vdr-projects/vdr-plugin-text2skin.git"
PKG_DEPENDS_TARGET="toolchain vdr graphicsmagick"
PKG_NEED_UNPACK="$(get_pkg_directory vdr)"
PKG_LONGDESC="Plugin to vdr that loads and views skins. This plugin is designed to load and interpret a set of files describing the layout of the On Screen Display and to make this "Skin" available to VDR via Setup -> OSD in the main menu. Of course it is possible to load more than one text-based skin this way and to choose between them while running VDR. All skins may be themeable (you can create your own color-theme) and translateable as the author of the skin wishes."
PKG_TOOLCHAIN="manual"
PKG_BUILD_FLAGS="+pic"

IMAGELIB=graphicsmagick

make_target() {
  VDR_DIR=$(get_build_dir vdr)
  export PKG_CONFIG_PATH=$VDR_DIR:$PKG_CONFIG_PATH
  export CPLUS_INCLUDE_PATH=$VDR_DIR/include

  make VDRDIR=$VDR_DIR \
  LIBDIR="." \
  LOCDIR="./locale" \
  IMAGELIB=$IMAGELIB \
  all
}

post_make_target() {
  VDR_DIR=$(get_build_dir vdr)
  VDR_APIVERSION=`sed -ne '/define APIVERSION/s/^.*"\(.*\)".*$/\1/p' $VDR_DIR/config.h`
  LIB_NAME=lib${PKG_NAME/-plugin/}

  cp --remove-destination $PKG_BUILD/${LIB_NAME}.so $PKG_BUILD/${LIB_NAME}.so.${VDR_APIVERSION}
}
