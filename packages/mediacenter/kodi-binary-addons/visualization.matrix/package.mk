# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2020-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="visualization.matrix"
PKG_VERSION="1.0.0-Matrix"
PKG_SHA256="fc5c4790cbf957dbf8d504ae7c43eaeca122fde6423f1135029ff053135f8fd0"
PKG_REV="2"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/xbmc/visualization.matrix"
PKG_URL="https://github.com/xbmc/visualization.matrix/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain kodi-platform glm"
PKG_SECTION=""
PKG_LONGDESC="visualization.matrix"

PKG_IS_ADDON="yes"
PKG_ADDON_TYPE="xbmc.player.musicviz"

if [ ! "${OPENGL}" = "no" ]; then
  # for OpenGL (GLX) support
  PKG_DEPENDS_TARGET+=" ${OPENGL} glew"
fi

if [ "${OPENGLES_SUPPORT}" = yes ]; then
  # for OpenGL-ES support
  PKG_DEPENDS_TARGET+=" ${OPENGLES}"
fi
