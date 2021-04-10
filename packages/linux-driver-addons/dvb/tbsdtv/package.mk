# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2019-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="tbsdtv"
PKG_VERSION="1c75627fd516087ac36652081ed9f613e019c5ee"
#PKG_SHA256="2193e1c62ffa9975b4861c4671bf1f3b6261b25ada612728f51f794666efbb3f"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/tbsdtv/media_build.git"
PKG_URL="https://github.com/tbsdtv/media_build/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_UNPACK="media_tree_tbsdtv"
PKG_SECTION="driver.dvb"
PKG_LONGDESC="TBS linux open source drivers"

PKG_IS_ADDON="embedded"
PKG_IS_KERNEL_PKG="yes"
PKG_ADDON_IS_STANDALONE="yes"
PKG_ADDON_NAME="DVB open source drivers for TBS"
PKG_ADDON_TYPE="xbmc.service"
PKG_ADDON_VERSION="${ADDON_VERSION}.${PKG_REV}"

PKG_KERNEL_CFG_FILE=$(kernel_config_path) || die

if ! grep -q ^CONFIG_USB_PCI= ${PKG_KERNEL_CFG_FILE}; then
  PKG_PATCH_DIRS="disable-pci"
fi

pre_make_target() {
  export KERNEL_VER=$(get_module_dir)
  export LDFLAGS=""
}

make_target() {
  mkdir -p ${PKG_BUILD}/media
  cp -RP $(get_build_dir media_tree_tbsdtv)/* ${PKG_BUILD}/media
  make dir DIR=./media

  #cp -RP $(get_build_dir media_tree_tbsdtv)/* ${PKG_BUILD}/linux

  # make config all
  kernel_make VER=${KERNEL_VER} SRCDIR=$(kernel_path) allyesconfig

  # hack to workaround media_build bug
  if [ "${PROJECT}" = Rockchip ]; then
    sed -e 's/CONFIG_DVB_CXD2820R=m/# CONFIG_DVB_CXD2820R is not set/g' -i v4l/.config
    sed -e 's/CONFIG_DVB_LGDT3306A=m/# CONFIG_DVB_LGDT3306A is not set/g' -i v4l/.config
  fi

  # add menuconfig to edit .config
  export MAX_ARG_PAGES=64
  kernel_make -j4 VER=${KERNEL_VER} SRCDIR=$(kernel_path)
}

makeinstall_target() {
  install_driver_addon_files "${PKG_BUILD}/v4l/"
}
