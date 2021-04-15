# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="script.module.six"
PKG_VERSION="1.15.0+matrix.1"
PKG_SHA256="aaf2331e7090ff3c8b371914a37394c6457a38fc8fca2cce8e8380d8907efa09"
PKG_LICENSE="GPL"
PKG_SITE="https://kodi.tv/"
PKG_URL="http://mirrors.kodi.tv/addons/matrix/${PKG_NAME}/${PKG_NAME}-${PKG_VERSION}.zip"
PKG_SOURCE_DIR="$PKG_NAME"
PKG_DEPENDS_TARGET="toolchain Python3 kodi"
PKG_LONGDESC="Python 2 and 3 compatibility utilities."
PKG_TOOLCHAIN="manual"

post_install() {
  mkdir -p ${INSTALL}/usr/share/kodi/addons/${PKG_NAME}
    cp -PR ${PKG_BUILD}/* ${INSTALL}/usr/share/kodi/addons/${PKG_NAME}

  rm ${INSTALL}/usr/share/kodi/addons/${PKG_NAME}/README
  rm ${INSTALL}/usr/share/kodi/addons/${PKG_NAME}/LICENSE

  python_compile ${INSTALL}/usr/share/kodi/addons/${PKG_NAME}/lib/
}