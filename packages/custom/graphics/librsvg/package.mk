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

PKG_NAME="librsvg"
PKG_VERSION="2.40.9"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://live.gnome.org/LibRsvg"
PKG_URL="$DISTRO_CUSTOM_SRC/$PKG_NAME/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="toolchain cairo pango gdk-pixbuf libcroco"
PKG_PRIORITY="optional"
PKG_SECTION="custom/graphics"
PKG_SHORTDESC="librsvg is a free software SVG rendering library written as part of the GNOME project, intended to be lightweight and portable."
PKG_LONGDESC="librsvg is a free software SVG rendering library written as part of the GNOME project, intended to be lightweight and portable."
PKG_IS_ADDON="no"
PKG_AUTORECONF="yes"

PKG_CONFIGURE_OPTS_TARGET="--enable-introspection=no --disable-gtk-doc"

pre_configure_target() {
  export GDK_PIXBUF_QUERYLOADERS=$SYSROOT_PREFIX/usr/bin
}