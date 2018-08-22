# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)

PKG_NAME="vdr-plugin-femon"
PKG_VERSION="2.4.0"
PKG_SHA256="f72acbf81422c8e03933ccf76c6e900a5ce5d1c5eda3ecd747462349750f2ac3"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.saunalahti.fi/~rahrenbe/vdr/femon/"
PKG_URL="http://www.saunalahti.fi/~rahrenbe/vdr/femon/files/vdr-femon-$PKG_VERSION.tgz"
PKG_SOURCE_DIR="femon-$PKG_VERSION"
PKG_DEPENDS_TARGET="toolchain vdr"
PKG_SECTION="multimedia"
PKG_SHORTDESC="DVB frontend status monitor plugin for VDR."
PKG_LONGDESC="DVB frontend status monitor plugin for VDR. DVB Frontend Status Monitor (femon) is a VDR plugin that displays signal quality parameters of the tuned channel on the OSD."
PKG_TOOLCHAIN="manual"
PKG_BUILD_FLAGS="+pic"

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
