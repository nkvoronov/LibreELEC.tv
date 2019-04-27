# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="repository.yellowdragon"
PKG_VERSION="18.2"
PKG_SHA256="f32a2cf3b7c8652f7bd243f9cf23a135488224657ba95481fee1d169e62cd75b"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://kodi.tv/"
PKG_URL="https://github.com/nkvoronov/repository.yellowdragon/raw/leia/repo/$PKG_NAME/$PKG_NAME-$PKG_VERSION.zip"
PKG_DEPENDS_TARGET="toolchain Python2 kodi"
PKG_SECTION=""
PKG_SHORTDESC="YLLOW_DRAGON addons repository for KODI."
PKG_LONGDESC="YLLOW_DRAGON addons repository for KODI."
PKG_TOOLCHAIN="manual"

unpack() {
  unzip -q $SOURCES/$PKG_NAME/$PKG_NAME-$PKG_VERSION.zip -d $BUILD/$PKG_NAME-$PKG_VERSION
}

post_install() {
  mkdir -p $INSTALL/usr/share/kodi/addons/repository.yellowdragon
    cp -PR $PKG_BUILD/repository.yellowdragon/* $INSTALL/usr/share/kodi/addons/repository.yellowdragon
}
