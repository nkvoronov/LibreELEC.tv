# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="screensaver.pyro"
PKG_VERSION="3.3.0-Matrix"
PKG_SHA256="83a3375166d6aaed01939bc370981ad46909fe1f1365fe7af22d4614fa6d06e6"
PKG_REV="4"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/xbmc/screensaver.pyro"
PKG_URL="https://github.com/xbmc/screensaver.pyro/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain kodi-platform"
PKG_SECTION=""
PKG_SHORTDESC="screensaver.pyro"
PKG_LONGDESC="screensaver.pyro"

PKG_IS_ADDON="yes"
PKG_ADDON_TYPE="xbmc.ui.screensaver"

if [ "${OPENGL}" = "no" ]; then
  exit 0
fi
