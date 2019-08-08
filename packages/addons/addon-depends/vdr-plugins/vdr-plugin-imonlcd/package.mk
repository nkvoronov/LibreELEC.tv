# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)

PKG_NAME="vdr-plugin-imonlcd"
PKG_VERSION="c272bcc8c3f3d7cd66603e5d71ad3811f0cdfc5a"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/vdr-projects/vdr-plugin-imonlcd"
PKG_URL="https://github.com/vdr-projects/vdr-plugin-imonlcd.git"
PKG_DEPENDS_TARGET="toolchain vdr freetype"
PKG_NEED_UNPACK="$(get_pkg_directory vdr)"
PKG_LONGDESC="VDR plugin to show information on SoundGraph iMON LCD displays. imonlcd is a plugin for the Linux Video Disc Recorder and allows one to show information about the current state of VDR on a SoundGraph iMON LCD display."
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
