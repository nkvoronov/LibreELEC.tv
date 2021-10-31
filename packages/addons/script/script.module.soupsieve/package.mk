# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="script.module.soupsieve"
PKG_VERSION="2.1.0+matrix.1"
PKG_SHA256="decad7b3e31a26c76141824f8a36dd4a8abb664781d2d2df8287eda5898c83bd"
PKG_LICENSE="GPL"
PKG_SITE="https://kodi.tv/"
PKG_URL="http://mirrors.kodi.tv/addons/matrix/${PKG_NAME}/${PKG_NAME}-${PKG_VERSION}.zip"
PKG_SOURCE_DIR="$PKG_NAME"
PKG_DEPENDS_TARGET="toolchain Python3 kodi"
PKG_LONGDESC="A CSS selector library"
PKG_TOOLCHAIN="manual"

post_install() {
  mkdir -p ${INSTALL}/usr/share/kodi/addons/${PKG_NAME}
    cp -PR ${PKG_BUILD}/* ${INSTALL}/usr/share/kodi/addons/${PKG_NAME}

  rm ${INSTALL}/usr/share/kodi/addons/${PKG_NAME}/LICENSE.md
  rm ${INSTALL}/usr/share/kodi/addons/${PKG_NAME}/README.md

  python_compile ${INSTALL}/usr/share/kodi/addons/${PKG_NAME}/lib/
}
