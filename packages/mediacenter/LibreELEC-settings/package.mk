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

PKG_NAME="LibreELEC-settings"
PKG_VERSION="12c5f24"
PKG_ARCH="any"
PKG_LICENSE="prop."
PKG_SITE="https://libreelec.tv"
PKG_URL="https://github.com/LibreELEC/service.libreelec.settings/archive/$PKG_VERSION.tar.gz"
PKG_SOURCE_DIR="service.libreelec.settings-$PKG_VERSION*"
PKG_DEPENDS_TARGET="toolchain Python connman pygobject dbus-python"
PKG_SECTION=""
PKG_SHORTDESC="LibreELEC-settings: Settings dialog for LibreELEC"
PKG_LONGDESC="LibreELEC-settings: is a settings dialog for LibreELEC"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

PKG_MAKE_OPTS_TARGET="DISTRONAME=$DISTRONAME ROOT_PASSWORD=$ROOT_PASSWORD"

if [ "$DISPLAYSERVER" = "x11" ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET setxkbmap"
else
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET bkeymaps"
fi

post_unpack() {
  if [ "$CUSTOM_SUPPORT" = "yes" ]; then
    for patch in `ls $PKG_DIR/patches.upstream/*.patch`; do
      cat $patch | patch -d \
      `echo $BUILD/$PKG_NAME-$PKG_VERSION | cut -f1 -d\ ` -p1
    done
  fi
}

post_makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libreelec
    cp $PKG_DIR/scripts/* $INSTALL/usr/lib/libreelec

#  # bluetooth is optional
#    if [ ! "$BLUETOOTH_SUPPORT" = yes ]; then
#      rm -f resources/lib/modules/bluetooth.py
#    fi

  python -Wi -t -B $TOOLCHAIN/lib/python2.7/compileall.py $INSTALL/usr/share/kodi/addons/service.libreelec.settings/resources/lib/ -f
  rm -rf `find $INSTALL/usr/share/kodi/addons/service.libreelec.settings/resources/lib/ -name "*.py"`

  python -Wi -t -B $TOOLCHAIN/lib/python2.7/compileall.py $INSTALL/usr/share/kodi/addons/service.libreelec.settings/oe.py -f
  rm -rf $INSTALL/usr/share/kodi/addons/service.libreelec.settings/oe.py
}

post_install() {
  enable_service backup-restore.service
  enable_service factory-reset.service
}
