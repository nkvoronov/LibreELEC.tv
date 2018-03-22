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

PKG_NAME="script.libreelec.devupdate"
PKG_VERSION="a911ba1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE=""
PKG_URL="https://github.com/nkvoronov/script.libreelec.devupdate.git"
PKG_TYPE="git"
PKG_DEPENDS_TARGET="toolchain Python kodi"
PKG_SECTION=""
PKG_SHORTDESC="YLLOW_DRAGON addons repository for KODI."
PKG_LONGDESC="YLLOW_DRAGON addons repository for KODI."

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

make_target() {
  : # nothing
}

makeinstall_target() {
  : # nothing
}

post_install() {
  mkdir -p $INSTALL/usr/share/kodi/addons/script.libreelec.devupdate
    cp -PR $PKG_BUILD/* $INSTALL/usr/share/kodi/addons/script.libreelec.devupdate

  rm $INSTALL/usr/share/kodi/addons/script.libreelec.devupdate/README.md
  rm $INSTALL/usr/share/kodi/addons/script.libreelec.devupdate/LICENSE.txt

  python -Wi -t -B $TOOLCHAIN/lib/python2.7/compileall.py $INSTALL/usr/share/kodi/addons/script.libreelec.devupdate/resources/lib/ -f
  rm -rf `find $INSTALL/usr/share/kodi/addons/script.libreelec.devupdate/resources/lib/ -name "*.py"`
}
