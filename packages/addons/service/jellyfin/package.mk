# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2021-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="jellyfin"
PKG_VERSION="10.7.7"
PKG_SHA256="41390511b6dca6d14aa5f3d8cb397a7af519c923a6125f85e5c76571a87dc816"
PKG_REV="142"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://jellyfin.github.io/"
PKG_URL="https://www.dropbox.com/s/u8u60frd0g4wmnp/${PKG_NAME}-${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="service"
PKG_SHORTDESC="Jellyfin Server: The Free Software Media System"
PKG_LONGDESC="Jellyfin Server (${PKG_VERSION}) is the Free Software Media System that puts you in control of managing and streaming your media.\
There are no strings attached, no premium licenses or features, and no hidden agendas."
PKG_TOOLCHAIN="manual"
PKG_BUILD_FLAGS="-strip"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="Jellyfin Server"
PKG_ADDON_TYPE="xbmc.service"
PKG_ADDON_REQUIRES="tools.jellyfin-ffmpeg:10.0.0.142 tools.dotnet5-runtime:10.0.0.116"

addon() {
  mkdir -p ${ADDON_BUILD}/${PKG_ADDON_ID}/jellyfin
  cp -PR ${PKG_BUILD}/* ${ADDON_BUILD}/${PKG_ADDON_ID}/jellyfin
}
