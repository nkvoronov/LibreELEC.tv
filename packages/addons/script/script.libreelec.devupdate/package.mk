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
PKG_URL="https://github.com/nkvoronov/$PKG_NAME.git"
PKG_TYPE="git"
PKG_DEPENDS_TARGET="toolchain Python kodi script.module.beautifulsoup4 script.module.requests script.module.html2text script.xbmcbackup"
PKG_SECTION=""
PKG_SHORTDESC="Unofficial LibreELEC updater"
PKG_LONGDESC="Unofficial LibreELEC updater"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

make_target() {
  : # nothing
}

makeinstall_target() {
  : # nothing
}

post_install() {
  mkdir -p $INSTALL/usr/share/kodi/addons/$PKG_NAME
    cp -PR $PKG_BUILD/* $INSTALL/usr/share/kodi/addons/$PKG_NAME

  rm $INSTALL/usr/share/kodi/addons/$PKG_NAME/README.md
  rm $INSTALL/usr/share/kodi/addons/$PKG_NAME/LICENSE.txt

  python -Wi -t -B $TOOLCHAIN/lib/python2.7/compileall.py $INSTALL/usr/share/kodi/addons/$PKG_NAME/resources/lib/ -f
  rm -rf `find $INSTALL/usr/share/kodi/addons/$PKG_NAME/resources/lib/ -name "*.py"`
}
