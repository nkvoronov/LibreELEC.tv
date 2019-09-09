# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2019-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="jellyfin"
PKG_VERSION="10.3.7"
#PKG_SHA256="f25abb6d34f888c467db561ad333a222626febdc69b6353de86c04848753210c"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://jellyfin.github.io/"
PKG_URL="https://github.com/MediaBrowser/Emby.Releases/releases/download/$PKG_VERSION/embyserver-netcore_$PKG_VERSION.zip"
PKG_SOURCE_DIR="system"
PKG_DEPENDS_TARGET="toolchain imagemagick"
PKG_SECTION="service"
PKG_SHORTDESC="Jellyfin Server: The Free Software Media System"
PKG_LONGDESC="Jellyfin Server ($PKG_VERSION) is the Free Software Media System that puts you in control of managing and streaming your media. There are no strings attached, no premium licenses or features, and no hidden agendas.
PKG_TOOLCHAIN="manual"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="Jellyfin Server"
PKG_ADDON_TYPE="xbmc.service"
PKG_ADDON_REQUIRES="tools.ffmpeg-tools:0.0.0 tools.dotnet-runtime:0.0.0"
PKG_MAINTAINER="Anton Voyl (awiouy)"

addon() {
  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/jellyfin
  cp -r $PKG_BUILD/* \
        -d $ADDON_BUILD/$PKG_ADDON_ID/jellyfin

  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/lib
  cp -L $(get_build_dir imagemagick)/.install_pkg/usr/lib/libMagickCore-7.Q16HDRI.so.? \
        $ADDON_BUILD/$PKG_ADDON_ID/lib/
  cp -L $(get_build_dir imagemagick)/.install_pkg/usr/lib/libMagickWand-7.Q16HDRI.so \
        $ADDON_BUILD/$PKG_ADDON_ID/lib/CORE_RL_Wand_.so
}
