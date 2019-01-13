# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="libgoom2"
PKG_VERSION="2k4"
PKG_SHA256="d993c904c05faba87fd7f159291fa1cb7aadcff2edd28454d8e967880a8a0c85"
PKG_LICENSE="LGPL"
PKG_SITE="http://www.fovea.cc/?page=details_produits&id=goom"
PKG_URL="http://downloads.sourceforge.net/project/goom/goom$PKG_VERSION/0/goom-$PKG_VERSION-0-src.tar.gz"
PKG_DEPENDS_TARGET="toolchain glibc"
PKG_LONGDESC="Shared library part of the Goom visualization plugin"

PKG_CONFIGURE_OPTS_TARGET="--prefix=/usr \
                          --without-xmms \
                          --without-sdl"