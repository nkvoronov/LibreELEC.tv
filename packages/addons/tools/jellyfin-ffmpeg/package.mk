# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2021-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="jellyfin-ffmpeg"
PKG_VERSION="4.4.1"
PKG_PVERSION="4"
PKG_DVERSION="focal_amd64"
PKG_SHA256="ba9ad078bb76e74debf65ae06bf6b6e4f7c90d4d1da3e1ef17bccd7dd487579b"
PKG_REV="143"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://jellyfin.github.io/"
PKG_URL="https://repo.jellyfin.org/releases/server/ubuntu/stable/ffmpeg/${PKG_NAME}_${PKG_VERSION}-${PKG_PVERSION}-${PKG_DVERSION}.deb"
PKG_DEPENDS_TARGET="toolchain jellyfin-libs"
PKG_SECTION="tools"
PKG_SHORTDESC="Jellyfin FFMPEG addon"
PKG_LONGDESC="Jellyfin FFMPEG (${PKG_VERSION}): FFmpeg binary for transcoding and audio/video manipulating."
PKG_TOOLCHAIN="manual"
PKG_BUILD_FLAGS="-strip"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="Jellyfin ffmpeg addon"
PKG_ADDON_TYPE="xbmc.python.script"

addon() {
  mkdir -p ${ADDON_BUILD}/${PKG_ADDON_ID}/bin
  cp -P ${PKG_BUILD}/usr/lib/jellyfin-ffmpeg/ffmpeg ${ADDON_BUILD}/${PKG_ADDON_ID}/bin
  cp -P ${PKG_BUILD}/usr/lib/jellyfin-ffmpeg/ffprobe ${ADDON_BUILD}/${PKG_ADDON_ID}/bin
  cp -P ${PKG_BUILD}/usr/lib/jellyfin-ffmpeg/vainfo ${ADDON_BUILD}/${PKG_ADDON_ID}/bin

  mkdir -p ${ADDON_BUILD}/${PKG_ADDON_ID}/lib
  cp -PR ${PKG_BUILD}/usr/lib/jellyfin-ffmpeg/lib/dri ${ADDON_BUILD}/${PKG_ADDON_ID}/lib
  cp -PR ${PKG_BUILD}/usr/lib/jellyfin-ffmpeg/lib/libmfx-gen ${ADDON_BUILD}/${PKG_ADDON_ID}/lib
  cp -PR ${PKG_BUILD}/usr/lib/jellyfin-ffmpeg/lib/mfx ${ADDON_BUILD}/${PKG_ADDON_ID}/lib

  cp -P ${PKG_BUILD}/usr/lib/jellyfin-ffmpeg/lib/libdav1d.so.6.6.0 ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/libdav1d.so.6
  cp -P ${PKG_BUILD}/usr/lib/jellyfin-ffmpeg/lib/libigdgmm.so.12.0.0 ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/libigdgmm.so.12
  cp -P ${PKG_BUILD}/usr/lib/jellyfin-ffmpeg/lib/libigfxcmrt.so.7.2.0 ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/libigfxcmrt.so.7
  cp -P ${PKG_BUILD}/usr/lib/jellyfin-ffmpeg/lib/libmfx.so.1.35 ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/libmfx.so.1
  cp -P ${PKG_BUILD}/usr/lib/jellyfin-ffmpeg/lib/libmfx-gen.so.1.2.7 ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/libmfx-gen.so.1
  cp -P ${PKG_BUILD}/usr/lib/jellyfin-ffmpeg/lib/libmfxhw64.so.1.35 ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/libmfxhw64.so.1
  cp -P ${PKG_BUILD}/usr/lib/jellyfin-ffmpeg/lib/libva.so.2.1500.0 ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/libva.so.2
  cp -P ${PKG_BUILD}/usr/lib/jellyfin-ffmpeg/lib/libva-drm.so.2.1500.0 ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/libva-drm.so.2
  cp -P ${PKG_BUILD}/usr/lib/jellyfin-ffmpeg/lib/libzimg.so.2.0.0 ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/libzimg.so.2

  cp -PR $(get_build_dir jellyfin-libs)/usr/lib/* ${ADDON_BUILD}/${PKG_ADDON_ID}/lib
}
