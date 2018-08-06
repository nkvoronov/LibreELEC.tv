################################################################################
#      This file is part of LibreELEC - https://libreelec.tv
#      Copyright (C) 2016-present Team LibreELEC
#
#  LibreELEC is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 2 of the License, or
#  (at your option) any later version.
#
#  LibreELEC is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with LibreELEC.  If not, see <http://www.gnu.org/licenses/>.
################################################################################

PKG_NAME="emby35x"
PKG_VERSION="3.5.2.0"
PKG_REV="352"
PKG_ARCH="any"
PKG_LICENSE="OSS"
PKG_SITE="http://emby.media"
PKG_URL="https://github.com/MediaBrowser/Emby.Releases/releases/download/${PKG_VERSION}/emby-server-deb_${PKG_VERSION}_amd64.deb"
PKG_DEPENDS_TARGET="toolchain imagemagickx"
PKG_SECTION="service"
PKG_SHORTDESC="Emby Server: a personal media server"
PKG_LONGDESC="Emby Server ($PKG_VERSION) brings your home videos, music, and photos together, automatically converting and streaming your media on-the-fly to any device"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="Emby Server"
PKG_ADDON_TYPE="xbmc.service"
PKG_MAINTAINER="ubuntu"

unpack() {
  mkdir -p $PKG_BUILD
  dpkg -x $SOURCES/$PKG_NAME/$PKG_NAME-$PKG_VERSION.deb $PKG_BUILD
}

make_target() {
  : # nop
}

makeinstall_target() {
  : # nop
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
