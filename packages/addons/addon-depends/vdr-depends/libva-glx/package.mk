# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="libva-glx"
PKG_VERSION="2.3.0"
PKG_SHA256="8d95e65c4d84d0f82097581e163d3770694c600cbb040ebd827f2d375e004f4b"
PKG_ARCH="x86_64"
PKG_LICENSE="GPL"
PKG_SITE="https://01.org/linuxmedia"
PKG_URL="https://github.com/intel/libva/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain libX11 libXext libXfixes libdrm mesa glu"
PKG_LONGDESC="Libva is an implementation for VA-API (VIdeo Acceleration API)."
PKG_TOOLCHAIN="autotools"

PKG_CONFIGURE_OPTS_TARGET="--disable-silent-rules \
                           --disable-docs \
                           --enable-drm \
                           --enable-x11 \
                           --enable-glx \
                           --disable-wayland"
