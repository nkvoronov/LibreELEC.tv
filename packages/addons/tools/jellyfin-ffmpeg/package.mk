# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2021-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="jellyfin-ffmpeg"
PKG_VERSION="10.7.7"
PKG_SHA256="5c3097455325a6d999c8d58fa479d1d7749a90c71e3e96728e97ddf942c086a4"
PKG_REV="140"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://jellyfin.github.io/"
PKG_URL="https://www.dropbox.com/s/zshan4y9sx5e2el/${PKG_NAME}-${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="tools"
PKG_SHORTDESC="Jellyfin Server: FFMPEG addon"
PKG_LONGDESC="Jellyfin Server (${PKG_VERSION}): FFmpeg binary for transcoding and audio/video manipulating."
PKG_TOOLCHAIN="manual"
PKG_BUILD_FLAGS="-strip"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="Jellyfin ffmpeg addon"
PKG_ADDON_TYPE="xbmc.python.script"

addon() {
  mkdir -p ${ADDON_BUILD}/${PKG_ADDON_ID}/bin
  cp -PR ${PKG_BUILD}/bin/* ${ADDON_BUILD}/${PKG_ADDON_ID}/bin

  mkdir -p ${ADDON_BUILD}/${PKG_ADDON_ID}/lib
  cp -PR ${PKG_BUILD}/lib/* ${ADDON_BUILD}/${PKG_ADDON_ID}/lib
}
