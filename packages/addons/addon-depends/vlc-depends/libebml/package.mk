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

PKG_NAME="libebml"
PKG_VERSION="1.3.5"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://dl.matroska.org/downloads/libebml"
PKG_URL="http://dl.matroska.org/downloads/libebml/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="devel"
PKG_SHORTDESC="The libebml library allows one to read and write files using EBML (the Extensible Binary Meta Language), a binary pendant to XML. Using libebml makes it easier to extend a file format without breaking support in older parsers."
PKG_LONGDESC="The libebml library allows one to read and write files using EBML (the Extensible Binary Meta Language), a binary pendant to XML. Using libebml makes it easier to extend a file format without breaking support in older parsers."

PKG_IS_ADDON="no"
PKG_AUTORECONF="yes"

PKG_CONFIGURE_OPTS_TARGET="--prefix=/usr"

