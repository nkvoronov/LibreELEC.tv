# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="game.libretro.beetle-saturn"
PKG_VERSION="1.22.2.13-Matrix"
PKG_SHA256="5ea0566d82101c772efc690cbafde8008154d8644437e65aa2f1fc44840f95c0"
PKG_REV="1"
# no openGL suport in retroplayer yet
PKG_ARCH="none"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/kodi-game/game.libretro.beetle-saturn"
PKG_URL="https://github.com/kodi-game/game.libretro.beetle-saturn/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain kodi-platform libretro-beetle-saturn"
PKG_SECTION=""
PKG_LONGDESC="game.libretro.beetle-saturn: beetle-saturn for Kodi"

PKG_IS_ADDON="yes"
PKG_ADDON_TYPE="kodi.gameclient"
