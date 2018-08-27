# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="libgme"
PKG_VERSION="0.6.1"
#PKG_SHA256="9ba8b04bdb13f7860a2041768ac83b47b397a36549c71c530b94028a3cfd5b51"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://acoustid.org/chromaprint"
PKG_URL="https://bitbucket.org/mpyne/game-music-emu/downloads/game-music-emu-$PKG_VERSION.tar.bz2"
PKG_SOURCE_DIR="game-music-emu-$PKG_VERSION"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="devel"
PKG_SHORTDESC="Video game music file emulation/playback library"
PKG_LONGDESC="Video game music file emulation/playback library"

PKG_CMAKE_SCRIPT_TARGET="$PKG_BUILD/CMakeLists.txt"

PKG_CMAKE_OPTS_TARGET="-DCMAKE_INSTALL_PREFIX=/usr"

