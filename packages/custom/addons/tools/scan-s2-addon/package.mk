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

PKG_NAME="scan-s2-addon"
PKG_VERSION="5.10"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://bitbucket.org/CrazyCat/scan-s2"
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain scan-s2"
PKG_SECTION="tools"
PKG_SHORTDESC="scan-s2"
PKG_LONGDESC="scan-s2"
PKG_AUTORECONF="no"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="Scan S2"
PKG_ADDON_TYPE="xbmc.python.script"

make_target() {
  : # nothing to make here
}

makeinstall_target() {
  : # nothing to install here
}

addon() {
  SCANS2_DIR=$(get_build_dir scan-s2)

  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/bin
    cp -PR $SCANS2_DIR/scan-s2 $ADDON_BUILD/$PKG_ADDON_ID/bin
  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/share
    cp -PR $SCANS2_DIR/atsc $ADDON_BUILD/$PKG_ADDON_ID/share
    cp -PR $SCANS2_DIR/dvb-c $ADDON_BUILD/$PKG_ADDON_ID/share
    cp -PR $SCANS2_DIR/dvb-s $ADDON_BUILD/$PKG_ADDON_ID/share
    cp -PR $SCANS2_DIR/dvb-t $ADDON_BUILD/$PKG_ADDON_ID/share
}
