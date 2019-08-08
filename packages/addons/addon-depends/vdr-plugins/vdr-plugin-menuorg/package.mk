# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2009-2019 Stephan Raue (stephan@openelec.tv)

PKG_NAME="vdr-plugin-menuorg"
PKG_VERSION="203218929551ec4c6f1dd45c6d8012c214eaa2c8"
PKG_LICENSE="GPL"
PKG_SITE="https://projects.vdr-developer.org/git/vdr-plugin-menuorg.git"
PKG_URL="https://github.com/vdr-projects/vdr-plugin-menuorg.git"
PKG_DEPENDS_TARGET="toolchain vdr glibmm libxml++"
PKG_NEED_UNPACK="$(get_pkg_directory vdr)"
PKG_LONGDESC="VDR plug-in to reorganize the OSD main menu. This plug-in for the Linux Video Disc Recorder VDR allows the main menu in VDR's On Screen Display to be reorganized. The order of the displayed menu items can be changed and sub menus can be created. Besides this additional "command" menu items can be added, which will execute any system commands."
PKG_TOOLCHAIN="manual"
PKG_BUILD_FLAGS="+pic"

make_target() {
  VDR_DIR=$(get_build_dir vdr)
  export PKG_CONFIG_PATH=$VDR_DIR:$PKG_CONFIG_PATH
  export CPLUS_INCLUDE_PATH=$VDR_DIR/include

  make \
    LIBDIR="." \
    LOCDIR="./locale" \
    all install-i18n
}

post_make_target() {
  VDR_DIR=$(get_build_dir vdr)
  VDR_APIVERSION=`sed -ne '/define APIVERSION/s/^.*"\(.*\)".*$/\1/p' $VDR_DIR/config.h`
  LIB_NAME=lib${PKG_NAME/-plugin/}

  cp --remove-destination $PKG_BUILD/${LIB_NAME}.so $PKG_BUILD/${LIB_NAME}.so.${VDR_APIVERSION}
}
