################################################################################
#      This file is part of OpenELEC - http://www.openelec.tv
#      Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
#
#  This Program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2, or (at your option)
#  any later version.
#
#  This Program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with OpenELEC.tv; see the file COPYING.  If not, write to
#  the Free Software Foundation, 51 Franklin Street, Suite 500, Boston, MA 02110, USA.
#  http://www.gnu.org/copyleft/gpl.html
################################################################################

PKG_NAME="vlc"
PKG_VERSION="2.2.4"
PKG_REV="30"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.videolan.org"
PKG_URL="http://download.videolan.org/$PKG_NAME/$PKG_VERSION/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="toolchain lua libass librsvg liblivemedia libbluray samba dbus libdvbpsi ffmpeg flac xcb-util-keysyms alsa-lib libsamplerate \
libupnp libmtp libmad faad2 libmodplug libmpeg2 fluidsynth dcadec taglib libva libvdpau zvbi chromaprint libdca fdk-aac libvpx x264 x265 opus lirc libavc1394 \
libdc1394 libdvdnav a52dec libssh2 libmatroska libshout gnutls ncurses SDL_image qt4"
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
	--enable-fluidsynth \
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


PKG_CONFIGURE_OPTS_TARGET="$PKG_CONFIGURE_MAIN_OPT \
	$PKG_CONFIGURE_OPTIMIZATION_OPTS \
	SPKG_CONFIGURE_INPUT_PLUGINS_OPTS \
	$PKG_CONFIGURE_MUX_DEMUX_PLUGINS_OPTS \
	$PKG_CONFIGURE_CODEC_PLUGINS_OPTS \
	$PKG_CONFIGURE_VIDEO_PLUGINS_OPTS \
	$PKG_CONFIGURE_AUDIO_PLUGINS_OPTS \
	$PKG_CONFIGURE_INTERFACE_PLUGINS_OPTS \
	$PKG_CONFIGURE_VISUALISATIONS_OPTS \
	$PKG_CONFIGURE_SERVICE_DISCOVERY_PLUGINS_OPTS \
	$PKG_CONFIGURE_MISC_OPTIONS_OPTS \
	$PKG_CONFIGURE_COMPONENTS_OPTS \
	LUAC=$SYSROOT_PREFIX/usr/bin/luac \
	RCC=$SYSROOT_PREFIX/usr/bin/rcc"

pre_configure_target() {
  export TAGLIB_CFLAGS="-I$SYSROOT_PREFIX/usr/include/taglib"
  export LUA_LIBS="-L$SYSROOT_PREFIX/usr/lib -llua -lm"

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

  mkdir -p $INSTALL/usr/config/vlc
    cp -pR $PKG_DIR/config/* $INSTALL/usr/config/vlc

  mkdir -p $INSTALL/usr/share/locale
  for fgmo in `ls $PKG_BUILD/po/*.gmo`;do
    fname=`basename $fgmo .gmo`
    mkdir -p $INSTALL/usr/share/locale/$fname
    mkdir -p $INSTALL/usr/share/locale/$fname/LC_MESSAGES
    cp -p $fgmo $INSTALL/usr/share/locale/$fname/LC_MESSAGES/vlc.mo
  done
}
