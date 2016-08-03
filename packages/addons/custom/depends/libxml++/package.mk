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

PKG_NAME="libxml++"
PKG_VERSION="2.36.0"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://libxmlplusplus.sourceforge.net/"
PKG_URL="$DISTRO_CUSTOM_SRC/$PKG_NAME/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="toolchain glibmm"
PKG_PRIORITY="optional"
PKG_SECTION="devel"
PKG_SHORTDESC="libxml++ is a C++ wrapper for the libxml2 XML parser and builder library. It presents a simple C++-like API that can achieve common tasks with less code."
PKG_LONGDESC="libxml++ is a C++ wrapper for the libxml2 XML parser and builder library. It presents a simple C++-like API that can achieve common tasks with less code."

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"
