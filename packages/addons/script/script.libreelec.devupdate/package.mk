# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="script.libreelec.devupdate"
PKG_VERSION="d9127fb9810009fb49056d10632a3736739e1dcd"
PKG_LICENSE="GPL"
PKG_SITE="https://kodi.tv/"
PKG_URL="https://github.com/nkvoronov/${PKG_NAME}.git"
PKG_GIT_CLONE_BRANCH="vmatrix"
PKG_DEPENDS_TARGET="toolchain Python3 kodi script.module.beautifulsoup4 script.module.requests script.module.html2text script.xbmcbackup"
PKG_LONGDESC="Unofficial LibreELEC updater"
PKG_TOOLCHAIN="manual"

unpack() {
  mkdir -p ${PKG_BUILD}
  cp -PR ${SOURCES}/${PKG_NAME}/${PKG_NAME}-${PKG_VERSION}/* ${PKG_BUILD}
}

post_install() {
  mkdir -p ${INSTALL}/usr/share/kodi/addons/${PKG_NAME}
    cp -PR ${PKG_BUILD}/* ${INSTALL}/usr/share/kodi/addons/${PKG_NAME}

  rm ${INSTALL}/usr/share/kodi/addons/${PKG_NAME}/README.md
  rm ${INSTALL}/usr/share/kodi/addons/${PKG_NAME}/LICENSE.txt

  python_compile ${INSTALL}/usr/share/kodi/addons/${PKG_NAME}/lib/
}