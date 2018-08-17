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

PKG_NAME="chromaprint"
PKG_VERSION="1.3.2"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://acoustid.org/chromaprint"
PKG_URL="https://bitbucket.org/acoustid/chromaprint/downloads/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="audio"
PKG_SHORTDESC="Audio fingerprinting library"
PKG_LONGDESC="Chromaprint is a library for calculating audio fingerprints which are used by the Acoustid service. Its main purpose is to provide an accurate identifier for record tracks"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

configure_target() {
  cmake -DCMAKE_TOOLCHAIN_FILE=$CMAKE_CONF \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_EXAMPLES=ON \
        ..
}

post_makeinstall_target() {
  rm -rf $INSTALL/usr/bin
}
