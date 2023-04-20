# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="script.module.dateutil"
PKG_VERSION="2.8.2"
PKG_SHA256="beae31550e11dca015223c278987d5238ad374ae07043d83a506711877bf379e"
PKG_LICENSE="GPL"
PKG_SITE="https://kodi.tv/"
PKG_URL="https://ftp.up.pt/pub/kodi/addons/nexus/${PKG_NAME}/${PKG_NAME}-${PKG_VERSION}.zip"
PKG_SOURCE_DIR="$PKG_NAME"
PKG_DEPENDS_TARGET="toolchain Python3 kodi"
PKG_LONGDESC="Extensions to the standard Python datetime module"
PKG_TOOLCHAIN="manual"

post_install() {
  mkdir -p ${INSTALL}/usr/share/kodi/addons/${PKG_NAME}
    cp -PR ${PKG_BUILD}/* ${INSTALL}/usr/share/kodi/addons/${PKG_NAME}

  rm ${INSTALL}/usr/share/kodi/addons/${PKG_NAME}/LICENSE.txt
  rm ${INSTALL}/usr/share/kodi/addons/${PKG_NAME}/README.md

  python_compile ${INSTALL}/usr/share/kodi/addons/${PKG_NAME}/lib/
}
