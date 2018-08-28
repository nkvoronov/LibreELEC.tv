# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="gnutls"
PKG_VERSION="3.4.5"
#PKG_VERSION="3.5.19"
PKG_SHA256="af88b8e0460728d034ff3f454f7851a09b7f0959a93531b6f8d35658ef0f7aae"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.gnutls.org"
PKG_URL="ftp://ftp.gnutls.org/gcrypt/gnutls/v3.4/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="toolchain nettle gmp libidn"
#PKG_DEPENDS_TARGET="toolchain libtasn1 readline zlib nettle p11-kit libidn libunistring"
PKG_SECTION="devel"
PKG_SHORTDESC="GnuTLS is a portable library which implements the Transport Layer Security (TLS 1.0, 1.1, 1.2) and Secure Sockets Layer (SSL) 3.0 and Datagram Transport Layer Security (DTLS 1.0, 1.2) protocols."
PKG_LONGDESC="GnuTLS is a portable library which implements the Transport Layer Security (TLS 1.0, 1.1, 1.2) and Secure Sockets Layer (SSL) 3.0 and Datagram Transport Layer Security (DTLS 1.0, 1.2) protocols."
PKG_TOOLCHAIN="autotools"

PKG_CONFIGURE_OPTS_TARGET="--enable-static --disable-shared --with-included-libtasn1 --without-p11-kit"

post_makeinstall_target() {
  rm -rf $INSTALL/usr/bin
}
