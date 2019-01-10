# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="oscam12"
PKG_VERSION="11448"
PKG_REV="149"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.streamboard.tv/oscam/wiki"
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain oscam pcsc-lite"
PKG_SECTION="service"
PKG_SHORTDESC="oscam (Version: $PKG_VERSION): OSCam is Open Source Conditional Access Modul."
PKG_LONGDESC="oscam (Version: $PKG_VERSION): OSCam is Open Source Conditional Access Modul."
PKG_DISCLAIMER="using oscam may be illegal in your country. if in doubt, do not install"
PKG_TOOLCHAIN="manual"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="OSCam"
PKG_ADDON_TYPE="xbmc.service"

addon() {
  OSCAM_DIR=$(get_build_dir oscam)
  PCSCLITE_DIR=$(get_build_dir pcsc-lite)

  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/bin
    cp -P $OSCAM_DIR/.$TARGET_NAME/oscam $ADDON_BUILD/$PKG_ADDON_ID/bin
    cp -P $OSCAM_DIR/.$TARGET_NAME/utils/list_smargo $ADDON_BUILD/$PKG_ADDON_ID/bin

  #mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/lib
    #cp -P $PCSCLITE_DIR/.install_pkg/usr/lib/libpcsclite.so.1.0.0 $ADDON_BUILD/$PKG_ADDON_ID/lib/libpcsclite.so.1
}