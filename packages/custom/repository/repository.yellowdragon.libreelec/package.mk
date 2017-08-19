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

PKG_NAME="repository.yellowdragon.libreelec"
PKG_VERSION="8.2"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE=""
PKG_URL="https://bitbucket.org/nkvoronov/repository.yellowdragon.libreelec/raw/$PKG_VERSION/repo/$PKG_NAME/$PKG_NAME-$PKG_VERSION.zip"
PKG_DEPENDS_TARGET="toolchain Python kodi"
PKG_SECTION="repository"
PKG_SHORTDESC="YLLOW_DRAGON addons repository for LibreELEC."
PKG_LONGDESC="YLLOW_DRAGON addons repository for LibreELEC."

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

unpack() {
  unzip -q $ROOT/$SOURCES/$PKG_NAME/$PKG_NAME-$PKG_VERSION.zip -d $BUILD/$PKG_NAME-$PKG_VERSION
}

make_target() {
  : # nothing
}

makeinstall_target() {
  : # nothing
}

post_install() {
  mkdir -p $INSTALL/usr/share/kodi/addons/repository.yellowdragon.libreelec
    cp -PR $PKG_BUILD/repository.yellowdragon.libreelec/* $INSTALL/usr/share/kodi/addons/repository.yellowdragon.libreelec
}
