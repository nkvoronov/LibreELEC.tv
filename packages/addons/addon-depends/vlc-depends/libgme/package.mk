################################################################################
#      This file is part of LibreELEC - http://www.libreelec.tv
#      Copyright (C) 2016 Team LibreELEC
#
#  LibreELEC is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 2 of the License, or
#  (at your option) any later version.
#
#  LibreELEC is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with LibreELEC.  If not, see <http://www.gnu.org/licenses/>.
################################################################################

PKG_NAME="libgme"
PKG_VERSION="0.6.1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://acoustid.org/chromaprint"
PKG_URL="https://bitbucket.org/mpyne/game-music-emu/downloads/game-music-emu-$PKG_VERSION.tar.bz2"
PKG_SOURCE_DIR="game-music-emu-$PKG_VERSION"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="devel"
PKG_SHORTDESC="Video game music file emulation/playback library"
PKG_LONGDESC="Video game music file emulation/playback library"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

PKG_CMAKE_SCRIPT_TARGET="$PKG_BUILD/CMakeLists.txt"

PKG_CMAKE_OPTS_TARGET="-DCMAKE_INSTALL_PREFIX=/usr"

