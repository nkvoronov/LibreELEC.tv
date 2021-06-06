# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="tvheadend43"
PKG_VERSION="4.3.1965"
PKG_REV="293"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.tvheadend.org"
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain tvheadend"
PKG_SECTION="service"
PKG_SHORTDESC="Tvheadend: a TV streaming server for Linux"
PKG_LONGDESC="Tvheadend (${PKG_VERSION}): is a TV streaming server for Linux supporting DVB-S/S2, DVB-C, DVB-T/T2, IPTV, SAT>IP, ATSC and ISDB-T"
PKG_TOOLCHAIN="manual"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="Tvheadend Server 4.3"
PKG_ADDON_TYPE="xbmc.service"

addon() {
  mkdir -p ${ADDON_BUILD}/${PKG_ADDON_ID}/bin

  cp ${PKG_DIR}/addon.xml ${ADDON_BUILD}/${PKG_ADDON_ID}

  # set only version (revision will be added by buildsystem)
  sed -e "s|@ADDON_VERSION@|${ADDON_VERSION}|g" \
      -i ${ADDON_BUILD}/${PKG_ADDON_ID}/addon.xml

  cp -P $(get_build_dir tvheadend)/build.linux/tvheadend ${ADDON_BUILD}/${PKG_ADDON_ID}/bin
  cp -P $(get_build_dir tvheadend)/capmt_ca.so ${ADDON_BUILD}/${PKG_ADDON_ID}/bin
  cp -P $(get_install_dir comskip)/usr/bin/comskip ${ADDON_BUILD}/${PKG_ADDON_ID}/bin

# copy gnutls lib that is needed for ffmpeg
  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/lib
  cp -PL $(get_install_dir gnutls)/usr/lib/libgnutls.so.30 ${ADDON_BUILD}/${PKG_ADDON_ID}/lib
  cp -PL $(get_install_dir nettle)/usr/lib/libnettle.so.8 ${ADDON_BUILD}/${PKG_ADDON_ID}/lib
  cp -PL $(get_install_dir nettle)/usr/lib/libhogweed.so.6 ${ADDON_BUILD}/${PKG_ADDON_ID}/lib
  cp -PL $(get_install_dir gmp)/usr/lib/libgmp.so.10 ${ADDON_BUILD}/${PKG_ADDON_ID}/lib

# dvb-scan files
  mkdir -p ${ADDON_BUILD}/${PKG_ADDON_ID}/dvb-scan
  cp -r $(get_install_dir tvh-dtv-scan-tables)/usr/share/dvbv5/* \
        ${ADDON_BUILD}/${PKG_ADDON_ID}/dvb-scan
}
