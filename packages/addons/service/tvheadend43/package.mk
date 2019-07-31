# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="tvheadend43"
PKG_VERSION="4.3.1803"
PKG_REV="259"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.tvheadend.org"
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain tvheadend"
PKG_SECTION="service"
PKG_SHORTDESC="Tvheadend: a TV streaming server for Linux"
PKG_LONGDESC="Tvheadend (Version: $PKG_VERSION) is a TV streaming server for Linux supporting DVB-S, DVB-S2, DVB-C, DVB-T, ATSC, IPTV, and Analog video (V4L) as input sources. It also comes with a powerful and easy to use web interface both used for configuration and day-to-day operations, such as searching the EPG and scheduling recordings. Even so, the most notable feature of Tvheadend is how easy it is to set up: Install it, navigate to the web user interface, drill into the TV adapters tab, select your current location and Tvheadend will start scanning channels and present them to you in just a few minutes. If installing as an Addon a reboot is needed"
PKG_TOOLCHAIN="manual"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="Tvheadend 4.3"
PKG_ADDON_TYPE="xbmc.service"

addon() {
  TVHEADEND_DIR=$(get_build_dir tvheadend)

  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/bin

  cp $PKG_DIR/addon.xml $ADDON_BUILD/$PKG_ADDON_ID

  # copy gnutls lib that is needed for ffmpeg
  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/lib
  cp -PL $(get_build_dir gnutls)/.INSTALL_PKG/usr/lib/libgnutls.so.30 $ADDON_BUILD/$PKG_ADDON_ID/lib
  cp -PL $(get_build_dir nettle)/.install_pkg/usr/lib/libnettle.so.6 $ADDON_BUILD/$PKG_ADDON_ID/lib
  cp -PL $(get_build_dir nettle)/.install_pkg/usr/lib/libhogweed.so.4 $ADDON_BUILD/$PKG_ADDON_ID/lib
  cp -PL $(get_build_dir libidn2)/.install_pkg/usr/lib/libidn2.so.4 $ADDON_BUILD/$PKG_ADDON_ID/lib
  cp -PL $(get_build_dir gmp)/.install_pkg/usr/lib/libgmp.so.10 $ADDON_BUILD/$PKG_ADDON_ID/lib

  # set only version (revision will be added by buildsystem)
  sed -e "s|@ADDON_VERSION@|$ADDON_VERSION|g" \
      -i $ADDON_BUILD/$PKG_ADDON_ID/addon.xml

  cp -P $TVHEADEND_DIR/build.linux/tvheadend $ADDON_BUILD/$PKG_ADDON_ID/bin
  cp -P $TVHEADEND_DIR/capmt_ca.so $ADDON_BUILD/$PKG_ADDON_ID/bin
  cp -P $(get_build_dir comskip)/.install_pkg/usr/bin/comskip $ADDON_BUILD/$PKG_ADDON_ID/bin

  # dvb-scan files
  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/dvb-scan
  cp -r $(get_build_dir tvh-dtv-scan-tables)/atsc \
        $(get_build_dir tvh-dtv-scan-tables)/dvb-* \
        $(get_build_dir tvh-dtv-scan-tables)/isdb-t \
        $ADDON_BUILD/$PKG_ADDON_ID/dvb-scan
}