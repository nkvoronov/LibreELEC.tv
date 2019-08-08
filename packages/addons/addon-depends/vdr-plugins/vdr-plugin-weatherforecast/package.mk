# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2009-2019 Stephan Raue (stephan@openelec.tv)

PKG_NAME="vdr-plugin-weatherforecast"
PKG_VERSION="842b086b65a7116a7aa5a2142097a2b2220f4c3c"
PKG_LICENSE="GPL"
PKG_SITE="http://projects.vdr-developer.org/projects/plg-weatherforecast"
PKG_URL="https://github.com/vdr-projects/vdr-plugin-weatherforecast.git"
PKG_DEPENDS_TARGET="toolchain vdr jansson vdr-plugin-skindesigner"
PKG_NEED_UNPACK="$(get_pkg_directory vdr)"
PKG_LONGDESC="WeatherForecast provides a weather forecast (who'd have thought? ;) ) based on forecast.io data."
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
