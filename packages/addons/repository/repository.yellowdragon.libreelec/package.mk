# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="repository.yellowdragon.libreelec"
PKG_VERSION="9.0"
PKG_SHA256="e7f3935422f3e7997a9c62375268214fa9971822981406fa7dafb5dfb80d00e6"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://kodi.tv/"
PKG_URL="https://bitbucket.org/nkvoronov/repository.yellowdragon.libreelec/raw/$PKG_VERSION/repo/$PKG_NAME/$PKG_NAME-$PKG_VERSION.zip"
PKG_DEPENDS_TARGET="toolchain Python2 kodi"
PKG_SECTION=""
PKG_SHORTDESC="YLLOW_DRAGON addons repository for LibreELEC."
PKG_LONGDESC="YLLOW_DRAGON addons repository for LibreELEC."
PKG_TOOLCHAIN="manual"

unpack() {
  unzip -q $SOURCES/$PKG_NAME/$PKG_NAME-$PKG_VERSION.zip -d $BUILD/$PKG_NAME-$PKG_VERSION
}

post_install() {
  mkdir -p $INSTALL/usr/share/kodi/addons/repository.yellowdragon.libreelec
    cp -PR $PKG_BUILD/repository.yellowdragon.libreelec/* $INSTALL/usr/share/kodi/addons/repository.yellowdragon.libreelec
}
