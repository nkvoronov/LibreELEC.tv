# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="jellyfin"
PKG_VERSION="10.5.2"
PKG_SHA256="597a4ae735c390c74f0ea2282523ffe903d8818cce777db12d7901a5f6a5d461"
PKG_REV="13"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://jellyfin.github.io/"
PKG_URL="https://github.com/jellyfin/jellyfin/releases/download/v${PKG_VERSION}/jellyfin_${PKG_VERSION}_portable.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="service"
PKG_SHORTDESC="Jellyfin Server: The Free Software Media System"
PKG_LONGDESC="Jellyfin Server ($PKG_VERSION) is the Free Software Media System that puts you in control of managing and streaming your media.\
There are no strings attached, no premium licenses or features, and no hidden agendas."
PKG_TOOLCHAIN="manual"
PKG_BUILD_FLAGS="-strip"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="Jellyfin Server"
PKG_ADDON_TYPE="xbmc.service"
PKG_ADDON_REQUIRES="tools.aspnet-runtime3:0.0.0"

addon() {
  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/jellyfin
  cp -PR $PKG_BUILD/* $ADDON_BUILD/$PKG_ADDON_ID/jellyfin
}
