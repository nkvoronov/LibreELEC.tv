# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="lcdproc"
PKG_VERSION="e08546c13a4157ed98cd4a8e9086e7acd66f93c0"
PKG_VERSION_DATE="0.5dev+2018-11-04"
PKG_LICENSE="GPL"
PKG_SITE="http://lcdproc.org/"
PKG_URL="https://github.com/lcdproc/lcdproc.git"
PKG_DEPENDS_TARGET="toolchain freetype libftdi1 libhid libugpio libusb ncurses serdisplib"
PKG_LONGDESC="LCDproc ($PKG_VERSION_DATE) is a piece of software that displays real-time system information from your Linux/*BSD box on a LCD. The server supports several serial devices: Matrix Orbital, Crystal Fontz, Bayrad, LB216, LCDM001 (kernelconcepts.de), Wirz-SLI, Cwlinux(.com) and PIC-an-LCD; and some devices connected to the LPT port: HD44780, STV5730, T6963, SED1520 and SED1330. Various clients are available that display things like CPU load, system load, memory usage, uptime, and a lot more."
PKG_TOOLCHAIN="autotools"
PKG_BUILD_FLAGS="-parallel"

PKG_CONFIGURE_OPTS_TARGET="--with-ft-prefix=$SYSROOT_PREFIX/usr \
                           --enable-libusb \
                           --enable-libftdi \
                           --disable-libX11 \
                           --enable-libhid \
                           --disable-libpng \
                           --enable-drivers=all,!xosd"

pre_configure_target() {
  CFLAGS="$CFLAGS -O3"
}

post_makeinstall_target() {

  sed -e "s|^DriverPath=.*$|DriverPath=/usr/lib/lcdproc/|" \
      -e "s|^#Foreground=.*$|Foreground=no|" \
      -e "s|^#ServerScreen=.*$|ServerScreen=blank|" \
      -e "s|^#Backlight=.*$|Backlight=open|" \
      -e "s|^#Heartbeat=.*$|Heartbeat=open|" \
      -e "s|^#TitleSpeed=.*$|TitleSpeed=4|" \
      -e "s|^#Hello=\"  Welcome to\"|Hello=\"Welcome to\"|" \
      -e "s|^#Hello=\"   LCDproc!\"|Hello=\"$DISTRONAME\"|" \
      -e "s|^#GoodBye=\"Thanks for using\"|GoodBye=\"Thanks for using\"|" \
      -e "s|^#GoodBye=\"   LCDproc!\"|GoodBye=\"$DISTRONAME\"|" \
      -e "s|^#normal_font=.*$|normal_font=/usr/share/fonts/liberation/LiberationMono-Bold.ttf|" \
      -i $INSTALL/etc/LCDd.conf

  mkdir -p $INSTALL/usr/lib/lcdproc
    cp $PKG_DIR/scripts/lcdd.start $INSTALL/usr/lib/lcdproc

  mkdir -p $INSTALL/usr/share/lcdproc/fonts
    cp -PR $PKG_DIR/fonts/*.fnt $INSTALL/usr/share/lcdproc/fonts

}

post_install() {
  enable_service lcdd.service
}
