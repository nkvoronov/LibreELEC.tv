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

PKG_NAME="vlc3"
PKG_VERSION="3.0.1"
PKG_REV="36"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.videolan.org"
PKG_DEPENDS_TARGET="toolchain vlc"
PKG_SECTION="tools"
PKG_SHORTDESC="VideoLAN multimedia player and streamer"
PKG_LONGDESC="VLC is the VideoLAN project's media player. It plays MPEG, MPEG2, MPEG4, DivX, MOV, WMV, QuickTime, mp3, Ogg/Vorbis files, DVDs, VCDs, and multimedia streams from various network sources."
PKG_AUTORECONF="no"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="VLC"
PKG_ADDON_TYPE="xbmc.python.script"

make_target() {
  : # nothing to make here
}

makeinstall_target() {
  : # nothing to install here
}

addon() {
  VLC_DIR=$(get_build_dir vlc)
  VLC_HTSP_DIR=$(get_build_dir vlc-htsp-plugin)
  QT5=$(get_build_dir qt5)
  LUA=$(get_build_dir lua)
  LIB_EBML=$(get_build_dir libebml)
  LIB_MATROSKA=$(get_build_dir libmatroska)
  LIB_NCURSESW=$(get_build_dir ncurses)
  LIB_ICE=$(get_build_dir libICE)
  LIB_SM=$(get_build_dir libSM)
  LIB_XRENDER=$(get_build_dir libXrender)
  GCC_DIR=$(get_build_dir gcc)

  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/bin
    cp -P $VLC_DIR/.install_pkg/usr/bin/vlc $ADDON_BUILD/$PKG_ADDON_ID/bin/vlc.bin
    cp -P $LUA/src/lua $ADDON_BUILD/$PKG_ADDON_ID/bin
    cp -P $LUA/src/luac $ADDON_BUILD/$PKG_ADDON_ID/bin

  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/lib
    cp -P $LUA/src/liblua.so.5.3.4 $ADDON_BUILD/$PKG_ADDON_ID/lib/liblua.so.5
    cp -R $VLC_DIR/.install_pkg/usr/lib/* $ADDON_BUILD/$PKG_ADDON_ID/lib/
    cp -P $QT5/qtbase/lib/libQt5Concurrent.so.5.6.2 $ADDON_BUILD/$PKG_ADDON_ID/lib/libQt5Concurrent.so.5
    cp -P $QT5/qtbase/lib/libQt5Core.so.5.6.2 $ADDON_BUILD/$PKG_ADDON_ID/lib/libQt5Core.so.5
    cp -P $QT5/qtbase/lib/libQt5DBus.so.5.6.2 $ADDON_BUILD/$PKG_ADDON_ID/lib/libQt5DBus.so.5
    cp -P $QT5/qtbase/lib/libQt5EglDeviceIntegration.so.5.6.2 $ADDON_BUILD/$PKG_ADDON_ID/lib/libQt5EglDeviceIntegration.so.5
    cp -P $QT5/qtbase/lib/libQt5Gui.so.5.6.2 $ADDON_BUILD/$PKG_ADDON_ID/lib/libQt5Gui.so.5
    cp -P $QT5/qtbase/lib/libQt5Network.so.5.6.2 $ADDON_BUILD/$PKG_ADDON_ID/lib/libQt5Network.so.5
    cp -P $QT5/qtbase/lib/libQt5OpenGL.so.5.6.2 $ADDON_BUILD/$PKG_ADDON_ID/lib/libQt5OpenGL.so.5
    cp -P $QT5/qtbase/lib/libQt5PrintSupport.so.5.6.2 $ADDON_BUILD/$PKG_ADDON_ID/lib/libQt5PrintSupport.so.5
    cp -P $QT5/qtbase/lib/libQt5Sql.so.5.6.2 $ADDON_BUILD/$PKG_ADDON_ID/lib/libQt5Sql.so.5
    cp -P $QT5/qtbase/lib/libQt5Test.so.5.6.2 $ADDON_BUILD/$PKG_ADDON_ID/lib/libQt5Test.so.5
    cp -P $QT5/qtbase/lib/libQt5Widgets.so.5.6.2 $ADDON_BUILD/$PKG_ADDON_ID/lib/libQt5Widgets.so.5
    cp -P $QT5/qtbase/lib/libQt5XcbQpa.so.5.6.2 $ADDON_BUILD/$PKG_ADDON_ID/lib/libQt5XcbQpa.so.5
    cp -P $QT5/qtbase/lib/libQt5Xml.so.5.6.2 $ADDON_BUILD/$PKG_ADDON_ID/lib/libQt5Xml.so.5
    cp -P $QT5/qtsvg/lib/libQt5Svg.so.5.6.2 $ADDON_BUILD/$PKG_ADDON_ID/lib/libQt5Svg.so.5
    cp -P $QT5/qtx11extras/lib/libQt5X11Extras.so.5.6.2 $ADDON_BUILD/$PKG_ADDON_ID/lib/libQt5X11Extras.so.5

  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/lib/qt5/plugins
    cp -PR $QT5/qtbase/plugins/* $ADDON_BUILD/$PKG_ADDON_ID/lib/qt5/plugins

  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/lib/fonts
    cp -P $QT5/qtbase/lib/fonts/* $ADDON_BUILD/$PKG_ADDON_ID/lib/fonts
    rm -f $ADDON_BUILD/$PKG_ADDON_ID/lib/fonts/README

    cp -P $LIB_EBML/.install_pkg/usr/lib/libebml.so.4 $ADDON_BUILD/$PKG_ADDON_ID/lib
    cp -P $LIB_MATROSKA/.install_pkg/usr/lib/libmatroska.so.6 $ADDON_BUILD/$PKG_ADDON_ID/lib
    cp -P $LIB_NCURSESW/.install_tmp/usr/lib/libncursesw.so.6.0 $ADDON_BUILD/$PKG_ADDON_ID/lib/libncursesw.so.6
    cp -P $LIB_NCURSESW/.install_tmp/usr/lib/libformw.so.6.0 $ADDON_BUILD/$PKG_ADDON_ID/lib/libformw.so.6
    cp -P $LIB_NCURSESW/.install_tmp/usr/lib/libmenuw.so.6.0 $ADDON_BUILD/$PKG_ADDON_ID/lib/libmenuw.so.6
    cp -P $LIB_NCURSESW/.install_tmp/usr/lib/libpanelw.so.6.0 $ADDON_BUILD/$PKG_ADDON_ID/lib/libpanelw.so.6
    cp -P $LIB_NCURSESW/.install_tmp/usr/lib/libtinfo.so.6.0 $ADDON_BUILD/$PKG_ADDON_ID/lib/libtinfo.so.6
    cp -P $LIB_ICE/.install_pkg/usr/lib/libICE.so.6.3.0 $ADDON_BUILD/$PKG_ADDON_ID/lib/libICE.so.6
    cp -P $LIB_SM/.install_pkg/usr/lib/libSM.so.6.0.1 $ADDON_BUILD/$PKG_ADDON_ID/lib/libSM.so.6
    cp -P $LIB_XRENDER/.install_pkg/usr/lib/libXrender.so.1.3.0 $ADDON_BUILD/$PKG_ADDON_ID/lib/libXrender.so.1

  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/share
    cp -R $LIB_NCURSESW/.install_tmp/usr/share/* $ADDON_BUILD/$PKG_ADDON_ID/share

  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/share/vlc
    cp -R $VLC_DIR/.install_pkg/usr/share/vlc/* $ADDON_BUILD/$PKG_ADDON_ID/share/vlc/

  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/share/locale
  for fgmo in `ls $VLC_DIR/po/*.gmo`;do
    fname=`basename $fgmo .gmo`
    mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/share/locale/$fname
    mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/share/locale/$fname/LC_MESSAGES
    cp -p $fgmo $ADDON_BUILD/$PKG_ADDON_ID/share/locale/$fname/LC_MESSAGES/vlc.mo
  done

  ln -sf ../share/terminfo $ADDON_BUILD/$PKG_ADDON_ID/lib/terminfo

    #cp -PR $VLC_HTSP_DIR/.install_pkg/usr/lib/* $ADDON_BUILD/$PKG_ADDON_ID/lib/
    #cp -PR $GCC_DIR/.install_pkg/usr/lib/libatomic.so.1.2.0 $ADDON_BUILD/$PKG_ADDON_ID/lib/libatomic.so.1

}
