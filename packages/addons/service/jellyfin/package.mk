# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2021-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="jellyfin"
PKG_VERSION="10.7.7"
PKG_REV="144"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://jellyfin.github.io/"
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain jellyfin-server jellyfin-web"
PKG_SECTION="service"
PKG_SHORTDESC="Jellyfin Server: The Free Software Media System"
PKG_LONGDESC="Jellyfin Server (${PKG_VERSION}) is the Free Software Media System that puts you in control of managing and streaming your media.\
There are no strings attached, no premium licenses or features, and no hidden agendas."
PKG_TOOLCHAIN="manual"
PKG_BUILD_FLAGS="-strip"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="Jellyfin Server"
PKG_ADDON_TYPE="xbmc.service"
PKG_ADDON_REQUIRES="tools.jellyfin-ffmpeg:10.0.0.143 tools.dotnet5-runtime:10.0.0.116"

addon() {
  mkdir -p ${ADDON_BUILD}/${PKG_ADDON_ID}/jellyfin
  cp -PR $(get_build_dir jellyfin-server)/usr/lib/jellyfin/bin/* ${ADDON_BUILD}/${PKG_ADDON_ID}/jellyfin
  mkdir -p ${ADDON_BUILD}/${PKG_ADDON_ID}/web
  cp -PR $(get_build_dir jellyfin-web)/usr/share/jellyfin/web/* ${ADDON_BUILD}/${PKG_ADDON_ID}/web
}
