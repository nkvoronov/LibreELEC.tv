# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="tbsdtv-firmware"
PKG_VERSION="1.0"
PKG_SHA256="bceb70bc3e8b982f4d3c18c146e3ccca9790724c4f132eb0a42a13fdb701e3ea"
PKG_LICENSE="Free-to-use"
PKG_SITE="https://github.com/tbsdtv/linux_media/wiki"
PKG_URL="http://www.tbsdtv.com/download/document/linux/tbs-tuner-firmwares_v$PKG_VERSION.tar.bz2"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="dvb-firmware: firmwares for various DVB drivers"
PKG_TOOLCHAIN="manual"

unpack() {
  mkdir -p ${PKG_BUILD}/firmware
  cd ${PKG_BUILD}/firmware
  tar xvfj ${ROOT}/sources/${PKG_NAME}/${PKG_NAME}-${PKG_VERSION}.tar.bz2
}

makeinstall_target() {
  FW_DIR=${INSTALL}/$(get_full_firmware_dir)

  mkdir -p ${FW_DIR}
    cp -a ${PKG_BUILD}/firmware/* ${FW_DIR}
}
