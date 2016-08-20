################################################################################
#      This file is part of OpenELEC - http://www.openelec.tv
#      Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
#
#  OpenELEC is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 2 of the License, or
#  (at your option) any later version.
#
#  OpenELEC is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with OpenELEC.  If not, see <http://www.gnu.org/licenses/>.
################################################################################

PKG_NAME="x265"
PKG_VERSION="1.9"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPLv2+"
PKG_SITE="https://bitbucket.org/multicoreware/x265/"
#PKG_URL="http://download.videolan.org/contrib/x265/$PKG_NAME-$PKG_VERSION.tar.bz2"
PKG_URL="$DISTRO_CUSTOM_SRC/$PKG_NAME/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="toolchain yasm:host"
PKG_PRIORITY="optional"
PKG_SECTION="multimedia"
PKG_SHORTDESC="x265 is an open source free software and library for encoding video using the High Efficiency Video Coding (HEVC/H.265) standard."
PKG_LONGDESC="x265 is an open source free software and library for encoding video using the High Efficiency Video Coding (HEVC/H.265) standard."

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

pre_configure_target() {
  cd ./build/linux
}

configure_target() {
  cmake \
	-G "Unix Makefiles" \
	-DCMAKE_INSTALL_PREFIX="/usr" \
	-DCMAKE_C_FLAGS="$CFLAGS" \
	-DCMAKE_CXX_FLAGS="$CXXFLAGS" \
	-DENABLE_SHARED=OFF \
	-DENABLE_STATIC=ON \
	-DENABLE_CLI=OFF \
	../../source
}
