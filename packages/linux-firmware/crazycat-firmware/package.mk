# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="crazycat-firmware"
PKG_VERSION="1.0"
PKG_ARCH="any"
PKG_SHA256="bbba5ea89ad65f535e22bfa97d0ad172b677cfbde4f7b399fc0b2e31a148d95e"
PKG_LICENSE="Free-to-use"
PKG_SITE="https://bitbucket.org/CrazyCat/media_build/downloads/"
PKG_URL="https://bitbucket.org/CrazyCat/media_build/downloads/dvb-firmwares.tar.bz2"
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
