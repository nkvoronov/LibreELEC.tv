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

PKG_NAME="libmatroska"
PKG_VERSION="1.4.8"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.matroska.org"
PKG_URL="https://dl.matroska.org/downloads/libmatroska/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="toolchain libebml"
PKG_SECTION="multimedia"
PKG_SHORTDESC="Matroska is aiming to become the standard of Multimedia Container Formats one day. It is based on EBML (Extensible Binary Meta Language), a kind of binary version of XML. This way the significant advantages in terms of future format extensibility are gained without breaking file support in old parsers."
PKG_LONGDESC="Matroska is aiming to become the standard of Multimedia Container Formats one day. It is based on EBML (Extensible Binary Meta Language), a kind of binary version of XML. This way the significant advantages in terms of future format extensibility are gained without breaking file support in old parsers."

PKG_IS_ADDON="no"
PKG_AUTORECONF="yes"

PKG_CONFIGURE_OPTS_TARGET="--prefix=/usr --disable-static"
