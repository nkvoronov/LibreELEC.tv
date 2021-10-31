# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="script.module.beautifulsoup4"
PKG_VERSION="4.9.3+matrix.1"
PKG_SHA256="6d3c1c1be42d4eedf0a8abaa6a21ef092c7a132bcc30afcd1913352654be33ed"
PKG_LICENSE="GPL"
PKG_SITE="https://kodi.tv/"
PKG_URL="http://mirrors.kodi.tv/addons/matrix/${PKG_NAME}/${PKG_NAME}-${PKG_VERSION}.zip"
PKG_SOURCE_DIR="$PKG_NAME"
PKG_DEPENDS_TARGET="toolchain Python3 kodi script.module.soupsieve"
PKG_LONGDESC="HTML/XML parser for quick-turnaround applications like screen-scraping"
PKG_TOOLCHAIN="manual"

post_install() {
  mkdir -p ${INSTALL}/usr/share/kodi/addons/${PKG_NAME}
    cp -PR ${PKG_BUILD}/* ${INSTALL}/usr/share/kodi/addons/${PKG_NAME}

  rm ${INSTALL}/usr/share/kodi/addons/${PKG_NAME}/LICENSE
  rm ${INSTALL}/usr/share/kodi/addons/${PKG_NAME}/README.md
  rm ${INSTALL}/usr/share/kodi/addons/${PKG_NAME}/NEWS.txt
  rm ${INSTALL}/usr/share/kodi/addons/${PKG_NAME}/AUTHORS.txt
  rm ${INSTALL}/usr/share/kodi/addons/${PKG_NAME}/COPYING.txt

  python_compile ${INSTALL}/usr/share/kodi/addons/${PKG_NAME}/lib/
}
