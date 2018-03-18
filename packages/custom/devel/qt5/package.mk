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
PKG_URL="https://download.qt.io/archive/qt/5.10/$PKG_VERSION/single/qt-everywhere-src-$PKG_VERSION.tar.xz"
PKG_SOURCE_DIR="qt-everywhere-src-$PKG_VERSION"
PKG_DEPENDS_TARGET="toolchain bzip2 Python zlib:host zlib libpng tiff dbus glib fontconfig mysql openssl \
glibc liberation-fonts-ttf freetype font-util font-xfree86-type1 font-misc-misc alsa libXcursor libSM libICE"
PKG_SECTION="devel"
PKG_SHORTDESC="Qt GUI toolkit"
PKG_LONGDESC="Qt GUI toolkit"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

PLATFORM="linux-g++-$TARGET_NAME"
LEX=$TOOLCHAIN/bin/flex
YACC=$TOOLCHAIN/bin/yacc
INCDIR=$SYSROOT_PREFIX/usr/include
LIBDIR=$SYSROOT_PREFIX/usr/lib
QMAKE_CONF_DIR="$BUILD/$PKG_NAME-$PKG_VERSION/mkspecs/$PLATFORM"

QTDIR=$SYSROOT_PREFIX/usr

PKG_CONFIGURE_OPTS_TARGET="-prefix $QTDIR \
                           -bindir $QTDIR/bin \
                           -plugindir $QTDIR/lib/qt5/plugins \
                           -importdir $QTDIR/lib/qt5/imports \
                           -datadir $QTDIR/share/qt5 \
                           -docdir $QTDIR/share/doc/qt5 \
                           -translationdir $QTDIR/share/qt4/translations \
                           -device linux-libreelec-g++ \
                           -confirm-license \
                           -opensource \
                           -no-accessibility \
                           -no-sql-sqlite \
                           -no-sql-mysql \
                           -qt-zlib \
                           -qt-libpng \
                           -qt-libjpeg \
                           -no-rpath \
                           -optimized-qmake \
                           -dbus-linked \
                           -reduce-relocations \
                           -no-separate-debug-info \
                           -verbose \
                           -no-openvg \
                           -fontconfig \
                           -nomake examples"


configure_target() {
  cd ..

  mkdir -p $QMAKE_CONF_DIR
    cp -P $PKG_DIR/mkspecs/* $QMAKE_CONF_DIR
  sed "s#@CC@#${CC}#;s#@CFLAGS@#${CFLAGS}#;s#@CXX@#${CXX}#;s#@LEX@#${LEX}#;s#@YACC@#${YACC}#;s#@INCDIR@#${INCDIR}#;s#@LIBDIR@#${LIBDIR}#;s#@LDFLAGS@#${LDFLAGS}#;s#@AR@#${AR}#;s#@OBJCOPY@#${OBJCOPY}#;s#@STRIP@#${STRIP}#" $QMAKE_CONF_DIR/qmake.conf.in > $QMAKE_CONF_DIR/qmake.conf
  rm -f $QMAKE_CONF_DIR/qmake.conf.in

  export QT_FORCE_PKGCONFIG=yes
  unset QMAKESPEC
  export QT5PREFIX=$QTDIR

  CC="" CXX="" LD="" RANLIB="" AR="" AS="" CPPFLAGS="" CFLAGS="" LDFLAGS="" CXXFLAGS="" \
    PKG_CONFIG_SYSROOT_DIR="$SYSROOT_PREFIX" \
    PKG_CONFIG="$TOOLCHAIN/bin/pkg-config" \
    PKG_CONFIG_PATH="$SYSROOT_PREFIX/usr/lib/pkgconfig" \
    ./configure $PKG_CONFIGURE_OPTS_TARGET
}

post_makeinstall_target() {
  mkdir -p $TOOLCHAIN/bin
    cp -P $PKG_BUILD/bin/qmake $TOOLCHAIN/bin

  for file in $QTDIR/lib/pkgconfig/Qt*.pc; do
    sed -i -r 's/prefix=\//qtdir=\//g' $file
    sed -i -r 's/exec_prefix=\$\{prefix\}/exec_prefix=\$\{qtdir\}/g' $file
    sed -i -e '3 s/^/prefix=\/usr\n/;' $file
    perl -pi -e "s, -L$QTDIR/?\S+,,g" $file
    perl -pi -e "s, -L$BUILD/?\S+,,g" $file
    perl -pi -e "s, -I$QTDIR/?\S+,,g" $file
  done

  for file in $QTDIR/lib/libQt*.prl; do
    sed -r -e '/^QMAKE_PRL_BUILD_DIR/d'  -e 's/(QMAKE_PRL_LIBS =).*/\1/' -i $file
  done
}

post_install() {
  mkdir -p $INSTALL/usr/lib
    cp -P $PKG_BUILD/lib/libQtCore.so* $INSTALL/usr/lib
    cp -P $PKG_BUILD/lib/libQtGui.so* $INSTALL/usr/lib
    cp -P $PKG_BUILD/lib/libQtNetwork.so* $INSTALL/usr/lib

  mkdir -p $INSTALL/usr/lib/fonts
    cp -P $PKG_BUILD/lib/fonts/* $INSTALL/usr/lib/fonts
    rm -f $INSTALL/usr/lib/fonts/README

}
