# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="script.module.requests"
PKG_VERSION="2.25.1+matrix.1"
#PKG_SHA256="354b28e22377f49593b2bfdaaedd80dea04f5bf757eec8064b5c9f0ce96f15ce"
PKG_LICENSE="GPL"
PKG_SITE="https://kodi.tv/"
PKG_URL="http://mirrors.kodi.tv/addons/matrix/${PKG_NAME}/${PKG_NAME}-${PKG_VERSION}.zip"
PKG_DEPENDS_TARGET="toolchain Python3 kodi script.module.urllib3 script.module.chardet script.module.idna script.module.certifi"
PKG_SOURCE_DIR="$PKG_NAME"
PKG_LONGDESC="Python HTTP for Humans"
PKG_TOOLCHAIN="manual"

post_install() {
  mkdir -p ${INSTALL}/usr/share/kodi/addons/${PKG_NAME}
    cp -PR ${PKG_BUILD}/* ${INSTALL}/usr/share/kodi/addons/${PKG_NAME}

  rm ${INSTALL}/usr/share/kodi/addons/${PKG_NAME}/README.md
  rm ${INSTALL}/usr/share/kodi/addons/${PKG_NAME}/LICENSE.txt

  python_compile ${INSTALL}/usr/share/kodi/addons/${PKG_NAME}/lib/
}
