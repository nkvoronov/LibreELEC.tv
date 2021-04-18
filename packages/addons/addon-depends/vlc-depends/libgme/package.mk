# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="libgme"
PKG_VERSION="0.6.3"
PKG_SHA256="aba34e53ef0ec6a34b58b84e28bf8cfbccee6585cebca25333604c35db3e051d"
PKG_LICENSE="GPL"
PKG_SITE="https://acoustid.org/chromaprint"
PKG_URL="https://bitbucket.org/mpyne/game-music-emu/downloads/game-music-emu-${PKG_VERSION}.tar.xz"
PKG_SOURCE_DIR="game-music-emu-${PKG_VERSION}"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="Video game music file emulation/playback library"

PKG_CMAKE_SCRIPT_TARGET="${PKG_BUILD}/CMakeLists.txt"
PKG_CMAKE_OPTS_TARGET="-DCMAKE_INSTALL_PREFIX=/usr"

