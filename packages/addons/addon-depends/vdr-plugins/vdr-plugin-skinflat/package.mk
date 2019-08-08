# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2009-2019 Stephan Raue (stephan@openelec.tv)

PKG_NAME="vdr-plugin-skinflat"
PKG_VERSION="1040bb702e44285cfd9db7b69b96053f9e03f443"
PKG_LICENSE="GPL"
PKG_SITE="http://projects.vdr-developer.org/projects/plg-skinflat"
PKG_URL="https://github.com/vdr-projects/vdr-plugin-skinflat.git"
PKG_DEPENDS_TARGET="toolchain vdr graphicsmagick"
PKG_NEED_UNPACK="$(get_pkg_directory vdr)"
PKG_LONGDESC="A VDR plugin, "the" flat skin for VDR. A simple skin for vdr without any configuration."
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
