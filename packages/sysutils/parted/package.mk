# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2020-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="parted"
PKG_VERSION="3.3"
PKG_SHA256="57e2b4bd87018625c515421d4524f6e3b55175b472302056391c5f7eccb83d44"
PKG_LICENSE="GPL"
PKG_SITE="http://www.gnu.org/software/parted/"
PKG_URL="http://ftpmirror.gnu.org/parted/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS_HOST="toolchain:host util-linux:host"
PKG_DEPENDS_TARGET="toolchain util-linux parted:host"
PKG_DEPENDS_INIT="toolchain util-linux:init parted"
PKG_LONGDESC="GNU Parted is a program for creating, destroying, resizing, checking and copying partitions."

PKG_CONFIGURE_OPTS_TARGET="--disable-device-mapper \
                           --disable-shared \
                           --without-readline \
                           --disable-rpath \
                           --with-gnu-ld"

PKG_CONFIGURE_OPTS_HOST="$PKG_CONFIGURE_OPTS_TARGET"

pre_configure_init() {
  : # reuse pre_configure_target()
}

configure_init() {
  : # reuse configure_target()
}

make_init() {
  : # reuse make_target()
}

makeinstall_init() {
  mkdir -p $INSTALL/sbin
    cp ../.$TARGET_NAME/parted/parted $INSTALL/sbin
    cp ../.$TARGET_NAME/partprobe/partprobe $INSTALL/sbin
}

pre_configure_target() {
  export CFLAGS+=" -I$PKG_BUILD/lib"
}
