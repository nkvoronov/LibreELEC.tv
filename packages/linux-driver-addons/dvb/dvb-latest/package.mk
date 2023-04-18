# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="dvb-latest"
PKG_VERSION="0fe857b86addf382f6fd383948bd7736a3201403"
PKG_LICENSE="GPL"
PKG_SITE="https://git.linuxtv.org/media_build.git"
PKG_URL="https://git.linuxtv.org/media_build.git"
PKG_DEPENDS_UNPACK="media_tree"
PKG_SECTION="driver.dvb"
PKG_LONGDESC="DVB drivers from the latest kernel (media_build)"

PKG_IS_ADDON="embedded"
PKG_IS_KERNEL_PKG="yes"
PKG_ADDON_IS_STANDALONE="yes"
PKG_ADDON_NAME="DVB drivers from the latest kernel"
PKG_ADDON_TYPE="xbmc.service"
PKG_ADDON_VERSION="${ADDON_VERSION}.${PKG_REV}"

DVB_CONFIG="allyesconfig"

pre_make_target() {
  export KERNEL_VER=$(get_module_dir)
  export LDFLAGS=""
}

make_target() {
  mkdir -p ${PKG_BUILD}/media
  cp -RP $(get_build_dir media_tree)/* ${PKG_BUILD}/media
  make dir DIR=./media

  # make config
  kernel_make VER=${KERNEL_VER} SRCDIR=$(kernel_path) ${DVB_CONFIG}

  if [ " ${DVB_CONFIG}" = stagingconfig ]; then
    # Disable RC/IR support
    sed -i -r 's/(^CONFIG.*_RC.*=)./\1n/g' v4l/.config
    sed -i -r 's/(^CONFIG.*_IR.*=)./\1n/g' v4l/.config
  fi

  kernel_make VER=${KERNEL_VER} SRCDIR=$(kernel_path)
}

makeinstall_target() {
  install_driver_addon_files "${PKG_BUILD}/v4l/"
}
