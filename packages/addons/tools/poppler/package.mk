# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="poppler"
PKG_VERSION="0.74.0"
PKG_REV="1"
PKG_LICENSE="GPL"
PKG_SITE="https://poppler.freedesktop.org/"
PKG_URL="https://poppler.freedesktop.org/${PKG_NAME}-${PKG_VERSION}.tar.xz"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="tools"
PKG_SHORTDESC="Poppler is a PDF rendering library based on the xpdf-3.0 code base."
PKG_LONGDESC="Poppler is a PDF rendering library based on the xpdf-3.0 code base."
PKG_TOOLCHAIN="manual"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="poppler"
PKG_ADDON_TYPE="xbmc.python.script"

addon() {
  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/bin/

}
