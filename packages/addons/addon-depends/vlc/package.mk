################################################################################
#      This file is part of LibreELEC - http://www.libreelec.tv
#      Copyright (C) 2016 Team LibreELEC
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

PKG_NAME="vlc"
PKG_VERSION="3.0.1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.videolan.org"
PKG_URL="http://download.videolan.org/$PKG_NAME/$PKG_VERSION/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="toolchain a52dec libdvbpsi libdca lua libmatroska libupnp libmpeg2 xcb-util-keysyms gnutls liblivemedia libdc1394 libavc1394 libssh2 libshout libtheora zvbi SDL_image chromaprint ncurses \
fdk-aac taglib ffmpeg faad2 libmad libXinerama freetype fribidi harfbuzz fontconfig libxml2 libbluray flac librsvg avahi systemd libmtp libdvdcss samba mesa libnfs mpg123 libdvdread libdvdnav libogg libmodplug \
fluidsynth libvpx speex opus libpng libjpeg-turbo x265 x264 libass pulseaudio alsa-lib libsamplerate lirc libprojectM qt5"
PKG_SECTION="multimedia"
PKG_SHORTDESC="VideoLAN multimedia player and streamer"
PKG_LONGDESC="VLC is the VideoLAN project's media player. It plays MPEG, MPEG2, MPEG4, DivX, MOV, WMV, QuickTime, mp3, Ogg/Vorbis files, DVDs, VCDs, and multimedia streams from various network sources."

PKG_IS_ADDON="no"
PKG_AUTORECONF="yes"

PKG_CONFIGURE_MAIN_OPTS="--enable-silent-rules \
	--disable-dependency-tracking \
	--without-contrib \
	--enable-shared \
	--disable-static \
	--without-pic \
	--enable-fast-install \
	--without-gnu-ld \
	--disable-nls \
	--disable-rpath \
	--enable-dbus"

PKG_CONFIGURE_OPTIMIZATION_OPTS="--disable-debug \
	--disable-gprof \
	--disable-cprof \
	--disable-coverage \
	--enable-optimizations \
	--disable-mmx \
	--disable-sse \
	--disable-neon \
	--disable-altivec \
	--enable-optimize-memory \
	--enable-run-as-root \
	--enable-sout \
	--enable-lua \
	--enable-httpd \
	--enable-vlm \
	--enable-addonmanagermodules"

PKG_CONFIGURE_INPUT_PLUGINS_OPTS="--enable-live555 \
	--enable-dc1394 \
	--enable-dv1394 \
	--enable-linsys \
	--enable-dvdread \
	--enable-dvdnav \
	--enable-bluray \
	--disable-opencv \
	--enable-smbclient \
	--enable-sftp \
	--enable-v4l2 \
	--disable-decklink \
	--disable-gnomevfs \
	--disable-vcdx \
	--disable-vcd \
	--disable-libcddb \
	--enable-screen \
	--disable-vnc \
	--disable-freerdp \
	--disable-realrtsp \
	--disable-macosx-eyetv \
	--disable-macosx-qtkit \
	--disable-macosx-avfoundation \
	--disable-asdcp"

PKG_CONFIGURE_MUX_DEMUX_PLUGINS_OPTS="--enable-dvbpsi \
	--disable-gme \
	--disable-sid \
	--enable-ogg \
	--enable-mux_ogg \
	--enable-shout \
	--enable-mkv \
	--enable-mod \
	--disable-mpc"

PKG_CONFIGURE_CODEC_PLUGINS_OPTS="--disable-wma-fixed \
	--disable-shine \
	--disable-omxil \
	--disable-omxil-vout \
	--disable-rpi-omxil \
	--disable-mmal-codec \
	--disable-crystalhd \
	--enable-mad \
	--disable-merge-ffmpeg \
	--disable-gst-decode \
	--enable-avcodec \
	--enable-libva \
	--disable-dxva2 \
	--disable-vda \
	--enable-avformat \
	--enable-swscale \
	--enable-postproc \
	--enable-faad \
	--enable-vpx \
	--disable-twolame \
	--enable-fdkaac \
	--disable-quicktime \
	--enable-a52 \
	--enable-dca \
	--enable-flac \
	--enable-libmpeg2 \
	--enable-vorbis \
	--disable-tremor \
	--enable-speex \
	--enable-opus \
	--enable-theora \
	--disable-schroedinger \
	--enable-png \
	--enable-jpeg \
	--disable-x262 \
	--disable-x265 \
	--disable-x26410b \
	--enable-x264 \
	--disable-mfx \
	--disable-fluidsynth \
	--enable-zvbi \
	--disable-telx \
	--enable-libass \
	--disable-kate \
	--disable-tiger"

PKG_CONFIGURE_VIDEO_PLUGINS_OPTS="--disable-gles2 \
	--disable-gles1 \
	--with-x \
	--enable-xcb \
	--enable-xvideo \
	--enable-vdpau \
	--enable-sdl \
	--enable-sdl-image \
	--enable-freetype \
	--enable-fribidi \
	--enable-fontconfig \
	--disable-macosx-quartztext \
	--enable-svg \
	--disable-svgdec \
	--disable-directfb \
	--disable-aa \
	--disable-caca \
	--disable-kva \
	--disable-mmal-vout"

PKG_CONFIGURE_AUDIO_PLUGINS_OPTS="--disable-pulse \
	--enable-alsa \
	--disable-oss \
	--disable-sndio \
	--disable-wasapi \
	--disable-audioqueue \
	--disable-jack \
	--disable-opensles \
	--enable-samplerate \
	--disable-kai \
	--enable-chromaprint"

PKG_CONFIGURE_INTERFACE_PLUGINS_OPTS="--enable-qt \
	--disable-skins2 \
	--disable-libtar \
	--disable-macosx \
	--disable-minimal-macosx \
	--disable-macosx-dialog-provider \
	--enable-ncurses \
	--enable-lirc"

PKG_CONFIGURE_VISUALISATIONS_OPTS="--disable-goom \
	--disable-projectm \
	--disable-vsxu \
	--enable-atmo \
	--enable-glspectrum"

PKG_CONFIGURE_SERVICE_DISCOVERY_PLUGINS_OPTS="--enable-bonjour \
	--enable-udev \
	--enable-mtp \
	--enable-upnp"

PKG_CONFIGURE_MISC_OPTIONS_OPTS="--enable-libxml2 \
	--enable-libgcrypt \
	--enable-gnutls \
	--enable-taglib \
	--disable-update-check \
	--disable-growl \
	--disable-notify"

PKG_CONFIGURE_COMPONENTS_OPTS="--enable-vlc \
	--disable-macosx-vlc-app"


PKG_CONFIGURE_OPTS_TARGET="--prefix=/usr \
              --sysconfdir=/etc \
              --disable-rpath \
              --enable-nls \
              --enable-lua \
              --disable-archive \
              --enable-live555 \
              --enable-dc1394 \
              --enable-dv1394 \
              --disable-dvdread \
              --disable-dvdnav \
              --enable-bluray \
              --disable-opencv \
              --enable-smbclient \
              --enable-sftp \
              --enable-nfs \
              --enable-realrtsp \
              --enable-dvbpsi \
              --disable-gme \
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
              --disable-twolame \
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
              --disable-soxr \
              --enable-chromaprint \
              --disable-chromecast \
              --enable-qt \
              --disable-skins2 \
              --disable-libtar \
              --enable-ncurses \
              --enable-lirc \
              --disable-goom \
              --disable-projectm \
              --enable-avahi \
              --enable-mtp \
              --enable-upnp \
              --disable-microdns \
              --enable-libxml2 \
              --enable-libgcrypt \
              --enable-gnutls \
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

  PKG_CONFIG_PATH="$(get_build_dir ncurses)/.install_tmp/usr/lib/pkgconfig"
  CFLAGS="$CFLAGS -I$(get_build_dir ncurses)/.install_tmp/usr/include"
  LDFLAGS="$LDFLAGS -L$(get_build_dir ncurses)/.install_tmp/usr/lib"
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
