# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="transmission"
PKG_VERSION="2.94"
PKG_SHA256="35442cc849f91f8df982c3d0d479d650c6ca19310a994eccdaa79a4af3916b7d"
PKG_LICENSE="OSS"
PKG_SITE="http://www.transmissionbt.com/"
PKG_URL="https://github.com/transmission/transmission-releases/raw/master/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="toolchain zlib openssl curl libevent"
PKG_LONGDESC="transmission is a fast, easy and free BitTorrent client"
PKG_TOOLCHAIN="autotools"

PKG_CONFIGURE_OPTS_TARGET="--enable-utp \
            --disable-static \
            --enable-shared \
            --enable-largefile \
            --disable-nls \
            --disable-cli \
            --disable-mac \
            --enable-lightweight \
            --enable-daemon \
            --with-gnu-ld"

post_install() {
  mkdir -p $INSTALL/usr/bin
    cp $PKG_BUILD/.$TARGET_NAME/daemon/transmission-daemon $INSTALL/usr/bin
    cp $PKG_BUILD/.$TARGET_NAME/daemon/transmission-remote $INSTALL/usr/bin
    cp $PKG_BUILD/.$TARGET_NAME/utils/transmission-create $INSTALL/usr/bin
    cp $PKG_BUILD/.$TARGET_NAME/utils/transmission-edit $INSTALL/usr/bin
    cp $PKG_BUILD/.$TARGET_NAME/utils/transmission-show $INSTALL/usr/bin
    cp -P $PKG_DIR/scripts/* $INSTALL/usr/bin

  mkdir -p $INSTALL/usr/share/transmission/web
    cp -R $PKG_BUILD/web/* $INSTALL/usr/share/transmission/web
    find $INSTALL/usr/share/transmission/web -name "Makefile*" -exec rm -rf {} ";"
    rm -rf $INSTALL/usr/share/transmission/web/LICENSE

  enable_service transmission.service
}
