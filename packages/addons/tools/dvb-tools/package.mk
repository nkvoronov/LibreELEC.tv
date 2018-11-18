# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="dvb-tools"
PKG_VERSION="1.0"
PKG_REV="105"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://libreelec.tv"
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="tools"
PKG_SHORTDESC="DVB-Tools: is a bundle of dvb tools and programs"
PKG_LONGDESC="This bundle currently includes blindscan-s2, dvb-apps, dvblast, dvbsnoop, mumudvb, szap-s2, tune-s2 and w_scan."

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="DVB Tools"
PKG_ADDON_TYPE="xbmc.python.script"

ENABLE_BLINDSCAN_S2="no"
ENABLE_DVB_APPS="no"
ENABLE_DVBLAST="no"
ENABLE_DVBSNOOP="no"
ENABLE_MUMUDVB="no"
ENABLE_SZAP_S2="yes"
ENABLE_TUNE_S2="yes"
ENABLE_T2SCAN="yes"
ENABLE_WSCAN="yes"

if [ "$ENABLE_BLINDSCAN_S2" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET blindscan-s2"
fi

if [ "$ENABLE_DVB_APPS" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET dvb-apps"
fi

if [ "$ENABLE_DVBLAST" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET dvblast"
fi

if [ "$ENABLE_DVBSNOOP" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET dvbsnoop"
fi

if [ "$ENABLE_MUMUDVB" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET mumudvb"
fi

if [ "$ENABLE_SZAP_S2" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET szap-s2"
fi

if [ "$ENABLE_TUNE_S2" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET tune-s2"
fi

if [ "$ENABLE_T2SCAN" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET t2scan"
fi

if [ "$ENABLE_WSCAN" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET w_scan"
fi


addon() {
  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/bin/

  # blindscan-s2
  if [ "$ENABLE_BLINDSCAN_S2" = yes ]; then
    cp -P $(get_build_dir blindscan-s2)/blindscan-s2 $ADDON_BUILD/$PKG_ADDON_ID/bin
  fi
  # dvb-apps
  if [ "$ENABLE_DVB_APPS" = yes ]; then
    cp -P $(get_build_dir dvb-apps)/util/dvbdate/dvbdate $ADDON_BUILD/$PKG_ADDON_ID/bin
    cp -P $(get_build_dir dvb-apps)/util/dvbnet/dvbnet $ADDON_BUILD/$PKG_ADDON_ID/bin
    cp -P $(get_build_dir dvb-apps)/util/dvbscan/dvbscan $ADDON_BUILD/$PKG_ADDON_ID/bin
    cp -P $(get_build_dir dvb-apps)/util/dvbtraffic/dvbtraffic $ADDON_BUILD/$PKG_ADDON_ID/bin
    cp -P $(get_build_dir dvb-apps)/util/femon/femon $ADDON_BUILD/$PKG_ADDON_ID/bin
    cp -P $(get_build_dir dvb-apps)/util/scan/scan $ADDON_BUILD/$PKG_ADDON_ID/bin
    cp -P $(get_build_dir dvb-apps)/util/szap/azap $ADDON_BUILD/$PKG_ADDON_ID/bin
    cp -P $(get_build_dir dvb-apps)/util/szap/czap $ADDON_BUILD/$PKG_ADDON_ID/bin
    cp -P $(get_build_dir dvb-apps)/util/szap/szap $ADDON_BUILD/$PKG_ADDON_ID/bin
    cp -P $(get_build_dir dvb-apps)/util/szap/tzap $ADDON_BUILD/$PKG_ADDON_ID/bin
    cp -P $(get_build_dir dvb-apps)/util/zap/zap $ADDON_BUILD/$PKG_ADDON_ID/bin
  fi
  # dvblast
  if [ "$ENABLE_DVBLAST" = yes ]; then
    cp -P $(get_build_dir dvblast)/dvblast $ADDON_BUILD/$PKG_ADDON_ID/bin
  fi
  # dvbsnoop
  if [ "$ENABLE_DVBSNOOP" = yes ]; then
    cp -P $(get_build_dir dvbsnoop)/.$TARGET_NAME/src/dvbsnoop $ADDON_BUILD/$PKG_ADDON_ID/bin
  fi
  # mumudvb
  if [ "$ENABLE_MUMUDVB" = yes ]; then
    cp -P $(get_build_dir mumudvb)/.$TARGET_NAME/src/mumudvb $ADDON_BUILD/$PKG_ADDON_ID/bin
  fi
  # szap-s2
  if [ "$ENABLE_SZAP_S2" = yes ]; then
    cp -P $(get_build_dir szap-s2)/szap-s2 $ADDON_BUILD/$PKG_ADDON_ID/bin
    cp -P $(get_build_dir szap-s2)/tzap-t2 $ADDON_BUILD/$PKG_ADDON_ID/bin
  fi
  # tune-s2
  if [ "$ENABLE_TUNE_S2" = yes ]; then
    cp -P $(get_build_dir tune-s2)/tune-s2 $ADDON_BUILD/$PKG_ADDON_ID/bin
  fi
  # t2scan
  if [ "$ENABLE_T2SCAN" = yes ]; then
    cp -P $(get_build_dir t2scan)/.$TARGET_NAME/t2scan $ADDON_BUILD/$PKG_ADDON_ID/bin
  fi
  # w_scan
  if [ "$ENABLE_WSCAN" = yes ]; then
    cp -P $(get_build_dir w_scan)/.$TARGET_NAME/w_scan $ADDON_BUILD/$PKG_ADDON_ID/bin
  fi
}
