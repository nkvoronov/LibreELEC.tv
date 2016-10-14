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

PKG_NAME="glibmm"
PKG_VERSION="2.39.93"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://developer.gnome.org/glibmm/stable/"
PKG_URL="$DISTRO_CUSTOM_SRC/$PKG_NAME/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="toolchain libsigc++"
PKG_SECTION="devel"
PKG_SHORTDESC="glibmm is the official C++ interface for the popular cross-platform library Glib. It provides non-UI API that is not available in standard C++ and makes it possible for gtkmm to wrap GObject-based APIs. See also the Programming with gtkmm book for a tutorial on programming with gtkmm and glibmm."
PKG_LONGDESC="glibmm is the official C++ interface for the popular cross-platform library Glib. It provides non-UI API that is not available in standard C++ and makes it possible for gtkmm to wrap GObject-based APIs. See also the Programming with gtkmm book for a tutorial on programming with gtkmm and glibmm."

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"


