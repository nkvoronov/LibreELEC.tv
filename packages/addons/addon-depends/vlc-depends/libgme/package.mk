# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="libgme"
PKG_VERSION="0.6.1"
PKG_SHA256="dc11bea098072d540d4d52dfb252e76fc3d3af67ee2807da48fbd8dbda3fd321"
PKG_LICENSE="GPL"
PKG_SITE="https://acoustid.org/chromaprint"
PKG_URL="https://bitbucket.org/mpyne/game-music-emu/downloads/game-music-emu-$PKG_VERSION.tar.bz2"
PKG_SOURCE_DIR="game-music-emu-$PKG_VERSION"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="Video game music file emulation/playback library"

PKG_CMAKE_SCRIPT_TARGET="$PKG_BUILD/CMakeLists.txt"
PKG_CMAKE_OPTS_TARGET="-DCMAKE_INSTALL_PREFIX=/usr"

