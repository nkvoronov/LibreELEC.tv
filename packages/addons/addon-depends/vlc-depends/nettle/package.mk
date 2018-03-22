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

PKG_NAME="nettle"
PKG_VERSION="3.1.1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.lysator.liu.se/~nisse/nettle"
PKG_URL="https://ftp.gnu.org/gnu/nettle/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="devel"
PKG_SHORTDESC="The Nettle package contains the low-level cryptographic library that is designed to fit easily in many contexts."
PKG_LONGDESC="The Nettle package contains the low-level cryptographic library that is designed to fit easily in many contexts."

PKG_IS_ADDON="no"
PKG_AUTORECONF="yes"

PKG_CONFIGURE_OPTS_TARGET="--enable-static --disable-shared --enable-mini-gmp"

post_makeinstall_target() {
  rm -rf $INSTALL/usr/bin
}