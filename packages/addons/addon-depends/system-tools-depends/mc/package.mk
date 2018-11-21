# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2012 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="mc"
PKG_VERSION="4.8.21"
PKG_SHA256="8f37e546ac7c31c9c203a03b1c1d6cb2d2f623a300b86badfd367e5559fe148c"
PKG_LICENSE="GPL"
PKG_SITE="http://www.midnight-commander.org"
PKG_URL="http://ftp.midnight-commander.org/mc-${PKG_VERSION}.tar.xz"
PKG_DEPENDS_TARGET="toolchain gettext:host glib libssh2 libtool:host slang pcre"
PKG_LONGDESC="Midnight Commander is a text based filemanager that emulates Norton Commander"

PKG_CONFIGURE_OPTS_TARGET=" \
  --host=$TARGET_NAME \
  --build=$HOST_NAME \
  --prefix=/usr \
  --exec-prefix=/usr \
  --with-screen=slang \
  --with-sysroot=$SYSROOT_PREFIX \
  --disable-aspell \
  --without-diff-viewer \
  --disable-doxygen-doc \
  --disable-doxygen-dot \
  --disable-doxygen-html \
  --with-gnu-ld \
  --without-libiconv-prefix \
  --without-libintl-prefix \
  --with-internal-edit \
  --disable-mclib \
  --with-subshell \
  --enable-vfs-extfs \
  --enable-vfs-ftp \
  --enable-vfs-sftp \
  --enable-vfs-tar \
  --without-x"

pre_configure_target() {
  LDFLAGS="$LDFLAGS -lcrypto -lssl"
  export CFLAGS="$CFLAGS -I$SYSROOT_PREFIX/usr/include/slang"
  export LDFLAGS=`echo $LDFLAGS | sed -e "s|-Wl,--as-needed||"`
}
