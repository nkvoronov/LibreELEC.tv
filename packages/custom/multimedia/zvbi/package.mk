################################################################################
#      This file is part of OpenELEC - http://www.openelec.tv
#      Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
#
#  This Program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2, or (at your option)
#  any later version.
#
#  This Program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with OpenELEC.tv; see the file COPYING.  If not, write to
#  the Free Software Foundation, 51 Franklin Street, Suite 500, Boston, MA 02110, USA.
#  http://www.gnu.org/copyleft/gpl.html
################################################################################

PKG_NAME="zvbi"
PKG_VERSION="0.2.35"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://zapping.sourceforge.net/ZVBI/index.html"
PKG_URL="$DISTRO_CUSTOM_SRC/$PKG_NAME/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="toolchain libpng"
PKG_PRIORITY="optional"
PKG_SECTION="custom/multimedia"
PKG_SHORTDESC="Vertical Blanking Interval decoder (VBI)"
PKG_LONGDESC="The VBI devices capture the hidden lines on a television picture that carry further information like closed-caption data, Teletext (primarily in Europe), and now Intercast and the ATVEC Internet television encodings."

PKG_IS_ADDON="no"
PKG_AUTORECONF="yes"

PKG_CONFIGURE_OPTS_TARGET="--enable-static --disable-shared"

post_makeinstall_target() {
  rm -rf $INSTALL/usr/bin
  rm -rf $INSTALL/usr/sbin
}
