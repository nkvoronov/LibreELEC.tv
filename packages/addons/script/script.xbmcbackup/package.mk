# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="script.xbmcbackup"
PKG_VERSION="1.6.7"
PKG_SHA256="624516b1a35691494c323da61d7f952ef1e0e8b570eee6a27b8b08618d584360"
PKG_LICENSE="GPL"
PKG_SITE="https://kodi.tv/"
PKG_URL="http://mirrors.kodi.tv/addons/matrix/${PKG_NAME}/${PKG_NAME}-${PKG_VERSION}.zip"
PKG_SOURCE_DIR="${PKG_NAME}"
PKG_DEPENDS_TARGET="toolchain Python3 kodi script.module.httplib2 script.module.oauth2client script.module.uritemplate script.module.yaml script.module.googleapi"
PKG_LONGDESC="Backup and restore your XBMC database and configuration files in the event of a crash or file."
PKG_TOOLCHAIN="manual"

post_install() {
  mkdir -p ${INSTALL}/usr/share/kodi/addons/${PKG_NAME}
    cp -PR ${PKG_BUILD}/* ${INSTALL}/usr/share/kodi/addons/${PKG_NAME}

  rm ${INSTALL}/usr/share/kodi/addons/${PKG_NAME}/LICENSE.txt

  python_compile ${INSTALL}/usr/share/kodi/addons/${PKG_NAME}/lib/

  rm -rf `find ${INSTALL}/usr/share/kodi/addons/${PKG_NAME}/ -name "*.gitignore"`
}
