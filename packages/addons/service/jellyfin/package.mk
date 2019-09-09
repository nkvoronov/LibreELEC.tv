# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="jellyfin"
PKG_VERSION="10.3.7"
PKG_SHA256="595dfbfd2ba61e3aa16cda365b02f02f631d8cb477e30b9f72e75b78c792b918"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://jellyfin.github.io/"
PKG_URL="https://github.com/jellyfin/jellyfin/releases/download/v${PKG_VERSION}/jellyfin_${PKG_VERSION}_linux-amd64.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
#imagemagick"
PKG_SECTION="service"
PKG_SHORTDESC="Jellyfin Server: The Free Software Media System"
PKG_LONGDESC="Jellyfin Server ($PKG_VERSION) is the Free Software Media System that puts you in control of managing and streaming your media.\
There are no strings attached, no premium licenses or features, and no hidden agendas."
PKG_TOOLCHAIN="manual"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="Jellyfin Server"
PKG_ADDON_TYPE="xbmc.service"
PKG_ADDON_REQUIRES="tools.ffmpeg-tools:0.0.0 tools.dotnet-runtime:0.0.0"

addon() {
  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/jellyfin
  cp -r $PKG_BUILD/* -d $ADDON_BUILD/$PKG_ADDON_ID/jellyfin

#  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/lib
#  cp -L $(get_build_dir imagemagick)/.install_pkg/usr/lib/libMagickCore-7.Q16HDRI.so.? \
#        $ADDON_BUILD/$PKG_ADDON_ID/lib/
#  cp -L $(get_build_dir imagemagick)/.install_pkg/usr/lib/libMagickWand-7.Q16HDRI.so \
#        $ADDON_BUILD/$PKG_ADDON_ID/lib/CORE_RL_Wand_.so
}
