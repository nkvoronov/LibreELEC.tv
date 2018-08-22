# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="repository.yellowdragon"
PKG_VERSION="18.0"
PKG_SHA256=""
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE=""
PKG_URL="https://github.com/nkvoronov/repository.yellowdragon/raw/leia/repo/$PKG_NAME/$PKG_NAME-$PKG_VERSION.zip"
PKG_DEPENDS_TARGET="toolchain Python2 kodi"
PKG_SECTION="repository"
PKG_SHORTDESC="YLLOW_DRAGON addons repository for KODI."
PKG_LONGDESC="YLLOW_DRAGON addons repository for KODI."
PKG_TOOLCHAIN="manual"

unpack() {
  unzip -q $ROOT/$SOURCES/$PKG_NAME/$PKG_NAME-$PKG_VERSION.zip -d $BUILD/$PKG_NAME-$PKG_VERSION
}

post_install() {
  mkdir -p $INSTALL/usr/share/kodi/addons/repository.yellowdragon
    cp -PR $PKG_BUILD/repository.yellowdragon/* $INSTALL/usr/share/kodi/addons/repository.yellowdragon
}
