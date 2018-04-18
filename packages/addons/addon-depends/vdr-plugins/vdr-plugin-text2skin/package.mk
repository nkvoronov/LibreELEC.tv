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

PKG_NAME="vdr-plugin-text2skin"
PKG_VERSION="8f7954d"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://projects.vdr-developer.org/projects/plg-text2skin"
PKG_URL="https://github.com/vdr-projects/vdr-plugin-text2skin.git"
PKG_TYPE="git"
PKG_DEPENDS_TARGET="toolchain vdr ImageMagick"
PKG_SECTION="multimedia"
PKG_SHORTDESC="vdr text2skin"
PKG_LONGDESC="vdr text2skin"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

IMAGELIB=imagemagick

pre_configure_target() {
  export CFLAGS="$CFLAGS -fPIC"
  export CXXFLAGS="$CXXFLAGS -fPIC"
  export LDFLAGS="$LDFLAGS -fPIC"
}

make_target() {
  VDR_DIR=$(get_build_dir vdr)
  make VDRDIR=$VDR_DIR \
  LIBDIR="." \
  LOCALEDIR="./locale" \
  IMAGELIB=$IMAGELIB
}

makeinstall_target() {
  : # installation not needed, done by create-addon script
}