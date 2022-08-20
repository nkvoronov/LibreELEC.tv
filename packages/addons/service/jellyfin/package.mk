# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2021-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="jellyfin"
PKG_VERSION="10.8.4"
PKG_REV="155"
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

PKG_DOTNET="6"
PKG_DEB="yes"
PKG_DEB_WEB="yes"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="Jellyfin Server"
PKG_ADDON_TYPE="xbmc.service"
PKG_ADDON_REQUIRES="tools.ffmpeg-tools:10.0.0.0 tools.dotnet-runtime${PKG_DOTNET}:10.0.0.0"

PKG_BUILD_FLAGS="-strip"

addon() {
  mkdir -p ${ADDON_BUILD}/${PKG_ADDON_ID}/jellyfin
  mkdir -p ${ADDON_BUILD}/${PKG_ADDON_ID}/web

  if [ "${PKG_DEB}" = "yes" ]; then
    cp -PR $(get_build_dir jellyfin-server)/usr/lib/jellyfin/bin/* ${ADDON_BUILD}/${PKG_ADDON_ID}/jellyfin
  else
    cp -PR $(get_build_dir jellyfin-server)/release/* ${ADDON_BUILD}/${PKG_ADDON_ID}/jellyfin
  fi
  if [ "${PKG_DEB_WEB}" = "yes" ]; then
    cp -PR $(get_build_dir jellyfin-web)/usr/share/jellyfin/web/* ${ADDON_BUILD}/${PKG_ADDON_ID}/web
  else
    cp -PR $(get_build_dir jellyfin-web)/dist/* ${ADDON_BUILD}/${PKG_ADDON_ID}/web
  fi
}
