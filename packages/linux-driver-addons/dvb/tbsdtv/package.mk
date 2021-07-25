# SPDX-License-Identifier: GPL-2.0
# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2019-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="tbsdtv"
PKG_VERSION="20210725"
PKG_SHA256="972c3edb6be67151475360272c825cc8d2ec705d4d6b18519fdff3731579e728"
#PKG_VERSION="792e22bb59ff3b3c254f0b1b065dce09a3d09214"
#PKG_SHA256="d0b03eca4293254e0f86568f2ae62bb59146d2323f202d5959f3f2f2cfb8850d"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/tbsdtv/media_build.git"
PKG_URL="https://www.dropbox.com/s/4qhr1zxs9owg3pd/tbsdtv-${PKG_VERSION}.tar.gz"
#PKG_URL="https://github.com/tbsdtv/media_build/archive/${PKG_VERSION}.tar.gz"
#PKG_DEPENDS_UNPACK="media_tree_tbsdtv"
PKG_SECTION="driver.dvb"
PKG_LONGDESC="TBSDTV linux open source drivers"
PKG_TOOLCHAIN="manual"

PKG_IS_ADDON="embedded"
PKG_IS_KERNEL_PKG="yes"
PKG_ADDON_IS_STANDALONE="yes"
PKG_ADDON_NAME="TBSDTV open source drivers"
PKG_ADDON_TYPE="xbmc.service"
PKG_ADDON_VERSION="${ADDON_VERSION}.${PKG_REV}"

PKG_KERNEL_CFG_FILE=$(kernel_config_path) || die

#if ! grep -q ^CONFIG_USB_PCI= ${PKG_KERNEL_CFG_FILE}; then
#  PKG_PATCH_DIRS="disable-pci"
#fi

#pre_make_target() {
#  export KERNEL_VER=$(get_module_dir)
#  export LDFLAGS=""
#}

#make_target() {
#  mkdir -p ${PKG_BUILD}/media
#  cp -RP $(get_build_dir media_tree_tbsdtv)/* ${PKG_BUILD}/media
#  make dir DIR=./media
#
#  #cp -RP $(get_build_dir media_tree_tbsdtv)/* ${PKG_BUILD}/linux
#
#  # make config all
#  kernel_make VER=${KERNEL_VER} SRCDIR=$(kernel_path) allyesconfig
#
#  # hack to workaround media_build bug
#  if [ "${PROJECT}" = Rockchip ]; then
#    sed -e 's/CONFIG_DVB_CXD2820R=m/# CONFIG_DVB_CXD2820R is not set/g' -i v4l/.config
#    sed -e 's/CONFIG_DVB_LGDT3306A=m/# CONFIG_DVB_LGDT3306A is not set/g' -i v4l/.config
#  fi
#
#  # add menuconfig to edit .config
#  export MAX_ARG_PAGES=64
#  kernel_make -j4 VER=${KERNEL_VER} SRCDIR=$(kernel_path)
#}

make_target() {
  :
}

makeinstall_target() {
  install_driver_addon_files "${PKG_BUILD}/"
}



