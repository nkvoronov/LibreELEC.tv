################################################################################
#      This file is part of OpenELEC - http://www.openelec.tv
#      Copyright (C) 2009-2012 Stephan Raue (stephan@openelec.tv)
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

PKG_NAME="vlc-addon"
PKG_VERSION="2.2.4"
PKG_REV="25"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.videolan.org"
PKG_DEPENDS_TARGET="toolchain vlc vlc-htsp-plugin"
PKG_PRIORITY="optional"
PKG_SECTION="tools"
PKG_SHORTDESC="VideoLAN multimedia player and streamer"
PKG_LONGDESC="VLC is the VideoLAN project's media player. It plays MPEG, MPEG2, MPEG4, DivX, MOV, WMV, QuickTime, mp3, Ogg/Vorbis files, DVDs, VCDs, and multimedia streams from various network sources."

PKG_IS_ADDON="yes"
PKG_ADDON_TYPE="xbmc.python.script"
PKG_ADDON_REPOVERSION="8.0"
PKG_AUTORECONF="no"

make_target() {
  : # nothing to make here
}

makeinstall_target() {
  : # nothing to install here
}

addon() {
  VLC_DIR=$(get_build_dir_usr vlc)
  VLC_HTSP_DIR=$(get_build_dir vlc-htsp-plugin)
  QT4=$(get_build_dir qt4)
  LIB_EBML=$(get_build_dir libebml)
  LIB_MATROSKA=$(get_build_dir libmatroska)
  LIB_NCURSESW=$(get_build_dir ncursesw6)
  LIB_ICE=$(get_build_dir libICE)
  LIB_SM=$(get_build_dir libSM)
  LIB_XRENDER=$(get_build_dir libXrender)
  GCC_DIR=$(get_build_dir gcc)

  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/bin
    cp -P $VLC_DIR/.install_pkg/usr/bin/vlc $ADDON_BUILD/$PKG_ADDON_ID/bin/vlc.bin
    cp -P $QT4/bin/qtconfig $ADDON_BUILD/$PKG_ADDON_ID/bin

  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/lib
    cp -R $VLC_DIR/.install_pkg/usr/lib/* $ADDON_BUILD/$PKG_ADDON_ID/lib/
    cp -P $QT4/lib/libQtCore.so.4.8.7 $ADDON_BUILD/$PKG_ADDON_ID/lib/libQtCore.so.4
    cp -P $QT4/lib/libQtGui.so.4.8.7 $ADDON_BUILD/$PKG_ADDON_ID/lib/libQtGui.so.4
    cp -P $LIB_EBML/.install_pkg/usr/lib/libebml.so.4 $ADDON_BUILD/$PKG_ADDON_ID/lib
    cp -P $LIB_MATROSKA/.install_pkg/usr/lib/libmatroska.so.6 $ADDON_BUILD/$PKG_ADDON_ID/lib
    cp -P $LIB_NCURSESW/.install_tmp/usr/lib/libncursesw.so.6.0 $ADDON_BUILD/$PKG_ADDON_ID/lib/libncursesw.so.6
    cp -P $LIB_ICE/.install_pkg/usr/lib/libICE.so.6.3.0 $ADDON_BUILD/$PKG_ADDON_ID/lib/libICE.so.6
    cp -P $LIB_SM/.install_pkg/usr/lib/libSM.so.6.0.1 $ADDON_BUILD/$PKG_ADDON_ID/lib/libSM.so.6
    cp -P $LIB_XRENDER/.install_pkg/usr/lib/libXrender.so.1.3.0 $ADDON_BUILD/$PKG_ADDON_ID/lib/libXrender.so.1

    cp -PR $VLC_HTSP_DIR/.install_pkg/usr/lib/* $ADDON_BUILD/$PKG_ADDON_ID/lib/
    cp -PR $GCC_DIR/.install_pkg/usr/lib/libatomic.so.1.1.0 $ADDON_BUILD/$PKG_ADDON_ID/lib/libatomic.so.1

  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/lib/fonts
    cp -P $QT4/lib/fonts/* $ADDON_BUILD/$PKG_ADDON_ID/lib/fonts
    rm -f $ADDON_BUILD/$PKG_ADDON_ID/lib/fonts/README

  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/share
    cp -R $LIB_NCURSESW/.install_tmp/usr/share/* $ADDON_BUILD/$PKG_ADDON_ID/share

  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/lib/qt4
  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/lib/qt4/plugins
    cp -PR $QT4/plugins/* $ADDON_BUILD/$PKG_ADDON_ID/lib/qt4/plugins
    rm -f $ADDON_BUILD/$PKG_ADDON_ID/lib/qt4/plugins/graphicssystems/*.prl

  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/share/qt4/translations
    cp -P $QT4/translations/qt_*.qm $ADDON_BUILD/$PKG_ADDON_ID/share/qt4/translations
    cp -P $QT4/translations/qvfb_*.qm $ADDON_BUILD/$PKG_ADDON_ID/share/qt4/translations

  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/share/vlc
    cp -R $VLC_DIR/.install_pkg/usr/share/vlc/* $ADDON_BUILD/$PKG_ADDON_ID/share/vlc/

  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/share/locale
  for fgmo in `ls $VLC_DIR/po/*.gmo`;do
    fname=`basename $fgmo .gmo`
    mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/share/locale/$fname
    mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/share/locale/$fname/LC_MESSAGES
    cp -p $fgmo $ADDON_BUILD/$PKG_ADDON_ID/share/locale/$fname/LC_MESSAGES/vlc.mo
  done
}
