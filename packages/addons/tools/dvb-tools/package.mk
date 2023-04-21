# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="dvb-tools"
PKG_VERSION="1.0"
PKG_REV="112"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://libreelec.tv"
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="tools"
PKG_SHORTDESC="DVB-Tools: is a bundle of dvb tools and programs"
PKG_LONGDESC="This bundle currently includes blindscan-s2, dvb-apps, dvblast, dvbsnoop, mumudvb, szap-s2, tune-s2, t2scan and w_scan."
PKG_TOOLCHAIN="manual"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="DVB Tools"
PKG_ADDON_TYPE="xbmc.python.script"

ENABLE_BLINDSCAN_S2="yes"
ENABLE_DVB_APPS="yes"
ENABLE_DVBLAST="yes"
ENABLE_DVBSNOOP="yes"
ENABLE_MUMUDVB="yes"
ENABLE_SZAP_S2="yes"
ENABLE_TUNE_S2="yes"
ENABLE_T2SCAN="yes"
ENABLE_WSCAN="yes"

if [ "${ENABLE_BLINDSCAN_S2}" = "yes" ]; then
  PKG_DEPENDS_TARGET+=" blindscan-s2"
fi

if [ "${ENABLE_DVB_APPS}" = "yes" ]; then
  PKG_DEPENDS_TARGET+=" dvb-apps"
fi

if [ "${ENABLE_DVBLAST}" = "yes" ]; then
  PKG_DEPENDS_TARGET+=" dvblast"
fi

if [ "${ENABLE_DVBSNOOP}" = "yes" ]; then
  PKG_DEPENDS_TARGET+=" dvbsnoop"
fi

if [ "${ENABLE_MUMUDVB}" = "yes" ]; then
  PKG_DEPENDS_TARGET+=" mumudvb"
fi

if [ "${ENABLE_SZAP_S2}" = "yes" ]; then
  PKG_DEPENDS_TARGET+=" szap-s2"
fi

if [ "${ENABLE_TUNE_S2}" = "yes" ]; then
  PKG_DEPENDS_TARGET+=" tune-s2"
fi

if [ "${ENABLE_T2SCAN}" = "yes" ]; then
  PKG_DEPENDS_TARGET+=" t2scan"
fi

if [ "${ENABLE_WSCAN}" = "yes" ]; then
  PKG_DEPENDS_TARGET+=" w_scan"
fi

addon() {
  mkdir -p ${ADDON_BUILD}/${PKG_ADDON_ID}/bin/
  
  # blindscan-s2
  if [ "${ENABLE_BLINDSCAN_S2}" = "yes" ]; then
    cp -P $(get_install_dir blindscan-s2)/usr/bin/blindscan-s2 ${ADDON_BUILD}/${PKG_ADDON_ID}/bin
  fi
  # dvb-apps
  if [ "${ENABLE_DVB_APPS}" = "yes" ]; then
    cp -P $(get_install_dir dvb-apps)/usr/bin/dvbdate ${ADDON_BUILD}/${PKG_ADDON_ID}/bin
    cp -P $(get_install_dir dvb-apps)/usr/bin/dvbnet ${ADDON_BUILD}/${PKG_ADDON_ID}/bin
    cp -P $(get_install_dir dvb-apps)/usr/bin/dvbscan ${ADDON_BUILD}/${PKG_ADDON_ID}/bin
    cp -P $(get_install_dir dvb-apps)/usr/bin/dvbtraffic ${ADDON_BUILD}/${PKG_ADDON_ID}/bin
    cp -P $(get_install_dir dvb-apps)/usr/bin/femon ${ADDON_BUILD}/${PKG_ADDON_ID}/bin
    cp -P $(get_install_dir dvb-apps)/usr/bin/scan ${ADDON_BUILD}/${PKG_ADDON_ID}/bin
    cp -P $(get_install_dir dvb-apps)/usr/bin/azap ${ADDON_BUILD}/${PKG_ADDON_ID}/bin
    cp -P $(get_install_dir dvb-apps)/usr/bin/czap ${ADDON_BUILD}/${PKG_ADDON_ID}/bin
    cp -P $(get_install_dir dvb-apps)/usr/bin/szap ${ADDON_BUILD}/${PKG_ADDON_ID}/bin
    cp -P $(get_install_dir dvb-apps)/usr/bin/tzap ${ADDON_BUILD}/${PKG_ADDON_ID}/bin
    cp -P $(get_install_dir dvb-apps)/usr/bin/zap ${ADDON_BUILD}/${PKG_ADDON_ID}/bin
  fi
  # dvblast
  if [ "${ENABLE_DVBLAST}" = "yes" ]; then
    cp -P $(get_install_dir dvblast)/usr/bin/dvblast ${ADDON_BUILD}/${PKG_ADDON_ID}/bin
  fi
  # dvbsnoop
  if [ "${ENABLE_DVBSNOOP}" = "yes" ]; then
    cp -P $(get_install_dir dvbsnoop)/usr/bin/dvbsnoop ${ADDON_BUILD}/${PKG_ADDON_ID}/bin
  fi
  # mumudvb
  if [ "${ENABLE_MUMUDVB}" = "yes" ]; then
    cp -P $(get_install_dir mumudvb)/usr/bin/mumudvb ${ADDON_BUILD}/${PKG_ADDON_ID}/bin
  fi
  # szap-s2
  if [ "${ENABLE_SZAP_S2}" = "yes" ]; then
    cp -P $(get_install_dir szap-s2)/usr/bin/szap-s2 ${ADDON_BUILD}/${PKG_ADDON_ID}/bin
  fi
  # tune-s2
  if [ "${ENABLE_TUNE_S2}" = "yes" ]; then
    cp -P $(get_install_dir tune-s2)/usr/bin/tune-s2 ${ADDON_BUILD}/${PKG_ADDON_ID}/bin
  fi
  # t2scan
  if [ "${ENABLE_T2SCAN}" = yes ]; then
    cp -P $(get_install_dir t2scan)/usr/bin/t2scan ${ADDON_BUILD}/${PKG_ADDON_ID}/bin
  fi
  # w_scan
  if [ "${ENABLE_WSCAN}" = "yes" ]; then
    cp -P $(get_install_dir w_scan)/usr/bin/w_scan ${ADDON_BUILD}/${PKG_ADDON_ID}/bin
  fi
}
