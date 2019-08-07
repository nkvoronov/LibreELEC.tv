# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2019-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="repository.yellowdragon"
PKG_VERSION="18.3"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://kodi.tv/"
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION=""
PKG_SHORTDESC="YLLOW_DRAGON addons repository for KODI."
PKG_LONGDESC="YLLOW_DRAGON addons repository for KODI."
PKG_TOOLCHAIN="manual"

post_install() {
  mkdir -p $INSTALL/usr/share/kodi/addons/$PKG_NAME
    cp -PR $PKG_DIR/source/* $INSTALL/usr/share/kodi/addons/$PKG_NAME

  sed -e "s|@PKG_VERSION@|$PKG_VERSION|g" \
      -i $INSTALL/usr/share/kodi/addons/$PKG_NAME/addon.xml
}
