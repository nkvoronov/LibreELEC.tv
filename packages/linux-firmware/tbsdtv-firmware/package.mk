# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="tbsdtv-firmware"
PKG_VERSION="1.0"
PKG_SHA256="fc400730a20ee638a1309be3723c663f297a36771fba2ce5f240ab41ca45ffd2"
PKG_ARCH="any"
PKG_LICENSE="Free-to-use"
PKG_SITE="https://github.com/tbsdtv/linux_media/wiki"
PKG_URL="http://www.tbsdtv.com/download/document/linux/tbs-tuner-firmwares_v$PKG_VERSION.tar.bz2"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="firmware"
PKG_SHORTDESC="dvb-firmware: firmwares for various DVB drivers"
PKG_LONGDESC="dvb-firmware: firmwares for various DVB drivers"
PKG_TOOLCHAIN="manual"

unpack() {
  mkdir -p $PKG_BUILD/firmware
  cd $PKG_BUILD/firmware
  tar xvfj $ROOT/sources/$PKG_NAME/$PKG_NAME-$PKG_VERSION.tar.bz2
}

makeinstall_target() {
  FW_DIR=$INSTALL/$(get_kernel_overlay_dir)

  mkdir -p $FW_DIR
    cp -a $PKG_BUILD/firmware/* $FW_DIR
}
