# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2021-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="jellyfin"
PKG_VERSION="10.6.4"
PKG_SHA256="836b4a8f252a85675787082c90ef5b3b4ee50dd964f9c207efe9a7ed7eb71ae3"
PKG_REV="24"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://jellyfin.github.io/"
PKG_URL="https://www.dropbox.com/s/l28g0ub54ypw1s0/jellyfin-${PKG_VERSION}.tar.gz"
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
PKG_ADDON_REQUIRES="tools.aspnet-runtime3:0.0.0"

addon() {
  mkdir -p ${ADDON_BUILD}/${PKG_ADDON_ID}/jellyfin
  cp -PR ${PKG_BUILD}/* ${ADDON_BUILD}/${PKG_ADDON_ID}/jellyfin
}
