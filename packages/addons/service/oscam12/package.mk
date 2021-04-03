# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="oscam12"
PKG_VERSION="11689"
PKG_REV="201"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.streamboard.tv/oscam/wiki"
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain oscam"
PKG_SECTION="service"
PKG_SHORTDESC="OSCam: an Open Source Conditional Access Modul"
PKG_LONGDESC="OSCam(${PKG_VERSION}) is a software to be used to decrypt digital television channels, as an alternative for a conditional access module."
PKG_TOOLCHAIN="manual"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="OSCam"
PKG_ADDON_TYPE="xbmc.service"

addon() {
  OSCAM_DIR=$(get_install_dir oscam)

  mkdir -p ${ADDON_BUILD}/${PKG_ADDON_ID}/bin
    cp -P ${OSCAM_DIR}/oscam ${ADDON_BUILD}/${PKG_ADDON_ID}/bin
    cp -P ${OSCAM_DIR}/utils/list_smargo ${ADDON_BUILD}/${PKG_ADDON_ID}/bin
}