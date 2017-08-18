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

PKG_NAME="vlc-addon"
PKG_VERSION="2.2.6"
PKG_REV="32"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.videolan.org"
PKG_DEPENDS_TARGET="toolchain vlc vlc-htsp-plugin"
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
  QT4=$(get_build_dir qt4)
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
    cp -P $LUA/src/liblua.so.5.3.3 $ADDON_BUILD/$PKG_ADDON_ID/lib/liblua.so.5
    cp -R $VLC_DIR/.install_pkg/usr/lib/* $ADDON_BUILD/$PKG_ADDON_ID/lib/
    cp -P $QT4/lib/libQtCore.so.4.8.7 $ADDON_BUILD/$PKG_ADDON_ID/lib/libQtCore.so.4
    cp -P $QT4/lib/libQtGui.so.4.8.7 $ADDON_BUILD/$PKG_ADDON_ID/lib/libQtGui.so.4
    cp -P $QT4/lib/libQtNetwork.so.4.8.7 $ADDON_BUILD/$PKG_ADDON_ID/lib/libQtNetwork.so.4
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

    cp -PR $VLC_HTSP_DIR/.install_pkg/usr/lib/* $ADDON_BUILD/$PKG_ADDON_ID/lib/
    cp -PR $GCC_DIR/.install_pkg/usr/lib/libatomic.so.1.2.0 $ADDON_BUILD/$PKG_ADDON_ID/lib/libatomic.so.1

  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/lib/fonts
    cp -P $QT4/lib/fonts/* $ADDON_BUILD/$PKG_ADDON_ID/lib/fonts
    rm -f $ADDON_BUILD/$PKG_ADDON_ID/lib/fonts/README

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
}
