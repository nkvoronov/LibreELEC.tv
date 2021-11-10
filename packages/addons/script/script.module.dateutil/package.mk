# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="script.module.dateutil"
PKG_VERSION="2.8.1+matrix.1"
PKG_SHA256="a0638397b0fb3a328d0f5641cc582077b654b06a981c42fedea8e153681a3d18"
PKG_LICENSE="GPL"
PKG_SITE="https://kodi.tv/"
PKG_URL="http://mirrors.kodi.tv/addons/matrix/${PKG_NAME}/${PKG_NAME}-${PKG_VERSION}.zip"
PKG_SOURCE_DIR="$PKG_NAME"
PKG_DEPENDS_TARGET="toolchain Python3 kodi"
PKG_LONGDESC="Extensions to the standard Python datetime module"
PKG_TOOLCHAIN="manual"

post_install() {
  mkdir -p ${INSTALL}/usr/share/kodi/addons/${PKG_NAME}
    cp -PR ${PKG_BUILD}/* ${INSTALL}/usr/share/kodi/addons/${PKG_NAME}

  rm ${INSTALL}/usr/share/kodi/addons/${PKG_NAME}/LICENSE
  rm ${INSTALL}/usr/share/kodi/addons/${PKG_NAME}/README.rst
  rm ${INSTALL}/usr/share/kodi/addons/${PKG_NAME}/NEWS

  python_compile ${INSTALL}/usr/share/kodi/addons/${PKG_NAME}/lib/
}