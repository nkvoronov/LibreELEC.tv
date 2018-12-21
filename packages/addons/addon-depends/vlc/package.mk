# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="vlc"
PKG_VERSION="3.0.4"
PKG_SHA256="01f3db3790714038c01f5e23c709e31ecd6f1c046ac93d19e1dde38b3fc05a9e"
PKG_LICENSE="GPL"
PKG_SITE="http://www.videolan.org"
PKG_URL="http://download.videolan.org/$PKG_NAME/$PKG_VERSION/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="toolchain a52dec libdvbpsi libxpm libdca lua libmatroska taglib libmatroska ffmpegx faad2 libmad libmpeg2 xcb-util-keysyms libtar libXinerama libarchive qt5 \
fribidi harfbuzz fontconfig libxml2 liblivemedia libbluray flac libdc1394 libavc1394 librsvg libgme twolame avahi systemd libmtp libupnp libmicrodns libdvdcss samba \
libssh2 mesa libnfs mpg123 libdvdread libdvdnav libogg libshout libmodplug libvpx libvorbis speex opus libtheora libpng libjpeg-turbo x265 x264 zvbi libass SDL_image pulseaudio \
alsa-lib libsamplerate lirc chromaprint ncursesw"
PKG_LONGDESC="VLC is the VideoLAN project's media player. It plays MPEG, MPEG2, MPEG4, DivX, MOV, WMV, QuickTime, mp3, Ogg/Vorbis files, DVDs, VCDs, and multimedia streams from various network sources."
PKG_TOOLCHAIN="autotools"

PKG_CONFIGURE_OPTS_TARGET="\
              --prefix=/usr \
              --enable-run-as-root \
              --disable-nls \
              --without-gnu-ld \
              --disable-rpath \
              --disable-archive \
              --enable-live555 \
              --enable-dc1394 \
              --enable-dv1394 \
              --enable-dvdread \
              --enable-dvdnav \
              --enable-bluray \
              --disable-opencv \
              --enable-smbclient \
              --disable-sftp \
              --enable-nfs \
              --disable-realrtsp \
              --enable-dvbpsi \
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
              --disable-fdkaac \
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
              --enable-zvbi \
              --enable-libass \
              --disable-kate \
              --disable-tiger \
              --disable-fluidsynth \
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
              --disable-libgcrypt \
              --disable-gnutls \
              --enable-taglib \
              --disable-secret \
              --disable-kwallet \
              --disable-update-check \
              --disable-notify \
              --disable-libplacebo \
              --enable-vlc \
              --disable-aribsub"

pre_configure_target() {

  export TAGLIB_CFLAGS="-I$SYSROOT_PREFIX/usr/include/taglib"
  export LUAC=$SYSROOT_PREFIX/usr/bin/luac
  export LUA_LIBS="-L$SYSROOT_PREFIX/usr/lib -llua -lm"
  export CXXFLAGS+=" -std=c++11"
  export RCC=$TOOLCHAIN/bin/rcc

  PKG_CONFIG_PATH="$(get_build_dir ncursesw)/.INSTALL_PKG/usr/lib/pkgconfig"
  CFLAGS="$CFLAGS -I$(get_build_dir ncursesw)/.INSTALL_PKG/usr/include"
  LDFLAGS="$LDFLAGS -L$(get_build_dir ncursesw)/.INSTALL_PKG/usr/lib"

  PKG_CONFIG_PATH="$PKG_CONFIG_PATH:$(get_build_dir ffmpegx)/.INSTALL_PKG/usr/local/lib/pkgconfig"
  CFLAGS="$CFLAGS -I$(get_build_dir ffmpegx)/.INSTALL_PKG/usr/local/include"
  LDFLAGS="$LDFLAGS -L$(get_build_dir ffmpegx)/.INSTALL_PKG/usr/local/lib"
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
