# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="lcdd"
PKG_VERSION="0.5dev+2018-11-04"
PKG_REV="112"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://lcdproc.org/"
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain lcdproc"
PKG_SECTION="service"
PKG_SHORTDESC="LCDproc: Software to display system information from your Linux/*BSD box on a LCD"
PKG_LONGDESC="LCDproc ($PKG_VERSION) is a piece of software that displays real-time system information from your Linux/*BSD box on a LCD. The server supports several serial devices: Matrix Orbital, Crystal Fontz, Bayrad, LB216, LCDM001 (kernelconcepts.de), Wirz-SLI, Cwlinux(.com) and PIC-an-LCD; and some devices connected to the LPT port: HD44780, STV5730, T6963, SED1520 and SED1330. Various clients are available that display things like CPU load, system load, memory usage, uptime, and a lot more."
PKG_TOOLCHAIN="manual"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="LCDproc"
PKG_ADDON_TYPE="xbmc.service"

addon() {
  LCD_DIR=$(get_build_dir lcdproc)

  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/bin
    cp -PR $LCD_DIR/.install_pkg/usr/sbin/LCDd $ADDON_BUILD/$PKG_ADDON_ID/bin/
  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/config
    cp -PR $LCD_DIR/.install_pkg/etc/LCDd.conf $ADDON_BUILD/$PKG_ADDON_ID/config/
  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/lib
    cp -PR $LCD_DIR/.install_pkg/usr/lib/lcdproc/*.so $ADDON_BUILD/$PKG_ADDON_ID/lib/
    cp -L $(get_build_dir serdisplib)/.install_pkg/usr/lib/libserdisp.so.1 $ADDON_BUILD/$PKG_ADDON_ID/lib/
  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/share
    cp -PR $LCD_DIR/.install_pkg/usr/share/lcdproc/fonts $ADDON_BUILD/$PKG_ADDON_ID/share/

  sed -e "s|^DriverPath=.*$|DriverPath=/storage/.kodi/addons/service.lcdd/lib/|" \
      -e "s|^Font=/usr/share/lcdproc/fonts/cp1251.fnt|Font=/storage/.kodi/addons/service.lcdd/share/fonts/cp1251.fnt|" \
      -i $ADDON_BUILD/$PKG_ADDON_ID/config/LCDd.conf

  drivers="none|$(cat $LCD_DIR/.$TARGET_NAME/config.log | sed -n "s|^DRIVERS=' \(.*\)'|\1|p" | sed "s|.so||g" | tr ' ' '|')"
  cp -PR $PKG_DIR/resources $ADDON_BUILD/$PKG_ADDON_ID
  sed -e "s/@DRIVERS@/$drivers/" \
      -i $ADDON_BUILD/$PKG_ADDON_ID/resources/settings.xml

}
