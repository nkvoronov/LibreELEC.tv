################################################################################
#      This file is part of LibreELEC - http://www.libreelec.tv
#      Copyright (C) 2016 Team LibreELEC
#
#  LibreELEC is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 2 of the License, or
#  (at your option) any later version.
#
#  LibreELEC is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with LibreELEC.  If not, see <http://www.gnu.org/licenses/>.
################################################################################

PKG_NAME="tools-dvb"
PKG_VERSION=""
PKG_REV="100"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE=""
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain"
PKG_PRIORITY="optional"
PKG_SECTION="virtual"
PKG_SHORTDESC="A bundle of dvb tools and programs"
PKG_LONGDESC="This bundle currently includes dvb-apps, dvb-fe-tool and dvblast."

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

ENABLE_DVB_APPS="no"
ENABLE_DVB_FE_TOOL="no"
ENABLE_DVBLAST="no"
ENABLE_SCAN_S2="yes"
ENABLE_SZAP_S2="yes"

if [ "$ENABLE_DVB_APPS" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET dvb-apps"
fi

if [ "$ENABLE_DVB_FE_TOOL" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET dvb-fe-tool"
fi

if [ "$ENABLE_DVBLAST" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET dvblast"
fi

if [ "$ENABLE_SCAN_S2" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET scan-s2"
fi

if [ "$ENABLE_SZAP_S2" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET szap-s2"
fi

make_target() {
  : # nothing to make here
}

makeinstall_target() {
  : # nothing to install here
}

post_install() {
  mkdir -p $INSTALL/usr/bin/

  if [ "$ENABLE_DVB_APPS" = yes ]; then
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

  if [ "$ENABLE_DVB_FE_TOOL" = yes ]; then
    cp -P $(get_build_dir dvb-fe-tool)/.$TARGET_NAME/utils/dvb/dvb-fe-tool $INSTALL/usr/bin
  fi

  if [ "$ENABLE_DVBLAST" = yes ]; then
    cp -P $(get_build_dir dvblast)/dvblast $INSTALL/usr/bin
  fi

  if [ "$ENABLE_SCAN_S2" = yes ]; then
    cp -P $(get_build_dir scan-s2)/scan-s2 $INSTALL/usr/bin

    mkdir -p $INSTALL/usr/share/scan-s2
    cp -pR $(get_build_dir scan-s2)/atsc $INSTALL/usr/share/scan-s2
    cp -pR $(get_build_dir scan-s2)/dvb-c $INSTALL/usr/share/scan-s2
    cp -pR $(get_build_dir scan-s2)/dvb-s $INSTALL/usr/share/scan-s2
    cp -pR $(get_build_dir scan-s2)/dvb-t $INSTALL/usr/share/scan-s2
  fi

  if [ "$ENABLE_SZAP_S2" = yes ]; then
    cp -P $(get_build_dir szap-s2)/szap-s2 $INSTALL/usr/bin
    cp -P $(get_build_dir szap-s2)/tzap-t2 $INSTALL/usr/bin
  fi
}
