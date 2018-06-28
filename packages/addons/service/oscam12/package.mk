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

PKG_NAME="oscam12"
PKG_VERSION="11425"
PKG_REV="132"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.streamboard.tv/oscam/wiki"
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain oscam pcsc-lite"
PKG_SECTION="service"
PKG_SHORTDESC="oscam (Version: $PKG_VERSION): OSCam is Open Source Conditional Access Modul."
PKG_LONGDESC="oscam (Version: $PKG_VERSION): OSCam is Open Source Conditional Access Modul."
PKG_DISCLAIMER="using oscam may be illegal in your country. if in doubt, do not install"

PKG_AUTORECONF="no"
PKG_IS_ADDON="yes"

PKG_ADDON_NAME="OSCam"
PKG_ADDON_TYPE="xbmc.service"

make_target() {
  : # nothing to do here
}

makeinstall_target() {
  : # nothing to do here
}

addon() {
  OSCAM_DIR=$(get_build_dir oscam)
  PCSCLITE_DIR=$(get_build_dir pcsc-lite)

  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/bin
    cp -P $OSCAM_DIR/.$TARGET_NAME/oscam $ADDON_BUILD/$PKG_ADDON_ID/bin
    cp -P $OSCAM_DIR/.$TARGET_NAME/utils/list_smargo $ADDON_BUILD/$PKG_ADDON_ID/bin

  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/lib
    cp -P $PCSCLITE_DIR/.install_pkg/usr/lib/libpcsclite.so.1.0.0 $ADDON_BUILD/$PKG_ADDON_ID/lib/libpcsclite.so.1
}