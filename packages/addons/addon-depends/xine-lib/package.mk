# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2009-2011 Stephan Raue (stephan@openelec.tv)

PKG_NAME="xine-lib"
PKG_VERSION="1.2.9"
PKG_SHA256="32b34e8049feb762d75a551d5d2cdb56c396fdd83e35b9b7de5fd08e498e948d"
PKG_LICENSE="GPL"
PKG_SITE="http://www.xine-project.org/"
PKG_URL="https://downloads.sourceforge.net/project/xine/$PKG_NAME/$PKG_VERSION/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="toolchain ffmpeg"
PKG_LONGDESC="xine is a high-performance, portable and reusable multimedia playback engine."
PKG_BUILD_FLAGS="-lto"

pre_build_target() {
  mkdir -p $PKG_BUILD/.$TARGET_NAME
  cp -RP $PKG_BUILD/* $PKG_BUILD/.$TARGET_NAME
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
