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

PKG_NAME="librsvg"
PKG_VERSION="2.40.9"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://live.gnome.org/LibRsvg"
PKG_URL="http://ftp.gnome.org/pub/GNOME/sources/${PKG_NAME}/${PKG_VERSION:0:4}/${PKG_NAME}-${PKG_VERSION}.tar.xz"
PKG_DEPENDS_TARGET="toolchain cairo pango gdk-pixbuf libcroco"
PKG_SECTION="graphics"
PKG_SHORTDESC="librsvg is a free software SVG rendering library written as part of the GNOME project, intended to be lightweight and portable."
PKG_LONGDESC="librsvg is a free software SVG rendering library written as part of the GNOME project, intended to be lightweight and portable."
PKG_IS_ADDON="no"
PKG_AUTORECONF="yes"

PKG_CONFIGURE_OPTS_TARGET="--enable-introspection=no --disable-gtk-doc"

pre_configure_target() {
  export GDK_PIXBUF_QUERYLOADERS=$SYSROOT_PREFIX/usr/bin
}