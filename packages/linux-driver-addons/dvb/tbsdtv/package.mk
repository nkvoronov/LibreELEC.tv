# SPDX-License-Identifier: GPL-2.0
# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2019-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="tbsdtv"

if [ "${TBSDTV_EXT}" = "yes" ]; then
   PKG_VERSION="20211204"
   PKG_SHA256="8091bc05e07c224d0803b1e477cf5e6257bf867bdd579883f434c41d4d94fa77"
   PKG_URL="https://www.dropbox.com/s/mywf7a9pudb7xsk/${PKG_NAME}-${PKG_VERSION}.tar.gz"
else
   PKG_VERSION="945eea7"
   PKG_GIT_CLONE_BRANCH="extra"
   PKG_URL="https://github.com/tbsdtv/media_build.git"
   PKG_DEPENDS_UNPACK="media_tree_tbsdtv"
fi

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

if [ "${TBSDTV_EXT}" = "yes" ]; then

make_target() {
  :
}

else

PKG_KERNEL_CFG_FILE=$(kernel_config_path) || die

if ! grep -q ^CONFIG_USB_PCI= ${PKG_KERNEL_CFG_FILE}; then
  PKG_PATCH_DIRS="disable-pci"
fi

post_unpack() {
  for patch in `ls ${PKG_DIR}/patches.upstream/*.patch`; do
      cat $patch | patch -d \
      `echo ${BUILD}/${PKG_NAME}-${PKG_VERSION} | cut -f1 -d\ ` -p1
  done
}

pre_make_target() {
  export KERNEL_VER=$(get_module_dir)
  export LDFLAGS=""
}

make_target() {
  mkdir -p ${PKG_BUILD}/media
  cp -RP $(get_build_dir media_tree_tbsdtv)/* ${PKG_BUILD}/media
  make dir DIR=./media

  # make config all
  kernel_make VER=${KERNEL_VER} SRCDIR=$(kernel_path) allyesconfig

  # hack to workaround media_build bug
  if [ "${PROJECT}" = Rockchip ]; then
    sed -e 's/CONFIG_DVB_CXD2820R=m/# CONFIG_DVB_CXD2820R is not set/g' -i v4l/.config
    sed -e 's/CONFIG_DVB_LGDT3306A=m/# CONFIG_DVB_LGDT3306A is not set/g' -i v4l/.config
  fi

  # add menuconfig to edit .config
  kernel_make VER=${KERNEL_VER} SRCDIR=$(kernel_path)
}

fi

makeinstall_target() {
  install_driver_addon_files "${PKG_BUILD}/v4l/"
}