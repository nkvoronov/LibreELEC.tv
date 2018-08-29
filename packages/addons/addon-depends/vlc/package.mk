# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="vlc"
PKG_VERSION="3.0.3"
PKG_SHA256="9ba8b04bdb13f7860a2041768ac83b47b397a36549c71c530b94028a3cfd5b51"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.videolan.org"
PKG_URL="http://download.videolan.org/$PKG_NAME/$PKG_VERSION/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="toolchain lua libXpm a52dec libdvbpsi libdca libarchive libmatroska libupnp libmpeg2 xcb-util-keysyms liblivemedia libdc1394 libavc1394 libssh2 libshout libtheora zvbi SDL_image chromaprint ncursesw \
fdk-aac taglib ffmpeg faad2 libmad libXinerama freetype fribidi harfbuzz fontconfig libxml2 libbluray flac librsvg avahi systemd libmtp libdvdcss samba mesa libnfs mpg123 libogg libmodplug libdvdreadv libdvdnavv libgme \
twolame fluidsynth libvpx speex opus libpng libjpeg-turbo x265 x264 libass pulseaudio alsa-lib libsamplerate lirc libtar libmicrodns qt5"
PKG_SECTION="multimedia"
PKG_SHORTDESC="VideoLAN multimedia player and streamer"
PKG_LONGDESC="VLC is the VideoLAN project's media player. It plays MPEG, MPEG2, MPEG4, DivX, MOV, WMV, QuickTime, mp3, Ogg/Vorbis files, DVDs, VCDs, and multimedia streams from various network sources."
PKG_TOOLCHAIN="autotools"

PKG_CONFIGURE_OPTS_TARGET="\
              --prefix=/storage/.kodi/addons/tools.vlc3 \
              --enable-run-as-root \
              --disable-rpath \
              --enable-nls \
              --enable-archive \
              --enable-live555 \
              --disable-dc1394 \
              --disable-dv1394 \
              --enable-dvdread \
              --enable-dvdnav \
              --enable-bluray \
              --disable-opencv \
              --enable-smbclient \
              --disable-sftp \
              --disable-nfs \
              --disable-realrtsp \
              --disable-dvbpsi \
              --enable-gme \
              --enable-ogg \
              --enable-shout \
              --enable-matroska \
              --enable-mod \
              --enable-mpc \
              --enable-mad \
              --enable-mpg123 \
              --enable-gst-decode \
              --enable-avcodec \
              --enable-libva \
              --enable-avformat \
              --enable-postproc \
              --enable-faad \
              --enable-vpx \
              --enable-twolame \
              --enable-fdkaac \
              --enable-a52 \
              --enable-dca \
              --enable-flac \
              --enable-libmpeg2 \
              --enable-vorbis \
              --enable-speex \
              --enable-opus \
              --enable-oggspots \
              --disable-schroedinger \
              --enable-png \
              --enable-jpeg \
              --disable-x262 \
              --enable-x264 \
              --disable-x265 \
              --disable-zvbi \
              --enable-libass \
              --disable-kate \
              --disable-tiger \
              --enable-vdpau \
              --disable-wayland \
              --enable-sdl-image \
              --enable-freetype \
              --enable-fribidi \
              --enable-harfbuzz \
              --enable-fontconfig \
              --enable-svg \
              --enable-svgdec \
              --disable-aa \
              --disable-caca \
              --enable-pulse \
              --enable-alsa \
              --disable-jack \
              --enable-samplerate \
              --enable-soxr \
              --enable-chromaprint \
              --disable-chromecast \
              --enable-qt \
              --enable-skins2 \
              --enable-libtar \
              --enable-ncurses \
              --enable-lirc \
              --disable-goom \
              --disable-projectm \
              --enable-avahi \
              --disable-mtp \
              --enable-upnp \
              --enable-microdns \
              --enable-libxml2 \
              --enable-libgcrypt \
              --disable-gnutls \
              --enable-taglib \
              --disable-secret \
              --disable-kwallet \
              --disable-update-check \
              --disable-notify \
              --disable-libplacebo \
              --disable-fluidsynth \
              --enable-vlc"

pre_configure_target() {

  export TAGLIB_CFLAGS="-I$SYSROOT_PREFIX/usr/include/taglib"
  export LUAC=$SYSROOT_PREFIX/usr/bin/luac
  export LUA_LIBS="-L$SYSROOT_PREFIX/usr/lib -llua -lm"
  export CXXFLAGS+=" -std=c++11"
  export RCC=$TOOLCHAIN/bin/rcc

  PKG_CONFIG_PATH="$(get_build_dir ncursesw)/.install_tmp/usr/lib/pkgconfig"
  CFLAGS="$CFLAGS -I$(get_build_dir ncursesw)/.install_tmp/usr/include"
  LDFLAGS="$LDFLAGS -L$(get_build_dir ncursesw)/.install_tmp/usr/lib"
}

post_install() {
  rm -fR $INSTALL/usr/share/applications
  rm -fR $INSTALL/usr/share/icons
  rm -fR $INSTALL/usr/share/kde4

  mkdir -p $INSTALL/usr/bin
    mv $INSTALL/usr/bin/vlc $INSTALL/usr/bin/vlc.bin
    cp -pR $PKG_DIR/scripts/* $INSTALL/usr/bin

  mkdir -p $INSTALL/usr/share/locale
  for fgmo in `ls $PKG_BUILD/po/*.gmo`;do
    fname=`basename $fgmo .gmo`
    mkdir -p $INSTALL/usr/share/locale/$fname
    mkdir -p $INSTALL/usr/share/locale/$fname/LC_MESSAGES
    cp -p $fgmo $INSTALL/usr/share/locale/$fname/LC_MESSAGES/vlc.mo
  done
}
