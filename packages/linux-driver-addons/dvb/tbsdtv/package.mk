# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="tbsdtv"
PKG_VERSION="ec14f7396929046e2dbde34236b9997ab3d0f8f1"
PKG_SHA256="b11d2f95bd2e4e605de0b1adaabe8c24ad0cb827c319cfb522bc5bd66d09139b"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/tbsdtv/media_build.git"
PKG_URL="https://github.com/tbsdtv/media_build/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux media_tree_tbsdtv"
PKG_NEED_UNPACK="$LINUX_DEPENDS media_tree_cc"
PKG_SECTION="driver.dvb"
PKG_LONGDESC="TBS linux open source drivers"

PKG_IS_ADDON="embedded"
PKG_IS_KERNEL_PKG="yes"
PKG_ADDON_IS_STANDALONE="yes"
PKG_ADDON_NAME="DVB open source drivers for TBS"
PKG_ADDON_TYPE="xbmc.service"
PKG_ADDON_VERSION="${ADDON_VERSION}.${PKG_REV}"

pre_make_target() {
  export KERNEL_VER=$(get_module_dir)
  export LDFLAGS=""
}

make_target() {
  mkdir -p $PKG_BUILD/media
  cp -RP $(get_build_dir media_tree_tbsdtv)/* $PKG_BUILD/media
  make dir DIR=./media

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
