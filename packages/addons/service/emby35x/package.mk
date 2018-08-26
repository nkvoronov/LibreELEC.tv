# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="emby35x"
PKG_VERSION="3.5.2.0"
PKG_SHA256="2ed573b4d43904aee4de14b582e25d0f33be7c2f85534f8232ef3b785ccb6b3a"
PKG_REV="353"
PKG_ARCH="any"
PKG_LICENSE="OSS"
PKG_SITE="http://emby.media"
PKG_URL="https://github.com/MediaBrowser/Emby.Releases/releases/download/${PKG_VERSION}/emby-server-deb_${PKG_VERSION}_amd64.deb"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="service"
PKG_SHORTDESC="Emby Server: a personal media server"
PKG_LONGDESC="Emby Server ($PKG_VERSION) brings your home videos, music, and photos together, automatically converting and streaming your media on-the-fly to any device"
PKG_TOOLCHAIN="manual"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="Emby Server"
PKG_ADDON_TYPE="xbmc.service"
PKG_MAINTAINER="ubuntu"

unpack() {
  mkdir -p $PKG_BUILD
  dpkg -x $SOURCES/$PKG_NAME/$PKG_NAME-$PKG_VERSION.deb $PKG_BUILD
}

addon() {
  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/bin
    cp $PKG_BUILD/opt/emby-server/bin/ffmpeg $ADDON_BUILD/$PKG_ADDON_ID/bin
    cp $PKG_BUILD/opt/emby-server/bin/ffprobe $ADDON_BUILD/$PKG_ADDON_ID/bin

  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/etc
    cp -r $PKG_BUILD/opt/emby-server/etc/* $ADDON_BUILD/$PKG_ADDON_ID/etc

  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/lib
    cp -r $PKG_BUILD/opt/emby-server/lib/* $ADDON_BUILD/$PKG_ADDON_ID/lib

  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/share
    cp -r $PKG_BUILD/opt/emby-server/share/* $ADDON_BUILD/$PKG_ADDON_ID/share

  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/system
    cp -r $PKG_BUILD/opt/emby-server/system/* $ADDON_BUILD/$PKG_ADDON_ID/system

}
