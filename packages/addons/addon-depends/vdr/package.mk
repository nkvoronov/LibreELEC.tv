# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2011 Stephan Raue (stephan@openelec.tv)

PKG_NAME="vdr"
PKG_VERSION="2.4.0"
PKG_SHA256="93af49fe87048073dc38ef5e6c71e9704344d730f21c261afac69e3c937f8cce"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.tvdr.de"
PKG_URL="ftp://ftp.tvdr.de/vdr/$PKG_NAME-$PKG_VERSION.tar.bz2"
PKG_DEPENDS_TARGET="toolchain fontconfig freetype libcap libiconv libjpeg-turbo bzip2"
PKG_SECTION="multimedia"
PKG_SHORTDESC="vdr: A powerful DVB TV application"
PKG_LONGDESC="This project describes how to build your own digital satellite receiver and video disk recorder. It is based mainly on the DVB-S digital satellite receiver card, which used to be available from Fujitsu Siemens and the driver software developed by the LinuxTV project."

post_unpack() {
  rm -rf $PKG_BUILD/PLUGINS/src/skincurses
}

pre_configure_target() {
  export LDFLAGS="$(echo $LDFLAGS | sed -e "s|-Wl,--as-needed||") -L$SYSROOT_PREFIX/usr/lib/iconv"
}

pre_make_target() {
  cat > Make.config <<EOF
  PLUGINLIBDIR = /usr/lib/vdr
  PREFIX = /usr
  VIDEODIR = /storage/videos
  CONFDIR = /storage/.config/vdr
  LOCDIR = /usr/share/locale
  RESDIR = /storage/.config/vdr
  LIBS += -liconv

  NO_KBD=yes
  VDR_USER=root
EOF
}

make_target() {
  make vdr vdr.pc
  make i18n
  make include-dir
}

makeinstall_target() {
  : # installation not needed, done by create-addon script
}
