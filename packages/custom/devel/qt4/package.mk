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

PKG_NAME="qt4"
PKG_VERSION="4.8.7"
PKG_LICENSE="OSS"
PKG_SITE="http://qt-project.org"
PKG_URL="http://download.qt-project.org/official_releases/qt/4.8/${PKG_VERSION}/qt-everywhere-opensource-src-${PKG_VERSION}.tar.gz"
PKG_SOURCE_DIR="qt-everywhere-opensource-src-${PKG_VERSION}"
PKG_DEPENDS_TARGET="toolchain Python zlib:host zlib"
PKG_SHORTDESC="Qt GUI toolkit"
PKG_LONGDESC="Qt GUI toolkit"

QTDIR=$SYSROOT_PREFIX/usr
QMAKE_CONF_DIR="mkspecs/qws/linux-libreelec-g++"
QMAKE_CONF="${QMAKE_CONF_DIR}/qmake.conf"


PKG_CONFIGURE_OPTS_TARGET="-prefix $QTDIR \
                           -bindir $QTDIR/bin \
                           -plugindir $QTDIR/lib/qt4/plugins \
                           -importdir $QTDIR/lib/qt4/imports \
                           -datadir $QTDIR/share/qt4 \
                           -docdir $QTDIR/share/doc/qt4 \
                           -translationdir $QTDIR/share/qt4/translations \
                           -xplatform qws/linux-libreelec-g++ \
                           -make libs \
                           -force-pkg-config \
                           -release \
                           -confirm-license \
                           -opensource \
                           -fast \
                           -no-sql-sqlite \
                           -no-sql-mysql \
                           -no-qt3support \
                           -no-xmlpatterns \
                           -no-multimedia \
                           -no-audio-backend \
                           -no-phonon \
                           -no-phonon-backend \
                           -no-svg \
                           -no-webkit \
                           -no-script \
                           -no-scripttools \
                           -no-javascript-jit \
                           -no-neon \
                           -system-zlib \
                           -no-gif \
                           -no-libtiff \
                           -no-libpng \
                           -no-libmng \
                           -no-libjpeg \
                           -no-openssl \
                           -no-rpath \
                           -silent \
                           -optimized-qmake \
                           -no-nis \
                           -no-cups \
                           -no-pch \
                           -no-dbus \
                           -reduce-relocations \
                           -reduce-exports \
                           -no-separate-debug-info \
                           -no-fontconfig \
                           -no-glib \
                           -nomake examples \
                           -nomake demos \
                           -embedded $TARGET_ARCH"

configure_target() {
  cd ..
  mkdir -p $QMAKE_CONF_DIR
  echo "include(../../common/linux.conf)" > $QMAKE_CONF
  echo "include(../../common/gcc-base-unix.conf)" >> $QMAKE_CONF
  echo "include(../../common/g++-unix.conf)" >> $QMAKE_CONF
  echo "include(../../common/qws.conf)" >> $QMAKE_CONF
  echo "QMAKE_CC = $CC" >> $QMAKE_CONF
  echo "QMAKE_CXX = $CXX" >> $QMAKE_CONF
  echo "QMAKE_LINK = $CXX" >> $QMAKE_CONF
  echo "QMAKE_LINK_SHLIB = $CXX" >> $QMAKE_CONF
  echo "QMAKE_AR = $AR cqs" >> $QMAKE_CONF
  echo "QMAKE_OBJCOPY = $OBJCOPY" >> $QMAKE_CONF
  echo "QMAKE_STRIP = $STRIP" >> $QMAKE_CONF
  echo "QMAKE_CFLAGS = $CFLAGS" >> $QMAKE_CONF
  echo "QMAKE_CXXFLAGS = $CXXFLAGS" >> $QMAKE_CONF
  echo "QMAKE_LFLAGS = $LDFLAGS" >> $QMAKE_CONF
  echo "load(qt_config)" >> $QMAKE_CONF
  echo '#include "../../linux-g++/qplatformdefs.h"' >> $QMAKE_CONF_DIR/qplatformdefs.h

  CC="" CXX="" LD="" RANLIB="" AR="" AS="" CPPFLAGS="" CFLAGS="" LDFLAGS="" CXXFLAGS="" \
    PKG_CONFIG_SYSROOT_DIR="$SYSROOT_PREFIX" \
    PKG_CONFIG="$ROOT/$TOOLCHAIN/bin/pkg-config" \
    PKG_CONFIG_PATH="$SYSROOT_PREFIX/usr/lib/pkgconfig" \
    ./configure $PKG_CONFIGURE_OPTS_TARGET
}

post_makeinstall_target() {
  for file in $QTDIR/lib/pkgconfig/Qt*.pc; do
    sed -i -r 's/prefix=\//qtdir=\//g' $file
    sed -i -r 's/exec_prefix=\$\{prefix\}/exec_prefix=\$\{qtdir\}/g' $file
    sed -i -e '3 s/^/prefix=\/usr\n/;' $file
    perl -pi -e "s, -L$QTDIR/?\S+,,g" $file
    perl -pi -e "s, -L$ROOT/$BUILD/?\S+,,g" $file
    perl -pi -e "s, -I$QTDIR/?\S+,,g" $file
  done

  for file in $QTDIR/lib/libQt*.prl; do
    sed -r -e '/^QMAKE_PRL_BUILD_DIR/d'  -e 's/(QMAKE_PRL_LIBS =).*/\1/' -i $file
  done
}

post_install() {
  #mkdir -p $INSTALL/usr/bin
    #cp -P $PKG_BUILD/bin/qtconfig $INSTALL/usr/bin

  mkdir -p $INSTALL/usr/lib
    cp -P $PKG_BUILD/lib/libQt*.so* $INSTALL/usr/lib

  mkdir -p $INSTALL/usr/lib/fonts
    cp -P $PKG_BUILD/lib/fonts/* $INSTALL/usr/lib/fonts
    rm -f $INSTALL/usr/lib/fonts/README

  mkdir -p $INSTALL/usr/lib/qt4
  mkdir -p $INSTALL/usr/lib/qt4/plugins
    cp -PR $PKG_BUILD/plugins/* $INSTALL/usr/lib/qt4/plugins
    rm -f $INSTALL/usr/lib/qt4/plugins/graphicssystems/*.prl

  #mkdir -p $INSTALL/usr/share/qt4/translations
    #cp -P $PKG_BUILD/translations/qt_*.ts $INSTALL/usr/share/qt4/translations
    #cp -P $PKG_BUILD/translations/qvfb_*.ts $INSTALL/usr/share/qt4/translations
}
