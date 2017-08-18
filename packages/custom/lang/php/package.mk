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

PKG_NAME="php"
PKG_VERSION="5.6.19"
PKG_ARCH="any"
PKG_LICENSE="OpenSource"
PKG_SITE="http://www.php.net"
PKG_URL="http://www.php.net/distributions/$PKG_NAME-$PKG_VERSION.tar.bz2"
PKG_DEPENDS_TARGET="toolchain zlib pcre curl openssl"
PKG_SECTION="lang"
PKG_SHORTDESC="php: Scripting language especially suited for Web development"
PKG_LONGDESC="PHP is a widely-used general-purpose scripting language that is especially suited for Web development and can be embedded into HTML."

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

PKG_CONFIGURE_OPTS_TARGET="--disable-all \
                           --without-pear \
                           --localstatedir=/var \
                           --enable-cli \
                           --enable-cgi \
                           --disable-sockets \
                           --enable-posix \
                           --disable-spl \
                           --disable-session \
                           --with-openssl=$SYSROOT_PREFIX/usr \
                           --disable-libxml \
                           --disable-xml \
                           --disable-xmlreader \
                           --disable-xmlwriter \
                           --disable-simplexml \
                           --with-zlib=$SYSROOT_PREFIX/usr \
                           --disable-exif \
                           --disable-ftp \
                           --without-gettext \
                           --without-gmp \
                           --enable-json \
                           --without-readline \
                           --disable-pcntl \
                           --disable-sysvmsg \
                           --disable-sysvsem \
                           --disable-sysvshm \
                           --disable-zip \
                           --disable-filter \
                           --disable-calendar \
                           --with-curl=$SYSROOT_PREFIX/usr \
                           --with-pcre-regex \
                           --without-sqlite3 \
                           --disable-pdo \
                           --without-pdo-sqlite \
                           --without-pdo-mysql"

makeinstall_target() {
  : # nothing to install
}

post_install() {
  mkdir -p $INSTALL/usr/bin
    cp $PKG_BUILD/.$TARGET_NAME/sapi/cgi/php-cgi $INSTALL/usr/bin
    cp $PKG_BUILD/.$TARGET_NAME/sapi/cli/php $INSTALL/usr/bin
}
