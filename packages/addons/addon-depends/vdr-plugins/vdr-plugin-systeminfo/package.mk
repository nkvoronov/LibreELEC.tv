# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)

PKG_NAME="vdr-plugin-systeminfo"
PKG_VERSION="0.1.4"
PKG_SHA256="eb3ba522b66afbff83b5d52f4400a6b78fb2f416a079f31c0a63b30b490ccc38"
PKG_LICENSE="GPL"
PKG_SITE="http://firefly.vdr-developer.org/systeminfo"
PKG_URL="http://firefly.vdr-developer.org/systeminfo/vdr-systeminfo-$PKG_VERSION.tar.bz2"
PKG_SOURCE_DIR="systeminfo-$PKG_VERSION"
PKG_DEPENDS_TARGET="toolchain vdr"
PKG_LONGDESC="This VDR-plugin displays system informations. This plugin for VDR displays system informations like CPU type and speed, disk and swap space etc. "
PKG_TOOLCHAIN="manual"
PKG_BUILD_FLAGS="+pic"

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

  cp --remove-destination $PKG_BUILD/${LIB_NAME}.so $PKG_BUILD/${LIB_NAME}.so.${VDR_APIVERSION}
}
