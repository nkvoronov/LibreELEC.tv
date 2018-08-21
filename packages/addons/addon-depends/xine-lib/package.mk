# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2011 Stephan Raue (stephan@openelec.tv)

PKG_NAME="xine-lib"
PKG_VERSION="1.2.8"
PKG_SHA256="f1b299a71dcae075bf6792e7b5a2020ed5ac8c46ad5091e004ce266aac40e8a6"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.xine-project.org/"
PKG_URL="https://xine-lib.alioth.debian.org/releases/xine-lib-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="toolchain ffmpeg"
PKG_SECTION="multimedia"
PKG_SHORTDESC="xine is a high-performance, portable and reusable multimedia playback engine."
PKG_LONGDESC="xine is a high-performance, portable and reusable multimedia playback engine."

pre_build_target() {
  mkdir -p $PKG_BUILD/.$TARGET_NAME
  cp -RP $PKG_BUILD/* $PKG_BUILD/.$TARGET_NAME
}

pre_configure_target() {
  strip_lto
}

configure_target() {
  ./autogen.sh --host=$TARGET_NAME \
             --build=$HOST_NAME \
             --prefix=/usr \
             --with-external-ffmpeg \
             --disable-dxr3 \
             --disable-aalib \
             --disable-vcd \
             --disable-musepack
}

make_target() {
  make
  $MAKEINSTALL
}