# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="script.module.uritemplate"
PKG_VERSION="3.0.1+matrix.2"
PKG_SHA256="c3d83995a59b74789f05886173c928d4a470ca76eb02cce2cf93cd0f285015e1"
PKG_LICENSE="GPL"
PKG_SITE="https://kodi.tv/"
PKG_URL="https://ftp.up.pt/pub/kodi/addons/nexus/${PKG_NAME}/${PKG_NAME}-${PKG_VERSION}.zip"
PKG_SOURCE_DIR="$PKG_NAME"
PKG_DEPENDS_TARGET="toolchain Python3 kodi"
PKG_LONGDESC="URItemplates python module"
PKG_TOOLCHAIN="manual"

post_install() {
  mkdir -p ${INSTALL}/usr/share/kodi/addons/${PKG_NAME}
    cp -PR ${PKG_BUILD}/* ${INSTALL}/usr/share/kodi/addons/${PKG_NAME}

  rm ${INSTALL}/usr/share/kodi/addons/${PKG_NAME}/LICENSE
  rm ${INSTALL}/usr/share/kodi/addons/${PKG_NAME}/LICENSE.APACHE
  rm ${INSTALL}/usr/share/kodi/addons/${PKG_NAME}/LICENSE.BSD
  rm ${INSTALL}/usr/share/kodi/addons/${PKG_NAME}/README.rst

  python_compile ${INSTALL}/usr/share/kodi/addons/${PKG_NAME}/lib/
}
