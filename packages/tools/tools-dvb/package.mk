# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)

PKG_NAME="tools-dvb"
PKG_VERSION="1.0"
PKG_LICENSE="GPL"
PKG_SITE=""
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="This bundle currently includes blindscan-s2, dvb-apps, dvblast, dvbsnoop, mumudvb, szap-s2, tune-s2 and w_scan."
PKG_TOOLCHAIN="manual"

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

post_install() {
  mkdir -p ${INSTALL}/usr/bin/
  # blindscan-s2
  if [ "${ENABLE_BLINDSCAN_S2}" = "yes" ]; then
    cp -P $(get_install_dir blindscan-s2)/usr/bin/blindscan-s2 ${INSTALL}/usr/bin
  fi
  # dvb-apps
  if [ "${ENABLE_DVB_APPS}" = "yes" ]; then
    cp -P $(get_install_dir dvb-apps)/usr/bin/dvbdate ${INSTALL}/usr/bin
    cp -P $(get_install_dir dvb-apps)/usr/bin/dvbnet ${INSTALL}/usr/bin
    cp -P $(get_install_dir dvb-apps)/usr/bin/dvbscan ${INSTALL}/usr/bin
    cp -P $(get_install_dir dvb-apps)/usr/bin/dvbtraffic ${INSTALL}/usr/bin
    cp -P $(get_install_dir dvb-apps)/usr/bin/femon ${INSTALL}/usr/bin
    cp -P $(get_install_dir dvb-apps)/usr/bin/scan ${INSTALL}/usr/bin
    cp -P $(get_install_dir dvb-apps)/usr/bin/azap ${INSTALL}/usr/bin
    cp -P $(get_install_dir dvb-apps)/usr/bin/czap ${INSTALL}/usr/bin
    cp -P $(get_install_dir dvb-apps)/usr/bin/szap ${INSTALL}/usr/bin
    cp -P $(get_install_dir dvb-apps)/usr/bin/tzap ${INSTALL}/usr/bin
    cp -P $(get_install_dir dvb-apps)/usr/bin/zap ${INSTALL}/usr/bin
  fi
  # dvblast
  if [ "${ENABLE_DVBLAST}" = "yes" ]; then
    cp -P $(get_install_dir dvblast)/usr/bin/dvblast ${INSTALL}/usr/bin
  fi
  # dvbsnoop
  if [ "${ENABLE_DVBSNOOP}" = "yes" ]; then
    cp -P $(get_install_dir dvbsnoop)/usr/bin/dvbsnoop ${INSTALL}/usr/bin
  fi
  # mumudvb
  if [ "${ENABLE_MUMUDVB}" = "yes" ]; then
    cp -P $(get_install_dir mumudvb)/usr/bin/mumudvb ${INSTALL}/usr/bin
  fi
  # szap-s2
  if [ "${ENABLE_SZAP_S2}" = "yes" ]; then
    cp -P $(get_install_dir szap-s2)/usr/bin/szap-s2 ${INSTALL}/usr/bin
  fi
  # tune-s2
  if [ "${ENABLE_TUNE_S2}" = "yes" ]; then
    cp -P $(get_install_dir tune-s2)/usr/bin/tune-s2 ${INSTALL}/usr/bin
  fi
  # t2scan
  if [ "${ENABLE_T2SCAN}" = yes ]; then
    cp -P $(get_install_dir t2scan)/usr/bin/t2scan ${INSTALL}/usr/bin
  fi
  # w_scan
  if [ "${ENABLE_WSCAN}" = "yes" ]; then
    cp -P $(get_install_dir w_scan)/usr/bin/w_scan ${INSTALL}/usr/bin
  fi
}
