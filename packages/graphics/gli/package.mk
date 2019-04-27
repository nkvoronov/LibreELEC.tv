# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="gli"
PKG_VERSION="0.8.2.0"
#PKG_SHA256="209b5943d393925e1a6ecb6734e7507b8f6add25e72a605b25d0d0d382e64fd4"
PKG_LICENSE="MIT"
PKG_SITE="https://glm.g-truc.net/"
PKG_URL="https://github.com/g-truc/gli/releases/download/$PKG_VERSION/gli-$PKG_VERSION.zip"
PKG_SOURCE_DIR="gli"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="OpenGL Image (GLI)"

if [ "$OPENGL" = "no" ] ; then
  exit 0
fi
