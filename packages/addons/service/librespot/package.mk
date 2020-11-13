# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2017 Shane Meagher (shanemeagher)
# Copyright (C) 2017-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="librespot"
PKG_VERSION="0.1.3"
PKG_SHA256="2d28a63c6dda08ecbc1245c7cfe34c9b3b29e8c5304f4aa8b65aedb899056b25"
PKG_REV="125"
PKG_ARCH="any"
PKG_LICENSE="MIT"
PKG_SITE="https://github.com/librespot-org/librespot/"
PKG_URL="https://github.com/librespot-org/librespot/archive/v$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain alsa-lib avahi libvorbis pulseaudio rust"
PKG_SECTION="service"
PKG_SHORTDESC="Librespot: play Spotify through Kodi using a Spotify app as a remote"
PKG_LONGDESC="Librespot ($PKG_VERSION_DATE) lets you play Spotify through Kodi using a Spotify app as a remote."
PKG_TOOLCHAIN="manual"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="Librespot"
PKG_ADDON_TYPE="xbmc.service"
PKG_ADDON_REQUIRES="script.module.requests:0.0.0"
PKG_MAINTAINER="Anton Voyl (awiouy)"

make_target() {
  . $(get_build_dir rust)/cargo/env
  cargo build \
    --release \
    --no-default-features \
    --features "alsa-backend pulseaudio-backend with-dns-sd with-vorbis"
  $STRIP $PKG_BUILD/.$TARGET_NAME/*/release/librespot
}

addon() {
  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/bin
    cp $PKG_BUILD/.$TARGET_NAME/*/release/librespot \
       $ADDON_BUILD/$PKG_ADDON_ID/bin

  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/lib
    cp $(get_build_dir avahi)/avahi-compat-libdns_sd/.libs/libdns_sd.so.1 \
       $ADDON_BUILD/$PKG_ADDON_ID/lib
}
