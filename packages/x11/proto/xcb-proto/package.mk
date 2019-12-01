# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2019-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="xcb-proto"
PKG_VERSION="1.13"
PKG_SHA256="7b98721e669be80284e9bbfeab02d2d0d54cd11172b72271e47a2fe875e2bde1"
PKG_LICENSE="OSS"
PKG_SITE="http://www.X.org"
PKG_URL="http://xcb.freedesktop.org/dist/$PKG_NAME-$PKG_VERSION.tar.bz2"
PKG_DEPENDS_TARGET="toolchain util-macros Python3:host"
PKG_LONGDESC="X C-language Bindings protocol headers."

post_makeinstall_target() {
  python_remove_source
}
