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

PKG_NAME="libxml++"
PKG_VERSION="2.40.1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://libxmlplusplus.sourceforge.net/"
PKG_URL="http://ftp.gnome.org/pub/GNOME/sources/${PKG_NAME}/${PKG_VERSION:0:4}/${PKG_NAME}-${PKG_VERSION}.tar.xz"
PKG_DEPENDS_TARGET="toolchain glibmm"
PKG_SECTION="devel"
PKG_SHORTDESC="libxml++ is a C++ wrapper for the libxml2 XML parser and builder library. It presents a simple C++-like API that can achieve common tasks with less code."
PKG_LONGDESC="libxml++ is a C++ wrapper for the libxml2 XML parser and builder library. It presents a simple C++-like API that can achieve common tasks with less code."

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"
