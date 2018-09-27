# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="tvheadend43"
PKG_VERSION="4.3.1387"
PKG_REV="229"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.tvheadend.org"
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain tvheadend"
PKG_SECTION="service"
PKG_SHORTDESC="tvheadend (Version: $PKG_VERSION): a TV streaming server for Linux supporting DVB-S, DVB-S2, DVB-C, DVB-T, ATSC, IPTV, and Analog video (V4L) as input sources."
PKG_LONGDESC="Tvheadend (Version: $PKG_VERSION) is a TV streaming server for Linux supporting DVB-S, DVB-S2, DVB-C, DVB-T, ATSC, IPTV, and Analog video (V4L) as input sources. It also comes with a powerful and easy to use web interface both used for configuration and day-to-day operations, such as searching the EPG and scheduling recordings. Even so, the most notable feature of Tvheadend is how easy it is to set up: Install it, navigate to the web user interface, drill into the TV adapters tab, select your current location and Tvheadend will start scanning channels and present them to you in just a few minutes. If installing as an Addon a reboot is needed"
PKG_TOOLCHAIN="manual"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="Tvheadend 4.3"
PKG_ADDON_TYPE="xbmc.service"

addon() {
  TVHEADEND_DIR=$(get_build_dir tvheadend)

  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/bin
    cp -P $TVHEADEND_DIR/build.linux/tvheadend $ADDON_BUILD/$PKG_ADDON_ID/bin
    cp -P $TVHEADEND_DIR/capmt_ca.so $ADDON_BUILD/$PKG_ADDON_ID/bin
}