# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="script.vdrfront.run"
PKG_VERSION="1.0"
PKG_LICENSE="GPL"
PKG_SITE=""
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain Python2 kodi"
PKG_SOURCE_DIR="$PKG_NAME"
PKG_LONGDESC="Run VDR front"
PKG_TOOLCHAIN="manual"

post_install() {
  mkdir -p $INSTALL/usr/share/kodi/addons/$PKG_NAME
    cp -PR $PKG_DIR/source/$PKG_NAME/* $INSTALL/usr/share/kodi/addons/$PKG_NAME
}
