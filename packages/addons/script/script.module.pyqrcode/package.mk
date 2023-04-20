# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="script.module.pyqrcode"
PKG_VERSION="1.2.1+matrix.4"
PKG_SHA256="94f57be69d4fdebc6541d54f67e008532b3583bdc6f9ded3506a7a607c459f4d"
PKG_LICENSE="GPL"
PKG_SITE="https://kodi.tv/"
PKG_URL="https://ftp.up.pt/pub/kodi/addons/nexus/${PKG_NAME}/${PKG_NAME}-${PKG_VERSION}.zip"
PKG_SOURCE_DIR="$PKG_NAME"
PKG_DEPENDS_TARGET="toolchain Python3 kodi"
PKG_LONGDESC="A Python interface to generate QR Code"
PKG_TOOLCHAIN="manual"

post_install() {
  mkdir -p ${INSTALL}/usr/share/kodi/addons/${PKG_NAME}
    cp -PR ${PKG_BUILD}/* ${INSTALL}/usr/share/kodi/addons/${PKG_NAME}

  rm ${INSTALL}/usr/share/kodi/addons/${PKG_NAME}/LICENSE.md

  python_compile ${INSTALL}/usr/share/kodi/addons/${PKG_NAME}/lib/
}
