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

PKG_NAME="vdr-plugin-menuorg"
PKG_VERSION="2032189"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://projects.vdr-developer.org/git/vdr-plugin-menuorg.git"
PKG_URL="https://github.com/vdr-projects/vdr-plugin-menuorg.git"
PKG_TYPE="git"
PKG_DEPENDS_TARGET="toolchain vdr glibmm libxml++"
PKG_SECTION="multimedia"
PKG_SHORTDESC="vdr menuorg"
PKG_LONGDESC="vdr menuorg"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

pre_configure_target() {
  export CFLAGS="$CFLAGS -fPIC"
  export CXXFLAGS="$CXXFLAGS -fPIC"
  export LDFLAGS="$LDFLAGS -fPIC"
}

make_target() {
  VDR_DIR=$(get_build_dir vdr)
  make VDRDIR=$VDR_DIR \
  LIBDIR="." \
  LOCALEDIR="./locale"
}

makeinstall_target() {
  : # installation not needed, done by create-addon script
}