# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="script.module.uritemplate"
PKG_VERSION="3.0.1+matrix.2"
#PKG_SHA256="795e11ca7204bff6a6b9324b9cc567e60d3b7c9e1c0f156faceb2ed4f74f9ce0"
PKG_LICENSE="GPL"
PKG_SITE="https://kodi.tv/"
PKG_URL="http://mirrors.kodi.tv/addons/matrix/${PKG_NAME}/${PKG_NAME}-${PKG_VERSION}.zip"
PKG_SOURCE_DIR="$PKG_NAME"
PKG_DEPENDS_TARGET="toolchain Python3 kodi"
PKG_LONGDESC="URItemplates python module"
PKG_TOOLCHAIN="manual"

post_install() {
  mkdir -p ${INSTALL}/usr/share/kodi/addons/${PKG_NAME}
    cp -PR ${PKG_BUILD}/* ${INSTALL}/usr/share/kodi/addons/${PKG_NAME}

  rm ${INSTALL}/usr/share/kodi/addons/${PKG_NAME}/README.md
  rm ${INSTALL}/usr/share/kodi/addons/${PKG_NAME}/LICENSE

  python_compile ${INSTALL}/usr/share/kodi/addons/${PKG_NAME}/lib/
}
