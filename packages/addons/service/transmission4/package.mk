# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2023-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="transmission4"
PKG_VERSION="4.02"
PKG_REV="12"
PKG_ARCH="any"
PKG_LICENSE="OSS"
PKG_SITE="http://www.transmissionbt.com/"
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain transmission"
PKG_SECTION="service"
PKG_SHORTDESC="transmission: a fast, easy and free BitTorrent client"
PKG_LONGDESC="transmission(${PKG_VERSION}) is a fast, easy and free BitTorrent client"
PKG_TOOLCHAIN="manual"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="Transmission"
PKG_ADDON_TYPE="xbmc.service"

addon() {
  TRANSMISSION_DIR=$(get_install_dir transmission)

  mkdir -p ${ADDON_BUILD}/${PKG_ADDON_ID}/bin
    cp ${TRANSMISSION_DIR}/usr/bin/transmission-daemon ${ADDON_BUILD}/${PKG_ADDON_ID}/bin
    cp ${TRANSMISSION_DIR}/usr/bin/transmission-remote ${ADDON_BUILD}/${PKG_ADDON_ID}/bin
    cp ${TRANSMISSION_DIR}/usr/bin/transmission-create ${ADDON_BUILD}/${PKG_ADDON_ID}/bin
    cp ${TRANSMISSION_DIR}/usr/bin/transmission-edit ${ADDON_BUILD}/${PKG_ADDON_ID}/bin
    cp ${TRANSMISSION_DIR}/usr/bin/transmission-show ${ADDON_BUILD}/${PKG_ADDON_ID}/bin

  mkdir -p ${ADDON_BUILD}/${PKG_ADDON_ID}/web
    cp -pR $(get_build_dir transmission)/web/* ${ADDON_BUILD}/${PKG_ADDON_ID}/web
    rm -rf ${ADDON_BUILD}/${PKG_ADDON_ID}/web/CMakeLists.txt
}