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

PKG_NAME="zvbi"
PKG_VERSION="0.2.35"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://zapping.sourceforge.net/ZVBI/index.html"
PKG_URL="http://downloads.sourceforge.net/sourceforge/zapping/$PKG_NAME-$PKG_VERSION.tar.bz2"
PKG_DEPENDS_TARGET="toolchain libpng"
PKG_SECTION="multimedia"
PKG_SHORTDESC="Vertical Blanking Interval decoder (VBI)"
PKG_LONGDESC="The VBI devices capture the hidden lines on a television picture that carry further information like closed-caption data, Teletext (primarily in Europe), and now Intercast and the ATVEC Internet television encodings."

PKG_IS_ADDON="no"
PKG_AUTORECONF="yes"

PKG_CONFIGURE_OPTS_TARGET="--enable-static --disable-shared"

post_makeinstall_target() {
  rm -rf $INSTALL/usr/bin
  rm -rf $INSTALL/usr/sbin
}
