# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="script.module.certifi"
PKG_VERSION="2022.9.24"
PKG_SHA256="48f70d0ec82e551e9c32eff97ef15efb9087cc9245e66cc1a5523e8545c961b1"
PKG_LICENSE="GPL"
PKG_SITE="https://kodi.tv/"
PKG_URL="https://ftp.up.pt/pub/kodi/addons/nexus/${PKG_NAME}/${PKG_NAME}-${PKG_VERSION}.zip"
PKG_SOURCE_DIR="$PKG_NAME"
PKG_DEPENDS_TARGET="toolchain Python3 kodi"
PKG_LONGDESC="Python SSL Certificates"
PKG_TOOLCHAIN="manual"

post_install() {
  mkdir -p ${INSTALL}/usr/share/kodi/addons/${PKG_NAME}
    cp -PR ${PKG_BUILD}/* ${INSTALL}/usr/share/kodi/addons/${PKG_NAME}

  rm ${INSTALL}/usr/share/kodi/addons/${PKG_NAME}/LICENSE
  rm ${INSTALL}/usr/share/kodi/addons/${PKG_NAME}/README.rst

  python_compile ${INSTALL}/usr/share/kodi/addons/${PKG_NAME}/lib/
}
