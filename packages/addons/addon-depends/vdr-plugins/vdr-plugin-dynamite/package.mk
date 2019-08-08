# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2009-2019 Stephan Raue (stephan@openelec.tv)

PKG_NAME="vdr-plugin-dynamite"
PKG_VERSION="d8aea410bd375c61338ace5891d19331bf6ab55c"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/flensrocker/vdr-plugin-dynamite"
PKG_URL="https://github.com/flensrocker/vdr-plugin-dynamite.git"
PKG_DEPENDS_TARGET="toolchain vdr"
PKG_NEED_UNPACK="$(get_pkg_directory vdr)"
PKG_LONGDESC="A VDR plugin add hotplug functionality to the vdr. The goal of this plugin is to add hotplug functionality to the vdr. This is achieved by wrapping a helper device around cDvbDevice which checks if the hardware is available."
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
