# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="crazycat"
PKG_VERSION="f77791e13e0a29edeb775383f89e37bb1ed80416"
PKG_SHA256="524a5cdbbb653b0db46d20b56249953e473302bd20e8097bf06e3918e5c0a35f"
PKG_LICENSE="GPL"
PKG_SITE="https://bitbucket.org/CrazyCat/media_build"
PKG_URL="https://bitbucket.org/CrazyCat/media_build/get/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux media_tree_cc"
PKG_NEED_UNPACK="$LINUX_DEPENDS media_tree_cc"
PKG_SECTION="driver.dvb"
PKG_LONGDESC="DVB driver for TBS cards with CrazyCats additions"

PKG_IS_ADDON="embedded"
PKG_IS_KERNEL_PKG="yes"
PKG_ADDON_IS_STANDALONE="yes"
PKG_ADDON_NAME="DVB drivers for TBS"
PKG_ADDON_TYPE="xbmc.service"
PKG_ADDON_VERSION="${ADDON_VERSION}.${PKG_REV}"

pre_make_target() {
  export KERNEL_VER=$(get_module_dir)
  export LDFLAGS=""
}

make_target() {
  cp -RP $(get_build_dir media_tree_cc)/* $PKG_BUILD/linux

  # make config all
  kernel_make VER=$KERNEL_VER SRCDIR=$(kernel_path) allyesconfig

  # hack to workaround media_build bug
  if [ "$PROJECT" = Rockchip ]; then
    sed -e 's/CONFIG_DVB_CXD2820R=m/# CONFIG_DVB_CXD2820R is not set/g' -i v4l/.config
    sed -e 's/CONFIG_DVB_LGDT3306A=m/# CONFIG_DVB_LGDT3306A is not set/g' -i v4l/.config
  fi

  # add menuconfig to edit .config
  kernel_make VER=$KERNEL_VER SRCDIR=$(kernel_path)
}

makeinstall_target() {
  install_driver_addon_files "$PKG_BUILD/v4l/"
}
