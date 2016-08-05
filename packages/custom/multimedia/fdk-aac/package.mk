################################################################################
#      This file is part of OpenELEC - http://www.openelec.tv
#      Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
#      Copyright (C) 2014 Stefan Benz (benz.st@gmail.com)
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

PKG_NAME="fdk-aac"
PKG_VERSION="0.1.4"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="fdk-aac license"
PKG_SITE="http://sourceforge.net/projects/opencore-amr/"
PKG_URL="http://downloads.sourceforge.net/project/opencore-amr/fdk-aac/${PKG_NAME}-${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_PRIORITY="optional"
PKG_SECTION="multimedia"
PKG_SHORTDESC="Modified library of Fraunhofer AAC decoder and encoder."
PKG_LONGDESC="Modified library of Fraunhofer AAC decoder and encoder."

PKG_IS_ADDON="no"
PKG_AUTORECONF="yes"

PKG_CONFIGURE_OPTS_TARGET="--disable-shared --enable-static"

pre_configure_target() {

  export CFLAGS="$CFLAGS -fPIC -DPIC"
  export CXXFLAGS="$CXXFLAGS -fPIC -DPIC"
  export LDFLAGS="$LDFLAGS -fPIC -DPIC"

# ffmpeg fails building with LTO support
  strip_lto

# ffmpeg fails running with GOLD support
  strip_gold
}
