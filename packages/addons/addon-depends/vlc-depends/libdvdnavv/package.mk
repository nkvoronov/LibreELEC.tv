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

PKG_NAME="libdvdnavv"
PKG_VERSION="6.0.0"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://www.videolan.org/developers/libdvdnav.html"
PKG_URL="https://download.videolan.org/videolan/libdvdnav/$PKG_VERSION/libdvdnav-$PKG_VERSION.tar.bz2"
PKG_SOURCE_DIR="libdvdnav-$PKG_VERSION"
PKG_DEPENDS_TARGET="toolchain libdvdreadv"
PKG_SECTION="devel"
PKG_SHORTDESC="The library for xine-dvdnav plugin."
PKG_LONGDESC="The library for xine-dvdnav plugin."

PKG_IS_ADDON="no"
PKG_AUTORECONF="yes"

PKG_CONFIGURE_OPTS_TARGET="--prefix=/usr"

