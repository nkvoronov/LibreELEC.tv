# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="vdr-plugin-wirbelscancontrol"
PKG_VERSION="0.0.2"
PKG_SHA256="178c5768dd47355a42409a2cb2629f0762da1297865e3a84963684649145cb13"
PKG_LICENSE="GPL"
PKG_SITE="http://wirbel.htpc-forum.de/wirbelscancontrol/index2.html"
PKG_URL="http://wirbel.htpc-forum.de/wirbelscancontrol/${PKG_NAME/-plugin/}-$PKG_VERSION.tgz"
PKG_SOURCE_DIR="wirbelscancontrol-${PKG_VERSION}"
PKG_DEPENDS_TARGET="toolchain vdr vdr-plugin-wirbelscan"
PKG_LONGDESC="Adds menu entry for wirbelscan at VDR."
PKG_TOOLCHAIN="manual"
PKG_BUILD_FLAGS="+pic"

pre_build_target() {
  WIRBELSCAN_DIR=$(get_build_dir vdr-plugin-wirbelscan)
  ln -sf $WIRBELSCAN_DIR/wirbelscan_services.h $PKG_BUILD
}

make_target() {
  VDR_DIR=$(get_build_dir vdr)
  export PKG_CONFIG_PATH=$VDR_DIR:$PKG_CONFIG_PATH
  export CPLUS_INCLUDE_PATH=$VDR_DIR/include

  make VDRDIR=$VDR_DIR \
    LIBDIR="." \
    LOCDIR="./locale" \
    all
}

post_make_target() {
  VDR_DIR=$(get_build_dir vdr)
  VDR_APIVERSION=`sed -ne '/define APIVERSION/s/^.*"\(.*\)".*$/\1/p' $VDR_DIR/config.h`
  LIB_NAME=lib${PKG_NAME/-plugin/}

  cp --remove-destination $PKG_BUILD/${LIB_NAME}.so $PKG_BUILD/${LIB_NAME}.so.${VDR_APIVERSION}
}
