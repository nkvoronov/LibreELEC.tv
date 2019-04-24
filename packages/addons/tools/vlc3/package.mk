# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="vlc3"
PKG_VERSION="3.0.6"
PKG_SHA256="18c16d4be0f34861d0aa51fbd274fb87f0cab3b7119757ead93f3db3a1f27ed3"
PKG_REV="61"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.videolan.org"
PKG_URL="http://download.videolan.org/vlc/$PKG_VERSION/vlc-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="toolchain a52dec libdvbpsi libxpm libdca lua libmatroska taglib libmatroska ffmpegx faad2 libmad libmpeg2 xcb-util-keysyms libtar libXinerama libarchive qt5 \
fribidi harfbuzz fontconfig libxml2 liblivemedia libbluray flac libdc1394 libavc1394 librsvg libgme twolame avahi systemd libmtp libupnp libmicrodns libdvdcss samba fluidsynth \
libssh2 mesa libnfs mpg123 libdvdread libdvdnav libogg libshout libmodplug libvpx libvorbis speex opus libtheora libpng libjpeg-turbo x265 x264 zvbi libass SDL_image pulseaudio \
alsa-lib libsamplerate lirc chromaprint ncursesw libgoom2 gnutls"
PKG_SECTION="tools"
PKG_SHORTDESC="VLC (Version: $PKG_VERSION): is VideoLAN multimedia player and streamer"
PKG_LONGDESC="VLC (Version: $PKG_VERSION): is the VideoLAN project's media player. It plays MPEG, MPEG2, MPEG4, DivX, MOV, WMV, QuickTime, mp3, Ogg/Vorbis files, DVDs, VCDs, and multimedia streams from various network sources."
PKG_TOOLCHAIN="autotools"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="Vlc Player 3"
PKG_ADDON_TYPE="xbmc.python.script"

VLC_PREFIX="/storage/.kodi/addons/tools.vlc3"
QT5VWER="5.12.0"

PKG_CONFIGURE_OPTS_TARGET="\
              --prefix=$VLC_PREFIX \
              --datarootdir=$VLC_PREFIX/share \
              --localedir=$VLC_PREFIX/share/locale \
              --enable-run-as-root \
              --disable-rpath \
              --enable-nls \
              --enable-archive \
              --enable-live555 \
              --enable-dc1394 \
              --enable-dv1394 \
              --enable-dvdread \
              --enable-dvdnav \
              --enable-bluray \
              --disable-opencv \
              --enable-smbclient \
              --enable-sftp \
              --enable-nfs \
              --enable-realrtsp \
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
              --enable-x265 \
              --enable-zvbi \
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
              --enable-goom \
              --disable-projectm \
              --enable-avahi \
              --enable-mtp \
              --enable-upnp \
              --enable-microdns \
              --enable-libxml2 \
              --disable-libgcrypt \
              --enable-gnutls \
              --enable-taglib \
              --disable-secret \
              --disable-kwallet \
              --disable-update-check \
              --disable-notify \
              --disable-libplacebo \
              --enable-vlc \
              --disable-aribsub \
              --enable-aom \
              --disable-srt \
              --disable-dav1d"

pre_configure_target() {

  cd $PKG_BUILD
  rm -rf .$TARGET_NAME

  export TAGLIB_CFLAGS="-I$SYSROOT_PREFIX/usr/include/taglib"
  export X265_CFLAGS="-I$SYSROOT_PREFIX/usr/local/include"
  export X265_LIBS="-L$SYSROOT_PREFIX/usr/local/lib -lx265"
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

  PKG_CONFIG_PATH="$PKG_CONFIG_PATH:$(get_build_dir gnutls)/.INSTALL_PKG/usr/lib/pkgconfig"
  CFLAGS="$CFLAGS -I$(get_build_dir gnutls)/.INSTALL_PKG/usr/include"
  LDFLAGS="$LDFLAGS -L$(get_build_dir gnutls)/.INSTALL_PKG/usr/lib"
}

addon() {
  QT5=$(get_build_dir qt5)
  LUA=$(get_build_dir lua)
  LIB_SDL=$(get_build_dir SDL)
  LIB_SDL_IMG=$(get_build_dir SDL_image)
  LIB_EBML=$(get_build_dir libebml)
  LIB_MATROSKA=$(get_build_dir libmatroska)
  LIB_CHROMA=$(get_build_dir chromaprint)
  LIB_NCURSESW=$(get_build_dir ncursesw)
  LIB_ICE=$(get_build_dir libICE)
  LIB_SM=$(get_build_dir libSM)
  LIB_XRENDER=$(get_build_dir libXrender)
  GCC_DIR=$(get_build_dir gcc)
  LIB_XPM=$(get_build_dir libxpm)
  LIB_DVDREAD=$(get_build_dir libdvdread)
  LIB_DVDNAV=$(get_build_dir libdvdnav)
  LIB_GME=$(get_build_dir libgme)
  LIB_MDN=$(get_build_dir libmicrodns)
  LIB_MPEG2=$(get_build_dir libmpeg2)
  LIB_TWOLAME=$(get_build_dir twolame)
  LIB_UPNP=$(get_build_dir libupnp)
  LIB_TAR=$(get_build_dir libtar)
  LIB_ARCHIVE=$(get_build_dir libarchive)
  LIB_PULS=$(get_build_dir pulseaudio)
  LIB_XKBC=$(get_build_dir libxkbcommon)
  LIB_A52=$(get_build_dir a52dec)
  LIB_AVC1394=$(get_build_dir libavc1394)
  LIB_DC1394=$(get_build_dir libdc1394)
  LIB_RAW1394=$(get_build_dir libraw1394)
  LIB_DCA=$(get_build_dir libdca)
  LIB_MAD=$(get_build_dir libmad)
  LIB_MTP=$(get_build_dir libmtp)
  LIB_MPG123=$(get_build_dir mpg123)
  LIB_SAMPLERATE=$(get_build_dir libsamplerate)
  LIB_THEORA=$(get_build_dir libtheora)
  LIB_ZVBI=$(get_build_dir zvbi)
  LIB_FAAD2=$(get_build_dir faad2)
  LIB_FLUID=$(get_build_dir fluidsynth)
  LIB_SHOUT=$(get_build_dir libshout)
  LIB_DVBPSI=$(get_build_dir libdvbpsi)
  LIB_X265=$(get_build_dir x265)
  LIB_GOOM=$(get_build_dir libgoom2)
  LIB_GNUTLS=$(get_build_dir gnutls)
  LIB_NETTLE=$(get_build_dir nettle)
  LIB_IDN2=$(get_build_dir libidn2)
  LIB_GMP=$(get_build_dir gmp)

  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/bin
    cp -P $LUA/src/lua $ADDON_BUILD/$PKG_ADDON_ID/bin
    cp -P $LUA/src/luac $ADDON_BUILD/$PKG_ADDON_ID/bin
    chmod +x $ADDON_BUILD/$PKG_ADDON_ID/bin/*

  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/data
    cp -P $PKG_BUILD/.install_pkg/usr/bin/vlc $ADDON_BUILD/$PKG_ADDON_ID/data/vlc.bin
    chmod +x $ADDON_BUILD/$PKG_ADDON_ID/data/*.bin

  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/lib
    cp -P $PKG_BUILD/.install_pkg/usr/lib/libvlc.so.5.6.0 $ADDON_BUILD/$PKG_ADDON_ID/lib/libvlc.so.5
    cp -P $PKG_BUILD/.install_pkg/usr/lib/libvlccore.so.9.0.0 $ADDON_BUILD/$PKG_ADDON_ID/lib/libvlccore.so.9

  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/lib/vlc
    cp -P $PKG_BUILD/.install_pkg/usr/lib/vlc/libvlc_pulse.so.0.0.0 $ADDON_BUILD/$PKG_ADDON_ID/lib/vlc/libvlc_pulse.so.0
    cp -P $PKG_BUILD/.install_pkg/usr/lib/vlc/libvlc_vdpau.so.0.0.0 $ADDON_BUILD/$PKG_ADDON_ID/lib/vlc/libvlc_vdpau.so.0
    cp -P $PKG_BUILD/.install_pkg/usr/lib/vlc/libvlc_xcb_events.so.0.0.0 $ADDON_BUILD/$PKG_ADDON_ID/lib/vlc/libvlc_xcb_events.so.0
    cp -P $PKG_BUILD/.install_pkg/usr/lib/vlc/vlc-cache-gen $ADDON_BUILD/$PKG_ADDON_ID/lib/vlc/vlc-cache-gen

  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/lib/vlc/lua
    cp -R $PKG_BUILD/.install_pkg/usr/lib/vlc/lua/* $ADDON_BUILD/$PKG_ADDON_ID/lib/vlc/lua

  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/lib/vlc/plugins
    cp -R $PKG_BUILD/.install_pkg/usr/lib/vlc/plugins/* $ADDON_BUILD/$PKG_ADDON_ID/lib/vlc/plugins

    cp -P $LUA/src/liblua.so.5.3.5 $ADDON_BUILD/$PKG_ADDON_ID/lib/liblua.so.5.3
    cp -P $QT5/qtbase/lib/libQt5Concurrent.so.$QT5VWER $ADDON_BUILD/$PKG_ADDON_ID/lib/libQt5Concurrent.so.5
    cp -P $QT5/qtbase/lib/libQt5Core.so.$QT5VWER $ADDON_BUILD/$PKG_ADDON_ID/lib/libQt5Core.so.5
    cp -P $QT5/qtbase/lib/libQt5DBus.so.$QT5VWER $ADDON_BUILD/$PKG_ADDON_ID/lib/libQt5DBus.so.5
    cp -P $QT5/qtbase/lib/libQt5EglFSDeviceIntegration.so.$QT5VWER $ADDON_BUILD/$PKG_ADDON_ID/lib/libQt5EglFSDeviceIntegration.so.5
    cp -P $QT5/qtbase/lib/libQt5EglFsKmsSupport.so.$QT5VWER $ADDON_BUILD/$PKG_ADDON_ID/lib/libQt5EglFsKmsSupport.so.5
    cp -P $QT5/qtbase/lib/libQt5Gui.so.$QT5VWER $ADDON_BUILD/$PKG_ADDON_ID/lib/libQt5Gui.so.5
    cp -P $QT5/qtbase/lib/libQt5Network.so.$QT5VWER $ADDON_BUILD/$PKG_ADDON_ID/lib/libQt5Network.so.5
    cp -P $QT5/qtbase/lib/libQt5OpenGL.so.$QT5VWER $ADDON_BUILD/$PKG_ADDON_ID/lib/libQt5OpenGL.so.5
    cp -P $QT5/qtbase/lib/libQt5PrintSupport.so.$QT5VWER $ADDON_BUILD/$PKG_ADDON_ID/lib/libQt5PrintSupport.so.5
    cp -P $QT5/qtbase/lib/libQt5Sql.so.$QT5VWER $ADDON_BUILD/$PKG_ADDON_ID/lib/libQt5Sql.so.5
    cp -P $QT5/qtbase/lib/libQt5Test.so.$QT5VWER $ADDON_BUILD/$PKG_ADDON_ID/lib/libQt5Test.so.5
    cp -P $QT5/qtbase/lib/libQt5Widgets.so.$QT5VWER $ADDON_BUILD/$PKG_ADDON_ID/lib/libQt5Widgets.so.5
    cp -P $QT5/qtbase/lib/libQt5XcbQpa.so.$QT5VWER $ADDON_BUILD/$PKG_ADDON_ID/lib/libQt5XcbQpa.so.5
    cp -P $QT5/qtbase/lib/libQt5Xml.so.$QT5VWER $ADDON_BUILD/$PKG_ADDON_ID/lib/libQt5Xml.so.5
    cp -P $QT5/qtsvg/lib/libQt5Svg.so.$QT5VWER $ADDON_BUILD/$PKG_ADDON_ID/lib/libQt5Svg.so.5
    cp -P $QT5/qtx11extras/lib/libQt5X11Extras.so.$QT5VWER $ADDON_BUILD/$PKG_ADDON_ID/lib/libQt5X11Extras.so.5

  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/lib/plugins
    cp -PR $QT5/qtbase/plugins/* $ADDON_BUILD/$PKG_ADDON_ID/lib/plugins
    cp -PR $QT5/qtsvg/plugins/* $ADDON_BUILD/$PKG_ADDON_ID/lib/plugins

    cp -P $LIB_SDL/.install_pkg/usr/lib/libSDL-1.2.so.0.11.4 $ADDON_BUILD/$PKG_ADDON_ID/lib/libSDL-1.2.so.0
    cp -P $LIB_SDL_IMG/.install_pkg/usr/lib/libSDL_image.so.0.8.4 $ADDON_BUILD/$PKG_ADDON_ID/lib/libSDL_image.so.0
    cp -P $LIB_EBML/.install_pkg/usr/lib/libebml.so.4.0.0 $ADDON_BUILD/$PKG_ADDON_ID/lib/libebml.so.4
    cp -P $LIB_MATROSKA/.install_pkg/usr/lib/libmatroska.so.6.0.0 $ADDON_BUILD/$PKG_ADDON_ID/lib/libmatroska.so.6
    cp -P $LIB_CHROMA/.install_pkg/usr/lib/libchromaprint.so.1.4.3 $ADDON_BUILD/$PKG_ADDON_ID/lib/libchromaprint.so.1
    cp -P $LIB_NCURSESW/.INSTALL_PKG/usr/lib/libncursesw.so.6.1 $ADDON_BUILD/$PKG_ADDON_ID/lib/libncursesw.so.6
    cp -P $LIB_NCURSESW/.INSTALL_PKG/usr/lib/libformw.so.6.1 $ADDON_BUILD/$PKG_ADDON_ID/lib/libformw.so.6
    cp -P $LIB_NCURSESW/.INSTALL_PKG/usr/lib/libmenuw.so.6.1 $ADDON_BUILD/$PKG_ADDON_ID/lib/libmenuw.so.6
    cp -P $LIB_NCURSESW/.INSTALL_PKG/usr/lib/libpanelw.so.6.1 $ADDON_BUILD/$PKG_ADDON_ID/lib/libpanelw.so.6
    cp -P $LIB_NCURSESW/.INSTALL_PKG/usr/lib/libtinfo.so.6.1 $ADDON_BUILD/$PKG_ADDON_ID/lib/libtinfo.so.6
    cp -P $LIB_ICE/.install_pkg/usr/lib/libICE.so.6.3.0 $ADDON_BUILD/$PKG_ADDON_ID/lib/libICE.so.6
    cp -P $LIB_SM/.install_pkg/usr/lib/libSM.so.6.0.1 $ADDON_BUILD/$PKG_ADDON_ID/lib/libSM.so.6
    cp -P $LIB_XPM/.install_pkg/usr/lib/libXpm.so.4.11.0 $ADDON_BUILD/$PKG_ADDON_ID/lib/libXpm.so.4
    cp -P $LIB_XRENDER/.install_pkg/usr/lib/libXrender.so.1.3.0 $ADDON_BUILD/$PKG_ADDON_ID/lib/libXrender.so.1
    cp -P $LIB_DVDREAD/.install_pkg/usr/lib/libdvdread.so.4.2.0 $ADDON_BUILD/$PKG_ADDON_ID/lib/libdvdread.so.4
    cp -P $LIB_DVDNAV/.install_pkg/usr/lib/libdvdnav.so.4.2.0 $ADDON_BUILD/$PKG_ADDON_ID/lib/libdvdnav.so.4
    cp -P $LIB_GME/.install_pkg/usr/lib/libgme.so.0.6.2 $ADDON_BUILD/$PKG_ADDON_ID/lib/libgme.so.0
    cp -P $LIB_MDN/.install_pkg/usr/lib/libmicrodns.so.0.0.0 $ADDON_BUILD/$PKG_ADDON_ID/lib/libmicrodns.so.0
    cp -P $LIB_MPEG2/.install_pkg/usr/lib/libmpeg2.so.0.1.0 $ADDON_BUILD/$PKG_ADDON_ID/lib/libmpeg2.so.0
    cp -P $LIB_MPEG2/.install_pkg/usr/lib/libmpeg2convert.so.0.0.0 $ADDON_BUILD/$PKG_ADDON_ID/lib/libmpeg2convert.so.0
    cp -P $LIB_TWOLAME/.install_pkg/usr/lib/libtwolame.so.0.0.0 $ADDON_BUILD/$PKG_ADDON_ID/lib/libtwolame.so.0
    cp -P $LIB_UPNP/.install_pkg/usr/lib/libixml.so.2.0.8 $ADDON_BUILD/$PKG_ADDON_ID/lib/libixml.so.2
    cp -P $LIB_UPNP/.install_pkg/usr/lib/libthreadutil.so.6.0.4 $ADDON_BUILD/$PKG_ADDON_ID/lib/libthreadutil.so.6
    cp -P $LIB_UPNP/.install_pkg/usr/lib/libupnp.so.6.4.1 $ADDON_BUILD/$PKG_ADDON_ID/lib/libupnp.so.6
    cp -P $LIB_TAR/.install_pkg/usr/lib/libtar.so.0.0.0 $ADDON_BUILD/$PKG_ADDON_ID/lib/libtar.so.0
    cp -P $LIB_ARCHIVE/.install_pkg/usr/lib/libarchive.so.13.3.3 $ADDON_BUILD/$PKG_ADDON_ID/lib/libarchive.so.13
    cp -P $LIB_PULS/.install_pkg/usr/lib/pulseaudio/libpulsecommon-12.2.so $ADDON_BUILD/$PKG_ADDON_ID/lib/libpulsecommon-12.2.so
    cp -P $LIB_XKBC/.install_pkg/usr/lib/libxkbcommon.so.0.0.0 $ADDON_BUILD/$PKG_ADDON_ID/lib/libxkbcommon.so.0
    cp -P $LIB_XKBC/.install_pkg/usr/lib/libxkbcommon-x11.so.0.0.0 $ADDON_BUILD/$PKG_ADDON_ID/lib/libxkbcommon-x11.so.0

    cp -P $LIB_A52/.install_pkg/usr/lib/liba52.so.0.0.0 $ADDON_BUILD/$PKG_ADDON_ID/lib/liba52.so.0
    cp -P $LIB_AVC1394/.install_pkg/usr/lib/libavc1394.so.0.3.0 $ADDON_BUILD/$PKG_ADDON_ID/lib/libavc1394.so.0
    cp -P $LIB_AVC1394/.install_pkg/usr/lib/librom1394.so.0.3.0 $ADDON_BUILD/$PKG_ADDON_ID/lib/librom1394.so.0
    cp -P $LIB_DC1394/.install_pkg/usr/lib/libdc1394.so.22.2.1 $ADDON_BUILD/$PKG_ADDON_ID/lib/libdc1394.so.22
    cp -P $LIB_RAW1394/.install_pkg/usr/lib/libraw1394.so.11.1.0 $ADDON_BUILD/$PKG_ADDON_ID/lib/libraw1394.so.11
    cp -P $LIB_DCA/.install_pkg/usr/lib/libdca.so.0.0.0 $ADDON_BUILD/$PKG_ADDON_ID/lib/libdca.so.0
    cp -P $LIB_MAD/.install_pkg/usr/lib/libmad.so.0.2.1 $ADDON_BUILD/$PKG_ADDON_ID/lib/libmad.so.0
    cp -P $LIB_MTP/.install_pkg/usr/lib/libmtp.so.9.4.0 $ADDON_BUILD/$PKG_ADDON_ID/lib/libmtp.so.9
    cp -P $LIB_MPG123/.install_pkg/usr/lib/libmpg123.so.0.44.8 $ADDON_BUILD/$PKG_ADDON_ID/lib/libmpg123.so.0
    cp -P $LIB_SAMPLERATE/.install_pkg/usr/lib/libsamplerate.so.0.1.8 $ADDON_BUILD/$PKG_ADDON_ID/lib/libsamplerate.so.0
    cp -P $LIB_THEORA/.install_pkg/usr/lib/libtheora.so.0.3.10 $ADDON_BUILD/$PKG_ADDON_ID/lib/libtheora.so.0
    cp -P $LIB_THEORA/.install_pkg/usr/lib/libtheoradec.so.1.1.4 $ADDON_BUILD/$PKG_ADDON_ID/lib/libtheoradec.so.1
    cp -P $LIB_THEORA/.install_pkg/usr/lib/libtheoraenc.so.1.1.2 $ADDON_BUILD/$PKG_ADDON_ID/lib/libtheoraenc.so.1
    cp -P $LIB_ZVBI/.install_pkg/usr/lib/libzvbi.so.0.13.2 $ADDON_BUILD/$PKG_ADDON_ID/lib/libzvbi.so.0
    cp -P $LIB_FAAD2/.install_pkg/usr/lib/libfaad.so.2.0.0 $ADDON_BUILD/$PKG_ADDON_ID/lib/libfaad.so.2
    cp -P $LIB_FLUID/.install_pkg/usr/lib/libfluidsynth.so.1.5.2 $ADDON_BUILD/$PKG_ADDON_ID/lib/libfluidsynth.so.1
    cp -P $LIB_SHOUT/.install_pkg/usr/lib/libshout.so.3.2.0 $ADDON_BUILD/$PKG_ADDON_ID/lib/libshout.so.3
    cp -P $LIB_DVBPSI/.install_pkg/usr/lib/libdvbpsi.so.10.0.0 $ADDON_BUILD/$PKG_ADDON_ID/lib/libdvbpsi.so.10
    cp -P $LIB_X265/.install_pkg/usr/local/lib/libx265.so.165 $ADDON_BUILD/$PKG_ADDON_ID/lib/libx265.so.165
    cp -P $LIB_GOOM/.install_pkg/usr/lib/libgoom2.so.0.0.0 $ADDON_BUILD/$PKG_ADDON_ID/lib/libgoom2.so.0

    cp -P $LIB_GNUTLS/.INSTALL_PKG/usr/lib/libgnutls.so.30.23.0 $ADDON_BUILD/$PKG_ADDON_ID/lib/libgnutls.so.30
    cp -P $LIB_NETTLE/.install_pkg/usr/lib/libnettle.so.6.5 $ADDON_BUILD/$PKG_ADDON_ID/lib/libnettle.so.6
    cp -P $LIB_NETTLE/.install_pkg/usr/lib/libhogweed.so.4.5 $ADDON_BUILD/$PKG_ADDON_ID/lib/libhogweed.so.4
    cp -P $LIB_IDN2/.install_pkg/usr/lib/libidn2.so.4.0.0 $ADDON_BUILD/$PKG_ADDON_ID/lib/libidn2.so.4
    cp -P $LIB_GMP/.install_pkg/usr/lib/libgmp.so.10.3.2 $ADDON_BUILD/$PKG_ADDON_ID/lib/libgmp.so.10

  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/share
    cp -R $LIB_NCURSESW/.INSTALL_PKG/usr/share/* $ADDON_BUILD/$PKG_ADDON_ID/share

  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/share/vlc
    cp -R $PKG_BUILD/.install_pkg$VLC_PREFIX/share/vlc/* $ADDON_BUILD/$PKG_ADDON_ID/share/vlc/

  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/share/locale
    cp -R $PKG_BUILD/.install_pkg$VLC_PREFIX/share/locale/* $ADDON_BUILD/$PKG_ADDON_ID/share/locale/

}
