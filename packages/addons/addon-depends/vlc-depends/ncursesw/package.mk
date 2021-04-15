# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="ncursesw"
PKG_VERSION="6.1"
PKG_SHA256="aa057eeeb4a14d470101eff4597d5833dcef5965331be3528c08d99cebaa0d17"
PKG_LICENSE="MIT"
PKG_SITE="http://www.gnu.org/software/ncurses/"
PKG_URL="https://ftp.gnu.org/pub/gnu/ncurses/ncurses-$PKG_VERSION.tar.gz"
PKG_SOURCE_DIR="ncurses-$PKG_VERSION"
PKG_DEPENDS_TARGET="toolchain zlib"
PKG_LONGDESC="The ncurses (new curses) library is a free software emulation of curses in System V Release 4.0, and more. It uses terminfo format, supports pads and color and multiple highlights and forms characters and function-key mapping, and has all the other SYSV-curses enhancements over BSD curses."
PKG_BUILD_FLAGS="+lto"

PKG_CONFIGURE_OPTS_TARGET="--with-shared \
                           --with-normal \
                           --with-termlib=tinfo \
                           --without-debug \
                           --without-ada \
                           --without-cxx \
                           --without-cxx-binding \
                           --without-manpages \
                           --without-progs \
                           --without-tests \
                           --enable-widec \
                           --enable-pc-files \
                           --with-pkg-config-libdir=/usr/lib/pkgconfig \
                           --enable-ext-colors \
                           --enable-ext-mouse"

makeinstall_target() {
  make install DESTDIR=$PKG_BUILD/.INSTALL_PKG $PKG_MAKEINSTALL_OPTS_TARGET
}

post_install() {
  mkdir -p $INSTALL/usr/lib
    cp -P $PKG_BUILD/.install_tmp/usr/lib/*.so $INSTALL/usr/lib
    cp -P $PKG_BUILD/.install_tmp/usr/lib/*.so.* $INSTALL/usr/lib

  ln -sf /usr/share/terminfo $INSTALL/usr/lib/terminfo

  mkdir -p $INSTALL/usr/share
    cp -R $PKG_BUILD/.install_tmp/usr/share/* $INSTALL/usr/share
}
