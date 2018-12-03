# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="vdr-plugin-xmltv2vdr"
PKG_VERSION="ec7bd92"
PKG_LICENSE="GPL"
PKG_SITE="http://projects.vdr-developer.org/projects/plg-xmltv2vdr"
PKG_URL="https://github.com/vdr-projects/vdr-plugin-xmltv2vdr.git"
PKG_DEPENDS_TARGET="toolchain vdr sqlite curl libzip libxml2 libxslt enca pcre"
PKG_LONGDESC="xmltv2vdr imports data in xmltv format"
PKG_TOOLCHAIN="manual"
PKG_BUILD_FLAGS="+pic"

pre_configure_target() {
  export CXXFLAGS="$CXXFLAGS -Wno-narrowing"
  export LIBS="-L$SYSROOT_PREFIX/usr/lib/iconv -lpcre -lpcrecpp"
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
  cd dist/epgdata2xmltv
  make -j1
  cd -
  $STRIP dist/epgdata2xmltv/epgdata2xmltv

  VDR_DIR=$(get_build_dir vdr)
  VDR_APIVERSION=`sed -ne '/define APIVERSION/s/^.*"\(.*\)".*$/\1/p' $VDR_DIR/config.h`
  LIB_NAME=lib${PKG_NAME/-plugin/}

  cp --remove-destination $PKG_BUILD/${LIB_NAME}.so $PKG_BUILD/${LIB_NAME}.so.${VDR_APIVERSION}
}
