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

PKG_NAME="tvheadend-addon"
PKG_VERSION="4.1.2278"
PKG_REV="144"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.tvheadend.org"
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain tvheadend"
PKG_SECTION="service"
PKG_SHORTDESC="tvheadend (Version: $PKG_VERSION): a TV streaming server for Linux supporting DVB-S, DVB-S2, DVB-C, DVB-T, ATSC, IPTV, and Analog video (V4L) as input sources."
PKG_LONGDESC="Tvheadend (Version: $PKG_VERSION) is a TV streaming server for Linux supporting DVB-S, DVB-S2, DVB-C, DVB-T, ATSC, IPTV, and Analog video (V4L) as input sources. It also comes with a powerful and easy to use web interface both used for configuration and day-to-day operations, such as searching the EPG and scheduling recordings. Even so, the most notable feature of Tvheadend is how easy it is to set up: Install it, navigate to the web user interface, drill into the TV adapters tab, select your current location and Tvheadend will start scanning channels and present them to you in just a few minutes. If installing as an Addon a reboot is needed"
PKG_IS_ADDON="yes"
PKG_ADDON_TYPE="xbmc.service"
PKG_AUTORECONF="no"
PKG_ADDON_REPOVERSION="8.0"

make_target() {
  : # nothing to do here
}

makeinstall_target() {
  : # nothing to do here
}

addon() {
  TVHEADEND_DIR=$(get_build_dir tvheadend)

  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/bin
    cp -P $TVHEADEND_DIR/build.linux/tvheadend $ADDON_BUILD/$PKG_ADDON_ID/bin
    cp -P $TVHEADEND_DIR/capmt_ca.so $ADDON_BUILD/$PKG_ADDON_ID/bin
}
