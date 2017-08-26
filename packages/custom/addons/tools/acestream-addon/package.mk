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

PKG_NAME="acestream-addon"
PKG_VERSION="3.0.3"
PKG_REV="3"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://wiki.acestream.org/wiki/index.php/AceStream_3.0"
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain acestream-engine"
PKG_SECTION="tools"
PKG_SHORTDESC="acestream (Version: $PKG_VERSION): This is an innovative media platform of a new generation, which will take you to a new high-quality level of multimedia space on the Internet."
PKG_LONGDESC="acestream (Version: $PKG_VERSION): This is an innovative media platform of a new generation, which will take you to a new high-quality level of multimedia space on the Internet."
PKG_AUTORECONF="no"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="ACEStream"
PKG_ADDON_TYPE="xbmc.python.script"

make_target() {
  : # nothing to make here
}

makeinstall_target() {
  : # nothing to install here
}

addon() {
  ACESTREAM_DIR=$(get_build_dir acestream-engine)

  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/share
  if [ "$PROJECT" = "Generic" ]; then
    cp -PR $ACESTREAM_DIR/$TARGET_ARCH/acestream/* $ADDON_BUILD/$PKG_ADDON_ID/share
  elif [ "$PROJECT" = "RPi" ]; then
    cp -PR $ACESTREAM_DIR/arm/RPi/acestream/* $ADDON_BUILD/$PKG_ADDON_ID/share
  elif [ "$PROJECT" = "imx6" ]; then
    cp -PR $ACESTREAM_DIR/arm/v7/acestream/* $ADDON_BUILD/$PKG_ADDON_ID/share
  fi

}
