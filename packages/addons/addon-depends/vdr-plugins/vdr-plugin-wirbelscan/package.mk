# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)

PKG_NAME="vdr-plugin-wirbelscan"
PKG_VERSION="2017.06.04"
PKG_SHA256="c7a792c794fb98dd7f665e1be2271f4a1a957a26c017043fcd4dd8d8b7fd582b"
PKG_LICENSE="GPL"
PKG_SITE="http://wirbel.htpc-forum.de/wirbelscan/index2.html"
PKG_URL="http://wirbel.htpc-forum.de/wirbelscan/${PKG_NAME/-plugin/}-dev-$PKG_VERSION.tgz"
#PKG_SOURCE_DIR="wirbelscan-${PKG_VERSION}"
PKG_DEPENDS_TARGET="toolchain vdr"
PKG_LONGDESC="Channelscan plugin for VDR. This plugin allows you to scan for new channels. DVB-T and DVB-C are supported as well as DVB-S and pvrinput/ptv (analog) scan."
PKG_TOOLCHAIN="manual"
PKG_BUILD_FLAGS="+pic"

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
