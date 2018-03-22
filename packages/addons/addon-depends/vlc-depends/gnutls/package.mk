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

PKG_NAME="gnutls"
PKG_VERSION="3.4.5"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.gnutls.org"
PKG_URL="ftp://ftp.gnutls.org/gcrypt/gnutls/v3.4/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="toolchain nettle gmp libidn"
PKG_SECTION="devel"
PKG_SHORTDESC="GnuTLS is a portable library which implements the Transport Layer Security (TLS 1.0, 1.1, 1.2) and Secure Sockets Layer (SSL) 3.0 and Datagram Transport Layer Security (DTLS 1.0, 1.2) protocols."
PKG_LONGDESC="GnuTLS is a portable library which implements the Transport Layer Security (TLS 1.0, 1.1, 1.2) and Secure Sockets Layer (SSL) 3.0 and Datagram Transport Layer Security (DTLS 1.0, 1.2) protocols."

PKG_IS_ADDON="no"
PKG_AUTORECONF="yes"

PKG_CONFIGURE_OPTS_TARGET="--enable-static --disable-shared --with-included-libtasn1 --without-p11-kit"

post_makeinstall_target() {
  rm -rf $INSTALL/usr/bin
}
