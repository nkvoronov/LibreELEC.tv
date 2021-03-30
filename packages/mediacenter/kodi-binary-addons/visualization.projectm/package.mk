# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="visualization.projectm"
PKG_VERSION="3.3.0-Matrix"
PKG_SHA256="668f5d71e6cf2e373084d4420b3405ff9701796ca94df6bd18e921e14c33a683"
PKG_REV="4"
PKG_ARCH="x86_64"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/xbmc/visualization.projectm"
PKG_URL="https://github.com/xbmc/visualization.projectm/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain kodi-platform libprojectM"
PKG_SECTION=""
PKG_SHORTDESC="visualization.projectm"
PKG_LONGDESC="visualization.projectm"

PKG_IS_ADDON="yes"
PKG_ADDON_TYPE="xbmc.player.musicviz"

if [ "${OPENGL}" = "no" ]; then
  exit 0
fi

pre_configure_target() {
  export LDFLAGS=$(echo ${LDFLAGS} | sed -e "s|-Wl,--as-needed||")
}
