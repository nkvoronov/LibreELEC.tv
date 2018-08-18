# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="media_build_firmware"
PKG_VERSION="1.0.0"
PKG_ARCH="any"
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

make_target() {
  : # nothing todo
}

makeinstall_target() {
  DESTDIR=$INSTALL/usr ./install
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/firmware
    cp -PR $PKG_BUILD/firmware/* $INSTALL/usr/lib/firmware
}
