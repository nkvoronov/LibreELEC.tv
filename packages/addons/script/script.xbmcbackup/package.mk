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

PKG_NAME="script.xbmcbackup"
PKG_VERSION="1.1.2"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE=""
PKG_URL="http://mirrors.kodi.tv/addons/krypton/$PKG_NAME/$PKG_NAME-$PKG_VERSION.zip"
PKG_DEPENDS_TARGET="toolchain Python kodi script.module.httplib2 script.module.oauth2client script.module.uritemplate script.module.yaml script.module.googleapi"
PKG_SOURCE_DIR="$PKG_NAME"
PKG_SECTION=""
PKG_SHORTDESC="Backup and restore your XBMC database and configuration files in the event of a crash or file."
PKG_LONGDESC="Backup and restore your XBMC database and configuration files in the event of a crash or file."

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
