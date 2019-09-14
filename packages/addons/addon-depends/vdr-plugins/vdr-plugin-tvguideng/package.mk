# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2017-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="vdr-plugin-tvguideng"
PKG_VERSION="65248babe1380b5b9e214ffb30ccf7f3d4c02096"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/vdr-projects/vdr-plugin-tvguideng"
PKG_URL="https://github.com/vdr-projects/vdr-plugin-tvguideng.git"
PKG_DEPENDS_TARGET="toolchain vdr vdr-plugin-skindesigner"
PKG_NEED_UNPACK="$(get_pkg_directory vdr)"
PKG_LONGDESC="TvGuideNG is a highly customizable 2D EPG viewer plugin for Skindesigner Skins."
PKG_TOOLCHAIN="manual"

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
