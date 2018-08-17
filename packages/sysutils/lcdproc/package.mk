# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)

PKG_NAME="lcdproc"
PKG_VERSION="79fa538"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://lcdproc.org/"
PKG_URL="https://github.com/lcdproc/lcdproc.git"
PKG_DEPENDS_TARGET="toolchain freetype libftdi1 libhid libugpio libusb netbsd-curses serdisplib"
PKG_SECTION="sysutils"
PKG_SHORTDESC="LCDproc: Software to display system information from your Linux/*BSD box on a LCD"
PKG_LONGDESC="LCDproc ($PKG_VERSION) is a piece of software that displays real-time system information from your Linux/*BSD box on a LCD. The server supports several serial devices: Matrix Orbital, Crystal Fontz, Bayrad, LB216, LCDM001 (kernelconcepts.de), Wirz-SLI, Cwlinux(.com) and PIC-an-LCD; and some devices connected to the LPT port: HD44780, STV5730, T6963, SED1520 and SED1330. Various clients are available that display things like CPU load, system load, memory usage, uptime, and a lot more."
PKG_TOOLCHAIN="autotools"

PKG_CONFIGURE_OPTS_TARGET="--with-ft-prefix=$SYSROOT_PREFIX/usr \
                           --enable-libusb \
                           --enable-libftdi \
                           --disable-libX11 \
                           --enable-libhid \
                           --disable-libpng \
                           --enable-drivers=$LCD_DRIVER \
                           --enable-seamless-hbars"

pre_make_target() {
  # dont build parallel
    MAKEFLAGS=-j1
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
