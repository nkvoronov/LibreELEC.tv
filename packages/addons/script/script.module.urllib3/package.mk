# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="script.module.urllib3"
PKG_VERSION="1.26.13+matrix.1"
PKG_SHA256="53ec907c6ae7cebc0ed5be2269d2bedb21fd2e5eb829c3fbb96dd9e7e8f3839c"
PKG_LICENSE="GPL"
PKG_SITE="https://kodi.tv/"
PKG_URL="https://ftp.up.pt/pub/kodi/addons/nexus/${PKG_NAME}/${PKG_NAME}-${PKG_VERSION}.zip"
PKG_SOURCE_DIR="$PKG_NAME"
PKG_DEPENDS_TARGET="toolchain Python3 kodi"
PKG_LONGDESC="urllib3 is a powerful, sanity-friendly HTTP client for Python"
PKG_TOOLCHAIN="manual"

post_install() {
  mkdir -p ${INSTALL}/usr/share/kodi/addons/${PKG_NAME}
    cp -PR ${PKG_BUILD}/* ${INSTALL}/usr/share/kodi/addons/${PKG_NAME}

  rm ${INSTALL}/usr/share/kodi/addons/${PKG_NAME}/LICENSE.txt
  rm ${INSTALL}/usr/share/kodi/addons/${PKG_NAME}/README.md

  python_compile ${INSTALL}/usr/share/kodi/addons/${PKG_NAME}/lib/
}
