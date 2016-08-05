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

PKG_NAME="tvheadend-service"
PKG_VERSION="4.1.2141"
PKG_REV="134"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.tvheadend.org"
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain tvheadend"
PKG_PRIORITY="optional"
PKG_SECTION="service"
PKG_SHORTDESC="tvheadend service: a TV streaming server for Linux supporting DVB-S, DVB-S2, DVB-C, DVB-T, ATSC, IPTV, and Analog video (V4L) as input sources."
PKG_LONGDESC="Tvheadend service: $PKG_VERSION) is a TV streaming server for Linux supporting DVB-S, DVB-S2, DVB-C, DVB-T, ATSC, IPTV, and Analog video (V4L) as input sources. It also comes with a powerful and easy to use web interface both used for configuration and day-to-day operations, such as searching the EPG and scheduling recordings. Even so, the most notable feature of Tvheadend is how easy it is to set up: Install it, navigate to the web user interface, drill into the TV adapters tab, select your current location and Tvheadend will start scanning channels and present them to you in just a few minutes. If installing as an Addon a reboot is needed"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

make_target() {
  : # nothing to do here
}

makeinstall_target() {
  : # nothing to do here
}

post_install() {
  TVHEADEND_DIR=$(get_build_dir tvheadend)

  mkdir -p $INSTALL/usr/bin
    cp -P $TVHEADEND_DIR/build.linux/tvheadend $INSTALL/usr/bin
    cp -P $PKG_DIR/scripts/* $INSTALL/usr/bin
    cp -P $PKG_DIR/tv_grabs/* $INSTALL/usr/bin

  mkdir -p $INSTALL/usr/lib
    cp -P $TVHEADEND_DIR/capmt_ca.so $INSTALL/usr/lib

  mkdir -p $INSTALL/usr/share/tvheadend
    cp -pR $TVHEADEND_DIR/data $INSTALL/usr/share/tvheadend

  mkdir -p $INSTALL/usr/config/tvheadend
    cp -pR $PKG_DIR/config/* $INSTALL/usr/config/tvheadend

  enable_service tvheadend.service
}
