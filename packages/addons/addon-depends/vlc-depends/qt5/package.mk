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

PKG_NAME="qt5"
PKG_VERSION="5.10.1"
PKG_LICENSE="OSS"
PKG_SITE="http://qt-project.org"
PKG_URL="http://download.qt.io/official_releases/qt/5.10/$PKG_VERSION/single/qt-everywhere-src-$PKG_VERSION.tar.xz"
PKG_SOURCE_DIR="qt-everywhere-src-$PKG_VERSION"
PKG_DEPENDS_TARGET="toolchain libjpeg-turbo xcb-util-keysyms xcb-util-renderutil fontconfig xcb-util-wm libXrender libXi sqlite xcb-util-image icu libinput libSM libxkbcommon alsa-lib"
PKG_SECTION="devel"
PKG_SHORTDESC="Qt GUI toolkit"
PKG_LONGDESC="Qt GUI toolkit"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

PKG_CONFIGURE_OPTS_TARGET="-prefix /usr
                           -sysroot $SYSROOT_PREFIX
                           -hostprefix $TOOLCHAIN
                           -device linux-libreelec-g++
                           -opensource -confirm-license -v
                           -no-sql-sqlite
                           -no-sql-mysql
                           -no-qml-debug
                           -system-zlib
                           -system-harfbuzz
                           -openssl-linked
                           -dbus-linked
                           -make libs
                           -nomake examples
                           -nomake tests
                           -skip qt3d
                           -skip qtactiveqt
                           -skip qtandroidextras
                           -skip qtcanvas3d
                           -skip qtcharts
                           -skip qtconnectivity
                           -skip qtdatavis3d
                           -skip qtdeclarative
                           -skip qtdoc
                           -skip qtgamepad
                           -skip qtgraphicaleffects
                           -skip qtimageformats
                           -skip qtlocation
                           -skip qtmacextras
                           -skip qtmultimedia
                           -skip qtnetworkauth
                           -skip qtpurchasing
                           -skip qtquickcontrols
                           -skip qtquickcontrols2
                           -skip qtremoteobjects
                           -skip qtscript
                           -skip qtscxml
                           -skip qtsensors
                           -skip qtserialbus
                           -skip qtserialport
                           -skip qtspeech
                           -skip qttools
                           -skip qttranslations
                           -skip qtvirtualkeyboard
                           -skip qtwayland
                           -skip qtwebchannel
                           -skip qtwebengine
                           -skip qtwebglplugin
                           -skip qtwebsockets
                           -skip qtwebview
                           -skip qtwinextras
                           -skip qtxmlpatterns
                           -fontconfig
                           -no-rpath
                           -optimized-qmake
                           -no-use-gold-linker
                           -reduce-relocations"

configure_target() {
  QMAKE_CONF_DIR="qtbase/mkspecs/devices/linux-libreelec-g++"
  QMAKE_CONF="${QMAKE_CONF_DIR}/qmake.conf"

  cd ..
  mkdir -p $QMAKE_CONF_DIR
  echo "MAKEFILE_GENERATOR       = UNIX" > $QMAKE_CONF
  echo "CONFIG                  += incremental" >> $QMAKE_CONF
  echo "QMAKE_INCREMENTAL_STYLE  = sublib" >> $QMAKE_CONF
  echo "include(../../common/linux.conf)" >> $QMAKE_CONF
  echo "include(../../common/gcc-base-unix.conf)" >> $QMAKE_CONF
  echo "include(../../common/g++-unix.conf)" >> $QMAKE_CONF
  echo "load(device_config)" >> $QMAKE_CONF
  echo "QMAKE_CC                = $CC" >> $QMAKE_CONF
  echo "QMAKE_CXX               = $CXX" >> $QMAKE_CONF
  echo "QMAKE_LINK              = $CXX" >> $QMAKE_CONF
  echo "QMAKE_LINK_SHLIB        = $CXX" >> $QMAKE_CONF
  echo "QMAKE_AR                = $AR cqs" >> $QMAKE_CONF
  echo "QMAKE_OBJCOPY           = $OBJCOPY" >> $QMAKE_CONF
  echo "QMAKE_NM                = $NM -P" >> $QMAKE_CONF
  echo "QMAKE_STRIP             = $STRIP" >> $QMAKE_CONF
  echo "QMAKE_CFLAGS = $CFLAGS" >> $QMAKE_CONF
  echo "QMAKE_CXXFLAGS = $CXXFLAGS" >> $QMAKE_CONF
  echo "QMAKE_LFLAGS = $LDFLAGS" >> $QMAKE_CONF
  echo "load(qt_config)" >> $QMAKE_CONF
  echo '#include "../../linux-g++/qplatformdefs.h"' >> $QMAKE_CONF_DIR/qplatformdefs.h

  unset CC CXX LD RANLIB AR AS CPPFLAGS CFLAGS LDFLAGS CXXFLAGS
  ./configure $PKG_CONFIGURE_OPTS_TARGET
}

post_install() {
  mkdir -p $INSTALL/usr/lib
    cp -P $PKG_BUILD/qtbase/lib/libQt5Concurrent.so* $INSTALL/usr/lib
    cp -P $PKG_BUILD/qtbase/lib/libQt5Core.so* $INSTALL/usr/lib
    cp -P $PKG_BUILD/qtbase/lib/libQt5DBus.so* $INSTALL/usr/lib
    cp -P $PKG_BUILD/qtbase/lib/libQt5EglDeviceIntegration.so* $INSTALL/usr/lib
    cp -P $PKG_BUILD/qtbase/lib/libQt5Gui.so* $INSTALL/usr/lib
    cp -P $PKG_BUILD/qtbase/lib/libQt5Network.so* $INSTALL/usr/lib
    cp -P $PKG_BUILD/qtbase/lib/libQt5OpenGL.so* $INSTALL/usr/lib
    cp -P $PKG_BUILD/qtbase/lib/libQt5PrintSupport.so* $INSTALL/usr/lib
    cp -P $PKG_BUILD/qtbase/lib/libQt5Sql.so* $INSTALL/usr/lib
    cp -P $PKG_BUILD/qtbase/lib/libQt5Test.so* $INSTALL/usr/lib
    cp -P $PKG_BUILD/qtbase/lib/libQt5Widgets.so* $INSTALL/usr/lib
    cp -P $PKG_BUILD/qtbase/lib/libQt5XcbQpa.so* $INSTALL/usr/lib
    cp -P $PKG_BUILD/qtbase/lib/libQt5Xml.so* $INSTALL/usr/lib

    cp -P $PKG_BUILD/qtsvg/lib/libQt5Svg.so* $INSTALL/usr/lib
    cp -P $PKG_BUILD/qtx11extras/lib/libQt5X11Extras.so* $INSTALL/usr/lib

  mkdir -p $INSTALL/usr/lib/qt5/plugins
    cp -PR $PKG_BUILD/qtbase/plugins/* $INSTALL/usr/lib/qt5/plugins

  mkdir -p $INSTALL/usr/lib/fonts
    cp -P $PKG_BUILD/qtbase/lib/fonts/* $INSTALL/usr/lib/fonts
    rm -f $INSTALL/usr/lib/fonts/README

}
