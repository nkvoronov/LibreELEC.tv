# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)

PKG_NAME="tools-dvb"
PKG_VERSION="1"
PKG_REV="100"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE=""
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="tools"
PKG_SHORTDESC="A bundle of dvb tools and programs"
PKG_LONGDESC="This bundle currently includes blindscan-s2, dvb-apps, dvb-fe-tool, dvblast, dvbsnoop, mumudvb, szap-s2, tune-s2 and w_scan."

ENABLE_BLINDSCAN_S2="no"
ENABLE_DVB_APPS="no"
ENABLE_DVB_FE_TOOL="no"
ENABLE_DVBLAST="no"
ENABLE_DVBSNOOP="no"
ENABLE_WSCAN="no"
ENABLE_SCAN_S2="yes"
ENABLE_SZAP_S2="yes"
ENABLE_TUNE_S2="yes"
ENABLE_MUMUDVB="yes"

if [ "$ENABLE_BLINDSCAN_S2" = "yes" ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET blindscan-s2"
fi

if [ "$ENABLE_DVB_APPS" = "yes" ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET dvb-apps"
fi

if [ "$ENABLE_DVB_FE_TOOL" = "yes" ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET dvb-fe-tool"
fi

if [ "$ENABLE_DVBLAST" = "yes" ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET dvblast"
fi

if [ "$ENABLE_DVBSNOOP" = "yes" ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET dvbsnoop"
fi

if [ "$ENABLE_WSCAN" = "yes" ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET w_scan"
fi

if [ "$ENABLE_SCAN_S2" = "yes" ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET scan-s2"
fi

if [ "$ENABLE_SZAP_S2" = "yes" ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET szap-s2"
fi

if [ "$ENABLE_TUNE_S2" = "yes" ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET tune-s2"
fi

if [ "$ENABLE_MUMUDVB" = "yes" ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET mumudvb"
fi

make_target() {
  : # nothing to make here
}

makeinstall_target() {
  : # nothing to install here
}

post_install() {
  mkdir -p $INSTALL/usr/bin/
  # blindscan-s2
  if [ "$ENABLE_BLINDSCAN_S2" = "yes" ]; then
    cp -P $(get_build_dir blindscan-s2)/blindscan-s2 $INSTALL/usr/bin
  fi
  # dvb-apps
  if [ "$ENABLE_DVB_APPS" = "yes" ]; then
    cp -P $(get_build_dir dvb-apps)/util/dvbdate/dvbdate $INSTALL/usr/bin
    cp -P $(get_build_dir dvb-apps)/util/dvbnet/dvbnet $INSTALL/usr/bin
    cp -P $(get_build_dir dvb-apps)/util/dvbscan/dvbscan $INSTALL/usr/bin
    cp -P $(get_build_dir dvb-apps)/util/dvbtraffic/dvbtraffic $INSTALL/usr/bin
    cp -P $(get_build_dir dvb-apps)/util/femon/femon $INSTALL/usr/bin
    cp -P $(get_build_dir dvb-apps)/util/scan/scan $INSTALL/usr/bin
    cp -P $(get_build_dir dvb-apps)/util/szap/azap $INSTALL/usr/bin
    cp -P $(get_build_dir dvb-apps)/util/szap/czap $INSTALL/usr/bin
    cp -P $(get_build_dir dvb-apps)/util/szap/szap $INSTALL/usr/bin
    cp -P $(get_build_dir dvb-apps)/util/szap/tzap $INSTALL/usr/bin
    cp -P $(get_build_dir dvb-apps)/util/zap/zap $INSTALL/usr/bin
  fi
  # dvb-de-tool
  if [ "$ENABLE_DVB_FE_TOOL" = "yes" ]; then
    cp -P $(get_build_dir dvb-fe-tool)/.$TARGET_NAME/utils/dvb/dvb-fe-tool $INSTALL/usr/bin
  fi
  # dvblast
  if [ "$ENABLE_DVBLAST" = "yes" ]; then
    cp -P $(get_build_dir dvblast)/dvblast $INSTALL/usr/bin
  fi
  # dvbsnoop
  if [ "$ENABLE_DVBSNOOP" = "yes" ]; then
    cp -P $(get_build_dir dvbsnoop)/.$TARGET_NAME/src/dvbsnoop $INSTALL/usr/bin
  fi
  # w_scan
  if [ "$ENABLE_WSCAN" = "yes" ]; then
    cp -P $(get_build_dir w_scan)/.$TARGET_NAME/w_scan $INSTALL/usr/bin
  fi
  # scan-s2
  if [ "$ENABLE_SCAN_S2" = "yes" ]; then
    cp -P $(get_build_dir scan-s2)/scan-s2 $INSTALL/usr/bin

    mkdir -p $INSTALL/usr/share/scan-s2
    cp -pR $(get_build_dir scan-s2)/atsc $INSTALL/usr/share/scan-s2
    cp -pR $(get_build_dir scan-s2)/dvb-c $INSTALL/usr/share/scan-s2
    cp -pR $(get_build_dir scan-s2)/dvb-s $INSTALL/usr/share/scan-s2
    cp -pR $(get_build_dir scan-s2)/dvb-t $INSTALL/usr/share/scan-s2
  fi
  # szap-s2
  if [ "$ENABLE_SZAP_S2" = "yes" ]; then
    cp -P $(get_build_dir szap-s2)/szap-s2 $INSTALL/usr/bin
    cp -P $(get_build_dir szap-s2)/tzap-t2 $INSTALL/usr/bin
  fi
  # tune-s2
  if [ "$ENABLE_TUNE_S2" = "yes" ]; then
    cp -P $(get_build_dir tune-s2)/tune-s2 $INSTALL/usr/bin
  fi
  # mumudvb
  if [ "$ENABLE_MUMUDVB" = "yes" ]; then
    cp -P $(get_build_dir mumudvb)/.$TARGET_NAME/src/mumudvb $INSTALL/usr/bin
  fi
}
