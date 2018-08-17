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

PKG_NAME="a52dec"
PKG_VERSION="0.7.4"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://liba52.sourceforge.net"
PKG_URL="http://download.videolan.org/contrib/a52/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="multimedia"
PKG_SHORTDESC="library for decoding ATSC A/52 streams liba52 is a free library for decoding ATSC A/52 streams. The A/52 standard is used in a variety of applications, including digital television and DVD. It is also known as AC-3."
PKG_LONGDESC="library for decoding ATSC A/52 streams liba52 is a free library for decoding ATSC A/52 streams. The A/52 standard is used in a variety of applications, including digital television and DVD. It is also known as AC-3."

PKG_IS_ADDON="no"
PKG_AUTORECONF="yes"

PKG_CONFIGURE_OPTS_TARGET="--disable-shared --enable-static"

post_makeinstall_target() {
  rm -rf $INSTALL/usr/bin
}
