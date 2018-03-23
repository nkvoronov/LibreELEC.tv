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

PKG_NAME="libmicrodns"
PKG_VERSION="0.0.10"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/videolabs/libmicrodns"
PKG_URL="https://github.com/videolabs/libmicrodns/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain glibc"
PKG_SECTION="devel"
PKG_SHORTDESC="Minimal mDNS resolver library"

PKG_IS_ADDON="no"
PKG_AUTORECONF="yes"

PKG_CONFIGURE_OPTS_TARGET="--prefix=/usr"

post_makeinstall_target() {
  rm -rf $INSTALL/usr/bin
}