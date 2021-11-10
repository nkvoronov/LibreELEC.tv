# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="vlc3"
PKG_VERSION="3.0.16"
PKG_SHA256="ffae35fc64f625c175571d2346bc5f6207be99762517f15423e74f18399410f6"
PKG_REV="86"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.videolan.org"
PKG_URL="http://download.videolan.org/vlc/${PKG_VERSION}/vlc-${PKG_VERSION}.tar.xz"
PKG_DEPENDS_TARGET="toolchain a52dec libdvbpsi libxpm libdca lua libmatroska taglib libmatroska ffmpegx faad2 libmad libmpeg2 xcb-util-keysyms libtar libXinerama libarchive qt5 \
fribidi harfbuzz fontconfig libxml2 liblivemedia libbluray flac libdc1394 libavc1394 librsvg libgme twolame avahi systemd libmtp libupnp libdvdcss samba fluidsynth \
libssh2 mesa libnfs mpg123 libdvdread libdvdnav libogg libshout libmodplug libvpx libvorbis speex opus libtheora libpng libjpeg-turbo x265 x264 zvbi libass SDL_image pulseaudio \
alsa-lib libsamplerate lirc chromaprint ncursesw libgoom2 gnutls"
PKG_SECTION="tools"
PKG_SHORTDESC="VLC (Version: ${PKG_VERSION}): is VideoLAN multimedia player and streamer"
PKG_LONGDESC="VLC (Version: ${PKG_VERSION}): is the VideoLAN project's media player. It plays MPEG, MPEG2, MPEG4, DivX, MOV, WMV, QuickTime, mp3, Ogg/Vorbis files, DVDs, VCDs, and multimedia streams from various network sources."
PKG_TOOLCHAIN="autotools"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="Vlc Player 3"
PKG_ADDON_TYPE="xbmc.python.script"

VLC_PREFIX="/storage/.kodi/addons/tools.vlc3"
QT5VER="5.15.2"

PKG_CONFIGURE_OPTS_TARGET="\
              --prefix=${VLC_PREFIX} \
              --datarootdir=${VLC_PREFIX}/share \
              --localedir=${VLC_PREFIX}/share/locale \
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
              --disable-sftp \
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
              --disable-microdns \
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

  cd ${PKG_BUILD}
  rm -rf .${TARGET_NAME}

  export TAGLIB_CFLAGS="-I${SYSROOT_PREFIX}/usr/include/taglib"
  export X265_CFLAGS="-I${SYSROOT_PREFIX}/usr/local/include"
  export X265_LIBS="-L${SYSROOT_PREFIX}/usr/local/lib -lx265"
  export LUAC=${SYSROOT_PREFIX}/usr/bin/luac
  export LUA_LIBS="-L${SYSROOT_PREFIX}/usr/lib -llua -lm"
  export CXXFLAGS+=" -std=c++11"
  export RCC=${TOOLCHAIN}/bin/rcc

  PKG_CONFIG_PATH="$(get_build_dir ncursesw)/.INSTALL_PKG/usr/lib/pkgconfig"
  CFLAGS="${CFLAGS} -I$(get_build_dir ncursesw)/.INSTALL_PKG/usr/include"
  LDFLAGS="${LDFLAGS} -L$(get_build_dir ncursesw)/.INSTALL_PKG/usr/lib"

  PKG_CONFIG_PATH="${PKG_CONFIG_PATH}:$(get_install_dir ffmpegx)/usr/local/lib/pkgconfig"
  CFLAGS="${CFLAGS} -I$(get_install_dir ffmpegx)/usr/local/include"
  LDFLAGS="${LDFLAGS} -L$(get_install_dir ffmpegx)/usr/local/lib"

  PKG_CONFIG_PATH="${PKG_CONFIG_PATH}:$(get_install_dir gnutls)/usr/lib/pkgconfig"
  CFLAGS="${CFLAGS} -I$(get_install_dir gnutls)/usr/include"
  LDFLAGS="${LDFLAGS} -L$(get_install_dir gnutls)/usr/lib"
}

addon() {
  mkdir -p ${ADDON_BUILD}/${PKG_ADDON_ID}/bin
    cp -P $(get_build_dir lua)/src/lua ${ADDON_BUILD}/${PKG_ADDON_ID}/bin
    cp -P $(get_build_dir lua)/src/luac ${ADDON_BUILD}/${PKG_ADDON_ID}/bin
    chmod +x ${ADDON_BUILD}/${PKG_ADDON_ID}/bin/*

  mkdir -p ${ADDON_BUILD}/${PKG_ADDON_ID}/data
    cp -P $(get_install_dir vlc3)/usr/bin/vlc ${ADDON_BUILD}/${PKG_ADDON_ID}/data/vlc.bin
    chmod +x ${ADDON_BUILD}/${PKG_ADDON_ID}/data/*.bin

  mkdir -p ${ADDON_BUILD}/${PKG_ADDON_ID}/lib
    cp -P $(get_install_dir vlc3)/usr/lib/libvlc.so.5.6.0 ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/libvlc.so.5
    cp -P $(get_install_dir vlc3)/usr/lib/libvlccore.so.9.0.0 ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/libvlccore.so.9

  mkdir -p ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/vlc
    cp -P $(get_install_dir vlc3)/usr/lib/vlc/libvlc_pulse.so.0.0.0 ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/vlc/libvlc_pulse.so.0
    cp -P $(get_install_dir vlc3)/usr/lib/vlc/libvlc_vdpau.so.0.0.0 ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/vlc/libvlc_vdpau.so.0
    cp -P $(get_install_dir vlc3)/usr/lib/vlc/libvlc_xcb_events.so.0.0.0 ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/vlc/libvlc_xcb_events.so.0
    cp -P $(get_install_dir vlc3)/usr/lib/vlc/vlc-cache-gen ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/vlc/vlc-cache-gen

  mkdir -p ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/vlc/lua
    cp -R $(get_install_dir vlc3)/usr/lib/vlc/lua/* ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/vlc/lua

  mkdir -p ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/vlc/plugins
    cp -R $(get_install_dir vlc3)/usr/lib/vlc/plugins/* ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/vlc/plugins

    cp -P $(get_build_dir lua)/src/liblua.so.5.4.3 ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/liblua.so.5.4

    cp -P $(get_build_dir qt5)/qtbase/lib/libQt5Concurrent.so.${QT5VER} ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/libQt5Concurrent.so.5
    cp -P $(get_build_dir qt5)/qtbase/lib/libQt5Core.so.${QT5VER} ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/libQt5Core.so.5
    cp -P $(get_build_dir qt5)/qtbase/lib/libQt5DBus.so.${QT5VER} ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/libQt5DBus.so.5
    cp -P $(get_build_dir qt5)/qtbase/lib/libQt5EglFSDeviceIntegration.so.${QT5VER} ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/libQt5EglFSDeviceIntegration.so.5
    cp -P $(get_build_dir qt5)/qtbase/lib/libQt5EglFsKmsSupport.so.${QT5VER} ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/libQt5EglFsKmsSupport.so.5
    cp -P $(get_build_dir qt5)/qtbase/lib/libQt5Gui.so.${QT5VER} ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/libQt5Gui.so.5
    cp -P $(get_build_dir qt5)/qtbase/lib/libQt5Network.so.${QT5VER} ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/libQt5Network.so.5
    cp -P $(get_build_dir qt5)/qtbase/lib/libQt5OpenGL.so.${QT5VER} ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/libQt5OpenGL.so.5
    cp -P $(get_build_dir qt5)/qtbase/lib/libQt5PrintSupport.so.${QT5VER} ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/libQt5PrintSupport.so.5
    cp -P $(get_build_dir qt5)/qtbase/lib/libQt5Sql.so.${QT5VER} ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/libQt5Sql.so.5
    cp -P $(get_build_dir qt5)/qtbase/lib/libQt5Test.so.${QT5VER} ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/libQt5Test.so.5
    cp -P $(get_build_dir qt5)/qtbase/lib/libQt5Widgets.so.${QT5VER} ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/libQt5Widgets.so.5
    cp -P $(get_build_dir qt5)/qtbase/lib/libQt5XcbQpa.so.${QT5VER} ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/libQt5XcbQpa.so.5
    cp -P $(get_build_dir qt5)/qtbase/lib/libQt5Xml.so.${QT5VER} ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/libQt5Xml.so.5
    cp -P $(get_build_dir qt5)/qtsvg/lib/libQt5Svg.so.${QT5VER} ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/libQt5Svg.so.5
    cp -P $(get_build_dir qt5)/qtx11extras/lib/libQt5X11Extras.so.${QT5VER} ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/libQt5X11Extras.so.5

  mkdir -p ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/plugins
    cp -PR $(get_build_dir qt5)/qtbase/plugins/* ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/plugins
    cp -PR $(get_build_dir qt5)/qtsvg/plugins/* ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/plugins

    cp -P $(get_install_dir SDL)/usr/lib/libSDL-1.2.so.0.11.4 ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/libSDL-1.2.so.0
    cp -P $(get_install_dir SDL_image)/usr/lib/libSDL_image.so.0.8.4 ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/libSDL_image.so.0
    cp -P $(get_install_dir libebml)/usr/lib/libebml.so.5.0.0 ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/libebml.so.5
    cp -P $(get_install_dir libmatroska)/usr/lib/libmatroska.so.7.0.0 ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/libmatroska.so.7
    cp -P $(get_install_dir chromaprint)/usr/lib/libchromaprint.so.1.5.0 ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/libchromaprint.so.1
    cp -P $(get_build_dir ncursesw)/.INSTALL_PKG/usr/lib/libncursesw.so.6.1 ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/libncursesw.so.6
    cp -P $(get_build_dir ncursesw)/.INSTALL_PKG/usr/lib/libformw.so.6.1 ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/libformw.so.6
    cp -P $(get_build_dir ncursesw)/.INSTALL_PKG/usr/lib/libmenuw.so.6.1 ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/libmenuw.so.6
    cp -P $(get_build_dir ncursesw)/.INSTALL_PKG/usr/lib/libpanelw.so.6.1 ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/libpanelw.so.6
    cp -P $(get_build_dir ncursesw)/.INSTALL_PKG/usr/lib/libtinfo.so.6.1 ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/libtinfo.so.6
    cp -P $(get_install_dir libICE)/usr/lib/libICE.so.6.3.0 ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/libICE.so.6
    cp -P $(get_install_dir libSM)/usr/lib/libSM.so.6.0.1 ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/libSM.so.6
    cp -P $(get_install_dir libxpm)/usr/lib/libXpm.so.4.11.0 ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/libXpm.so.4
    cp -P $(get_install_dir libXrender)/usr/lib/libXrender.so.1.3.0 ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/libXrender.so.1
    cp -P $(get_install_dir libdvdread)/usr/lib/libdvdread.so.8.0.0 ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/libdvdread.so.8
    cp -P $(get_install_dir libdvdnav)/usr/lib/libdvdnav.so.4.3.0 ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/libdvdnav.so.4
    cp -P $(get_install_dir libgme)/usr/lib/libgme.so.0.6.3 ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/libgme.so.0
    cp -P $(get_install_dir libmpeg2)/usr/lib/libmpeg2.so.0.1.0 ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/libmpeg2.so.0
    cp -P $(get_install_dir libmpeg2)/usr/lib/libmpeg2convert.so.0.0.0 ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/libmpeg2convert.so.0
    cp -P $(get_install_dir twolame)/usr/lib/libtwolame.so.0.0.0 ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/libtwolame.so.0
    cp -P $(get_install_dir libupnp)/usr/lib/libixml.so.11.0.1 ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/libixml.so.11
    cp -P $(get_install_dir libupnp)/usr/lib/libupnp.so.17.0.5 ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/libupnp.so.17
    cp -P $(get_install_dir libtar)/usr/lib/libtar.so.0.0.0 ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/libtar.so.0
    cp -P $(get_install_dir libarchive)/usr/lib/libarchive.so.18 ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/libarchive.so.18
    cp -P $(get_install_dir pulseaudio)/usr/lib/pulseaudio/libpulsecommon-14.2.so ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/libpulsecommon-14.2.so
    cp -P $(get_install_dir libxkbcommon)/usr/lib/libxkbcommon.so.0.0.0 ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/libxkbcommon.so.0
    cp -P $(get_install_dir libxkbcommon)/usr/lib/libxkbcommon-x11.so.0.0.0 ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/libxkbcommon-x11.so.0
    cp -P $(get_install_dir a52dec)/usr/lib/liba52.so.0.0.0 ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/liba52.so.0
    cp -P $(get_install_dir libavc1394)/usr/lib/libavc1394.so.0.3.0 ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/libavc1394.so.0
    cp -P $(get_install_dir libavc1394)/usr/lib/librom1394.so.0.3.0 ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/librom1394.so.0
    cp -P $(get_install_dir libdc1394)/usr/lib/libdc1394.so.25.0.0 ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/libdc1394.so.25
    cp -P $(get_install_dir libraw1394)/usr/lib/libraw1394.so.11.1.0 ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/libraw1394.so.11
    cp -P $(get_install_dir libdca)/usr/lib/libdca.so.0.0.0 ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/libdca.so.0
    cp -P $(get_install_dir libmad)/usr/lib/libmad.so.0.2.1 ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/libmad.so.0
    cp -P $(get_install_dir libmtp)/usr/lib/libmtp.so.9.4.0 ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/libmtp.so.9
    cp -P $(get_install_dir mpg123)/usr/lib/libmpg123.so.0.46.1 ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/libmpg123.so.0
    cp -P $(get_install_dir libsamplerate)/usr/lib/libsamplerate.so.0.1.8 ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/libsamplerate.so.0
    cp -P $(get_install_dir libtheora)/usr/lib/libtheora.so.0.3.10 ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/libtheora.so.0
    cp -P $(get_install_dir libtheora)/usr/lib/libtheoradec.so.1.1.4 ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/libtheoradec.so.1
    cp -P $(get_install_dir libtheora)/usr/lib/libtheoraenc.so.1.1.2 ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/libtheoraenc.so.1
    cp -P $(get_install_dir zvbi)/usr/lib/libzvbi.so.0.13.2 ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/libzvbi.so.0
    cp -P $(get_install_dir faad2)/usr/lib/libfaad.so.2.0.0 ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/libfaad.so.2
    cp -P $(get_install_dir fluidsynth)/usr/lib/libfluidsynth.so.3.0.3 ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/libfluidsynth.so.3
    cp -P $(get_install_dir libshout)/usr/lib/libshout.so.3.2.0 ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/libshout.so.3
    cp -P $(get_install_dir libdvbpsi)/usr/lib/libdvbpsi.so.10.0.0 ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/libdvbpsi.so.10
    cp -P $(get_install_dir x265)/usr/lib/libx265.so.199 ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/libx265.so.199
    cp -P $(get_install_dir libgoom2)/usr/lib/libgoom2.so.0.0.0 ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/libgoom2.so.0
    cp -P $(get_install_dir gnutls)/usr/lib/libgnutls.so.30.29.1 ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/libgnutls.so.30
    cp -P $(get_install_dir nettle)/usr/lib/libnettle.so.8.3 ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/libnettle.so.8
    cp -P $(get_install_dir nettle)/usr/lib/libhogweed.so.6.3 ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/libhogweed.so.6
    cp -P $(get_install_dir libidn2)/usr/lib/libidn2.so.0.3.7 ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/libidn2.so.0
    cp -P $(get_install_dir gmp)/usr/lib/libgmp.so.10.4.1 ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/libgmp.so.10
    cp -P $(get_install_dir libXft)/usr/lib/libXft.so.2.3.4 ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/libXft.so.2
    cp -P $(get_install_dir cairo)/usr/lib/libcairo.so.2.11704.0 ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/libcairo.so.2
    cp -P $(get_install_dir cairo)/usr/lib/libcairo-script-interpreter.so.2.11704.0 ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/libcairo-script-interpreter.so.2
    cp -P $(get_install_dir pangox)/usr/lib/libpango-1.0.so.0.4200.1 ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/libpango-1.0.so.0
    cp -P $(get_install_dir pangox)/usr/lib/libpangoft2-1.0.so.0.4200.1 ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/libpangoft2-1.0.so.0
    cp -P $(get_install_dir pangox)/usr/lib/libpangocairo-1.0.so.0.4200.1 ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/libpangocairo-1.0.so.0
    cp -P $(get_install_dir harfbuzz)/usr/lib/libharfbuzz.so.0.20900.0 ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/libharfbuzz.so.0
    cp -P $(get_install_dir harfbuzz)/usr/lib/libharfbuzz-subset.so.0.20900.0 ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/libharfbuzz-subset.so.0
    cp -PR $(get_install_dir gdk-pixbufx)/usr/lib/gdk-pixbuf-2.0 ${ADDON_BUILD}/${PKG_ADDON_ID}/lib
    cp -P $(get_install_dir gdk-pixbufx)/usr/lib/libgdk_pixbuf-2.0.so.0.3600.12 ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/libgdk_pixbuf-2.0.so.0
    cp -P $(get_install_dir gdk-pixbufx)/usr/lib/libgdk_pixbuf-2.0.so.0.3600.12 ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/libgdk_pixbuf-2.0.so.0
    cp -P $(get_install_dir libcroco)/usr/lib/libcroco-0.6.so.3.0.1 ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/libcroco-0.6.so.3
    cp -PR $(get_install_dir librsvg)/usr/lib/gdk-pixbuf-2.0 ${ADDON_BUILD}/${PKG_ADDON_ID}/lib
    cp -P $(get_install_dir librsvg)/usr/lib/librsvg-2.so.2.40.9 ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/librsvg-2.so.2

  mkdir -p ${ADDON_BUILD}/${PKG_ADDON_ID}/share
    cp -R $(get_build_dir ncursesw)/.INSTALL_PKG/usr/share/* ${ADDON_BUILD}/${PKG_ADDON_ID}/share

  mkdir -p ${ADDON_BUILD}/${PKG_ADDON_ID}/share/vlc
    cp -R $(get_install_dir vlc3)${VLC_PREFIX}/share/vlc/* ${ADDON_BUILD}/${PKG_ADDON_ID}/share/vlc/

  mkdir -p ${ADDON_BUILD}/${PKG_ADDON_ID}/share/locale
    cp -R $(get_install_dir vlc3)${VLC_PREFIX}/share/locale/* ${ADDON_BUILD}/${PKG_ADDON_ID}/share/locale/
    
  rm -rf `find ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/vlc/plugins/ -name "*.la"`

}
