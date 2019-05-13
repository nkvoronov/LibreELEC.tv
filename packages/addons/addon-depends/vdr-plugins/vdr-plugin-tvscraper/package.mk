# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)

PKG_NAME="vdr-plugin-tvscraper"
PKG_VERSION="7183c4b"
PKG_LICENSE="GPL"
PKG_SITE="http://projects.vdr-developer.org/projects/plg-tvscraper"
PKG_URL="https://github.com/vdr-projects/vdr-plugin-tvscraper.git"
PKG_DEPENDS_TARGET="toolchain vdr jansson libxml2"
PKG_LONGDESC="Metadata scraper for VDR. tvscraper is a metadata scraper for the Linux Video Disc Recorder VDR."
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
  $STRIP libvdr-*.so*
}
