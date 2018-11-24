# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)

PKG_NAME="vdr-plugin-restfulapi"
PKG_VERSION="96a03b3"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/yavdr/vdr-plugin-restfulapi.git"
PKG_URL="https://github.com/yavdr/vdr-plugin-restfulapi.git"
PKG_DEPENDS_TARGET="toolchain vdr cxxtools vdr-plugin-wirbelscan ImageMagick"
PKG_SECTION="multimedia"
PKG_SHORTDESC="vdr-plugin-restfulapi: the restful API for the VDR/"
PKG_LONGDESC="vdr-plugin-restfulapi allows to access many internals of the VDR via a restful API"
PKG_TOOLCHAIN="manual"

pre_make_target() {
  # dont build parallel
  MAKEFLAGS=-j1
}

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
