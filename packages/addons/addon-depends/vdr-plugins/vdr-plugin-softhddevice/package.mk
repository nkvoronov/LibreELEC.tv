# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)

PKG_NAME="vdr-plugin-softhddevice"
PKG_VERSION="b044877"
PKG_LICENSE="GPL"
PKG_SITE="http://projects.vdr-developer.org/projects/plg-softhddevice"
PKG_URL="https://github.com/ua0lnj/vdr-plugin-softhddevice.git"
PKG_GIT_CLONE_BRANCH="vdpau+vaapi"
PKG_DEPENDS_TARGET="toolchain vdr ffmpeg34 libva-glx libxcb xcb-proto xcb-util xcb-util-keysyms xcb-util-wm xcb-util-renderutil xcb-util-image"
PKG_LONGDESC="Plugin for VDR. A software and GPU emulated HD device. This plugin for the Linux Video Disc Recorder VDR. A software and GPU emulated HD device"
PKG_TOOLCHAIN="manual"
PKG_BUILD_FLAGS="+pic"

pre_configure_target() {
  PKG_CONFIG_PATH="$(get_build_dir ffmpeg34)/.INSTALL_PKG/usr/local/lib/pkgconfig"
  CFLAGS="$CFLAGS -I$(get_build_dir ffmpeg34)/.INSTALL_PKG/usr/local/include"
  LDFLAGS="$LDFLAGS -L$(get_build_dir ffmpeg34)/.INSTALL_PKG/usr/local/lib"
}

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
