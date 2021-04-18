# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="mpg123"
PKG_VERSION="1.26.5"
PKG_SHA256="502a97e0d935be7e37d987338021d8f301bae35c2884f2a83d59c4b52466ef06"
PKG_LICENSE="LGPLv2"
PKG_SITE="http://www.mpg123.org/"
PKG_URL="http://downloads.sourceforge.net/sourceforge/mpg123/mpg123-${PKG_VERSION}.tar.bz2"
PKG_DEPENDS_TARGET="toolchain alsa-lib SDL2"
PKG_LONGDESC="A console based real time MPEG Audio Player for Layer 1, 2 and 3."
#PKG_BUILD_FLAGS="-sysroot"

if [ "${CUSTOM_SUPPORT}" = "no" -a "${ENABLE_SHARED}" = "no" ]; then
   PKG_CONFIGURE_OPTS_TARGET="--disable-shared \
                              --enable-static"
fi
