# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2019-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="firmware-imx"
PKG_VERSION="7.9"
PKG_SHA256="30e22c3e24a8025d60c52ed5a479e30fad3ad72127c84a870e69ec34e46ea8c0"
PKG_ARCH="arm"
PKG_LICENSE="other"
PKG_SITE="http://www.freescale.com"
PKG_URL="https://www.nxp.com/lgfiles/NMG/MAD/YOCTO/${PKG_NAME}-${PKG_VERSION}.bin"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="firmware-imx: Freescale IMX firmware such as for the VPU"
PKG_TOOLCHAIN="manual"

unpack() {
  cd $(dirname $PKG_BUILD)
  sh $SOURCES/$PKG_NAME/$PKG_NAME-$PKG_VERSION.bin --auto-accept
}

makeinstall_target() {
  mkdir -p $INSTALL/$(get_full_firmware_dir)/imx/sdma
    cp -P firmware/sdma/sdma-imx6q.bin $INSTALL/$(get_full_firmware_dir)/imx/sdma

  mkdir -p $INSTALL/$(get_full_firmware_dir)/vpu
    cp -P firmware/vpu/vpu_fw_imx6d.bin $INSTALL/$(get_full_firmware_dir)/vpu
    cp -P firmware/vpu/vpu_fw_imx6q.bin $INSTALL/$(get_full_firmware_dir)/vpu
}
