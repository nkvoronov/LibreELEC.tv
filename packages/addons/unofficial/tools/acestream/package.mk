################################################################################
#      This file is part of OpenELEC - http://www.openelec.tv
#      Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
#
#  This Program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2, or (at your option)
#  any later version.
#
#  This Program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with OpenELEC.tv; see the file COPYING.  If not, write to
#  the Free Software Foundation, 51 Franklin Street, Suite 500, Boston, MA 02110, USA.
#  http://www.gnu.org/copyleft/gpl.html
################################################################################

PKG_NAME="acestream"
PKG_VERSION="3.0.3"
PKG_REV="2"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://wiki.acestream.org/wiki/index.php/AceStream_3.0"
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain acestream-engine"
PKG_PRIORITY="optional"
PKG_SECTION="tools"
PKG_SHORTDESC="acestream (Version: $PKG_VERSION): This is an innovative media platform of a new generation, which will take you to a new high-quality level of multimedia space on the Internet."
PKG_LONGDESC="acestream (Version: $PKG_VERSION): This is an innovative media platform of a new generation, which will take you to a new high-quality level of multimedia space on the Internet."

PKG_IS_ADDON="yes"
PKG_ADDON_TYPE="xbmc.python.script"
PKG_AUTORECONF="no"
PKG_ADDON_REPOVERSION="7.0"

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
