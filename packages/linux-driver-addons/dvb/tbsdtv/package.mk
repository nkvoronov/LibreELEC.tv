# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2019-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="tbsdtv"
PKG_VERSION="63d83171b5b49c706ce6dbb5711d79ff59d77859"
PKG_SHA256="46f9ce0d3aa0d4f15e9d15a7b65690a2e69205a898286c826d7e5799c2ac6b6c"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/tbsdtv/media_build.git"
PKG_URL="https://github.com/tbsdtv/media_build/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux media_tree_tbsdtv"
PKG_NEED_UNPACK="$LINUX_DEPENDS $(get_pkg_directory media_tree_tbsdtv)"
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
