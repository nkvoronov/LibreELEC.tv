# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="script.module.googleapi"
PKG_VERSION="1.6.7+matrix.1"
PKG_SHA256="c81645c1c67af835fe10be5cf8dc52a1a31562cfe9480f16429f3422c5650a64"
PKG_LICENSE="GPL"
PKG_SITE="https://kodi.tv/"
PKG_URL="https://ftp.up.pt/pub/kodi/addons/nexus/${PKG_NAME}/${PKG_NAME}-${PKG_VERSION}.zip"
PKG_SOURCE_DIR="$PKG_NAME"
PKG_DEPENDS_TARGET="toolchain Python3 kodi script.module.httplib2 script.module.uritemplate script.module.six script.module.oauth2client"
PKG_LONGDESC="Google API python classes and dependencies"
PKG_TOOLCHAIN="manual"

post_install() {
  mkdir -p ${INSTALL}/usr/share/kodi/addons/${PKG_NAME}
    cp -PR ${PKG_BUILD}/* ${INSTALL}/usr/share/kodi/addons/${PKG_NAME}

  rm ${INSTALL}/usr/share/kodi/addons/${PKG_NAME}/README.md
  rm ${INSTALL}/usr/share/kodi/addons/${PKG_NAME}/LICENSE.txt
  rm ${INSTALL}/usr/share/kodi/addons/${PKG_NAME}/changelog.txt

  python_compile ${INSTALL}/usr/share/kodi/addons/${PKG_NAME}/lib/
}
