# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="libgme"
PKG_VERSION="0.6.2"
PKG_SHA256="5046cb471d422dbe948b5f5dd4e5552aaef52a0899c4b2688e5a68a556af7342"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://acoustid.org/chromaprint"
PKG_URL="https://bitbucket.org/mpyne/game-music-emu/downloads/game-music-emu-$PKG_VERSION.tar.xz"
PKG_SOURCE_DIR="game-music-emu-$PKG_VERSION"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="devel"
PKG_SHORTDESC="Video game music file emulation/playback library"
PKG_LONGDESC="Video game music file emulation/playback library"

PKG_CMAKE_SCRIPT_TARGET="$PKG_BUILD/CMakeLists.txt"
PKG_CMAKE_OPTS_TARGET="-DCMAKE_INSTALL_PREFIX=/usr"

