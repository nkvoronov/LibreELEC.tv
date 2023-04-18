# SPDX-License-Identifier: GPL-2.0
# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2019-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="tbsdtv"
PKG_VERSION="4fd76794ab87353ed38e0e3291c9610c4876c841"
PKG_GIT_CLONE_BRANCH="extra"
PKG_URL="https://github.com/tbsdtv/media_build.git"
PKG_DEPENDS_UNPACK="media_tree_tbsdtv"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/tbsdtv/media_build.git"
PKG_SECTION="driver.dvb"
PKG_LONGDESC="TBSDTV linux open source drivers"
PKG_TOOLCHAIN="manual"

PKG_IS_ADDON="embedded"
PKG_IS_KERNEL_PKG="yes"
PKG_ADDON_IS_STANDALONE="yes"
PKG_ADDON_NAME="TBSDTV open source drivers"
PKG_ADDON_TYPE="xbmc.service"
PKG_ADDON_VERSION="${ADDON_VERSION}.${PKG_REV}"

TBSDTV_CONFIG="stagingconfig"

pre_make_target() {
  export KERNEL_VER=$(get_module_dir)
  export LDFLAGS=""
}

make_target() {
  mkdir -p ${PKG_BUILD}/media
  cp -RP $(get_build_dir media_tree_tbsdtv)/* ${PKG_BUILD}/media
  make dir DIR=./media

  # make config
  kernel_make VER=${KERNEL_VER} SRCDIR=$(kernel_path) ${TBSDTV_CONFIG}

  if [ " ${TBSDTV_CONFIG}" = stagingconfig ]; then
    # Disable RC/IR support
    sed -i -r 's/(^CONFIG.*_RC.*=)./\1n/g' v4l/.config
    sed -i -r 's/(^CONFIG.*_IR.*=)./\1n/g' v4l/.config
  fi

  # hack to workaround media_build bug
  if [ "${PROJECT}" = Rockchip ]; then
    sed -e 's/CONFIG_DVB_CXD2820R=m/# CONFIG_DVB_CXD2820R is not set/g' -i v4l/.config
    sed -e 's/CONFIG_DVB_LGDT3306A=m/# CONFIG_DVB_LGDT3306A is not set/g' -i v4l/.config
  fi

  # add menuconfig to edit .config
  kernel_make VER=${KERNEL_VER} SRCDIR=$(kernel_path)
}

makeinstall_target() {
  install_driver_addon_files "${PKG_BUILD}/v4l/"
}