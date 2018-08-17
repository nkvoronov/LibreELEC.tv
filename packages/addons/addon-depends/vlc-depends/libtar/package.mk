################################################################################
#      This file is part of LibreELEC - https://libreelec.tv
#      Copyright (C) 2017-present Team LibreELEC
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

PKG_NAME="libtar"
PKG_VERSION="9c2e044"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://www.libarchive.org"
PKG_URL="https://github.com/tklauser/libtar.git"
PKG_TYPE="git"
PKG_DEPENDS_TARGET="toolchain zlib"
PKG_SECTION="devel"
PKG_SHORTDESC="C library for manipulating POSIX tar files"

PKG_IS_ADDON="no"
PKG_AUTORECONF="yes"

PKG_CONFIGURE_OPTS_TARGET="--prefix=/usr --disable-static --disable-tls --disable-encap --disable-epkg-install"

post_makeinstall_target() {
  rm -rf $INSTALL/usr/bin
}