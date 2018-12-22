# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="vlc3"
PKG_VERSION="3.0.4"
PKG_REV="46"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.videolan.org"
PKG_DEPENDS_TARGET="toolchain vlc"
PKG_SECTION="tools"
PKG_SHORTDESC="VideoLAN multimedia player and streamer"
PKG_LONGDESC="VLC is the VideoLAN project's media player. It plays MPEG, MPEG2, MPEG4, DivX, MOV, WMV, QuickTime, mp3, Ogg/Vorbis files, DVDs, VCDs, and multimedia streams from various network sources."
PKG_TOOLCHAIN="manual"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="Vlc Player 3"
PKG_ADDON_TYPE="xbmc.python.script"

QT5VWER="5.10.1"
#QT5VWER="5.12.0"

addon() {
  VLC_DIR=$(get_build_dir vlc)
  VLC_HTSP_DIR=$(get_build_dir vlc-htsp-plugin)
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
  LIB_XZ=$(get_build_dir xz)
  LIB_FDKAAC=$(get_build_dir fdk-aac)
  LIB_PULS=$(get_build_dir pulseaudio)
  LIB_XKBC=$(get_build_dir libxkbcommon)

  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/bin
    cp -P $VLC_DIR/.install_pkg/usr/bin/vlc $ADDON_BUILD/$PKG_ADDON_ID/bin/vlc.bin
    cp -P $LUA/src/lua $ADDON_BUILD/$PKG_ADDON_ID/bin
    cp -P $LUA/src/luac $ADDON_BUILD/$PKG_ADDON_ID/bin

  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/lib
    cp -P $VLC_DIR/.install_pkg/usr/lib/libvlc.so.5.6.0 $ADDON_BUILD/$PKG_ADDON_ID/lib/libvlc.so.5
    cp -P $VLC_DIR/.install_pkg/usr/lib/libvlccore.so.9.0.0 $ADDON_BUILD/$PKG_ADDON_ID/lib/libvlccore.so.9

  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/lib/vlc
    cp -P $VLC_DIR/.install_pkg/usr/lib/vlc/libvlc_pulse.so.0.0.0 $ADDON_BUILD/$PKG_ADDON_ID/lib/vlc/libvlc_pulse.so.0
    cp -P $VLC_DIR/.install_pkg/usr/lib/vlc/libvlc_vdpau.so.0.0.0 $ADDON_BUILD/$PKG_ADDON_ID/lib/vlc/libvlc_vdpau.so.0
    cp -P $VLC_DIR/.install_pkg/usr/lib/vlc/libvlc_xcb_events.so.0.0.0 $ADDON_BUILD/$PKG_ADDON_ID/lib/vlc/libvlc_xcb_events.so.0
    cp -P $VLC_DIR/.install_pkg/usr/lib/vlc/vlc-cache-gen $ADDON_BUILD/$PKG_ADDON_ID/lib/vlc/vlc-cache-gen

  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/lib/vlc/lua
    cp -R $VLC_DIR/.install_pkg/usr/lib/vlc/lua/* $ADDON_BUILD/$PKG_ADDON_ID/lib/vlc/lua

  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/lib/vlc/plugins
    cp -R $VLC_DIR/.install_pkg/usr/lib/vlc/plugins/* $ADDON_BUILD/$PKG_ADDON_ID/lib/vlc/plugins

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

  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/share
    cp -R $LIB_NCURSESW/.INSTALL_PKG/usr/share/* $ADDON_BUILD/$PKG_ADDON_ID/share

  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/share/vlc
    cp -R $VLC_DIR/.install_pkg/usr/share/vlc/* $ADDON_BUILD/$PKG_ADDON_ID/share/vlc/

  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/share/locale
    cp -R $VLC_DIR/.install_pkg/usr/share/locale/* $ADDON_BUILD/$PKG_ADDON_ID/share/locale/

  ln -sf ../share/terminfo $ADDON_BUILD/$PKG_ADDON_ID/lib/terminfo

}
