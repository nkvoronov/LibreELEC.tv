# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="script.module.yaml"
PKG_VERSION="5.3.0+matrix.2"
#PKG_SHA256="e2fcbabc75df6953c8491988497a8afc4ba5d09730d30932b3f1d1057ef58d92"
PKG_LICENSE="GPL"
PKG_SITE="https://kodi.tv/"
PKG_URL="http://mirrors.kodi.tv/addons/matrix/${PKG_NAME}/${PKG_NAME}-${PKG_VERSION}.zip"
PKG_SOURCE_DIR="${PKG_NAME}"
PKG_DEPENDS_TARGET="toolchain Python3 kodi"
PKG_LONGDESC="PyYaml library"
PKG_TOOLCHAIN="manual"

post_install() {
  mkdir -p ${INSTALL}/usr/share/kodi/addons/${PKG_NAME}
    cp -PR ${PKG_BUILD}/* ${INSTALL}/usr/share/kodi/addons/${PKG_NAME}

  rm ${INSTALL}/usr/share/kodi/addons/${PKG_NAME}/README.md
  rm ${INSTALL}/usr/share/kodi/addons/${PKG_NAME}/LICENSE

  python_compile ${INSTALL}/usr/share/kodi/addons/${PKG_NAME}/lib/
}
