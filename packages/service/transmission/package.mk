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

PKG_NAME="transmission"
PKG_VERSION="2.92"
PKG_ARCH="any"
PKG_LICENSE="OSS"
PKG_SITE="http://www.transmissionbt.com/"
PKG_URL="https://github.com/transmission/transmission-releases/raw/master/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="toolchain zlib openssl curl libevent"
PKG_SECTION="service"
PKG_SHORTDESC="transmission: a fast, easy and free BitTorrent client"
PKG_LONGDESC="transmission is a fast, easy and free BitTorrent client"

PKG_IS_ADDON="no"
PKG_AUTORECONF="yes"

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

makeinstall_target() {
  : # nothing
}

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
