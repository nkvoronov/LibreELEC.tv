# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2017-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="vdr-plugin-filebrowser"
PKG_VERSION="0.2.1"
PKG_SHA256="39ece2688ba81e41f5af1e832c134e258916ec7fa488a084185f2a072099aad4"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/herrwiese/gentoo-portage/tree/master/media-plugins/vdr-filebrowser"
PKG_URL="http://opensource.holgerbrunn.net/vdr/filebrowser/vdr-filebrowser-$PKG_VERSION.tgz"
PKG_SOURCE_DIR="filebrowser-$PKG_VERSION"
PKG_DEPENDS_TARGET="toolchain vdr"
PKG_NEED_UNPACK="$(get_pkg_directory vdr)"
PKG_LONGDESC="VDR plugin for file browsing and executing shell commands. With this plugin it's possible to browse the file system in VDR's OSD. It's possible to define commands, that can be executed with the currently selected files. The commands will be executed asynchronously in background."
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
