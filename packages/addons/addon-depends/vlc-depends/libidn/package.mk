# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="libidn"
PKG_VERSION="1.32"
#PKG_SHA256="9ba8b04bdb13f7860a2041768ac83b47b397a36549c71c530b94028a3cfd5b51"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.gnutls.org"
PKG_URL="http://ftp.gnu.org/gnu/libidn/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="devel"
PKG_SHORTDESC="libidn is a package designed for internationalized string handling based on the Stringprep, Punycode and IDNA specifications defined by the Internet Engineering Task Force (IETF) Internationalized Domain Names (IDN) working group, used for internationalized domain names. This is useful for converting data from the system's native representation into UTF-8, transforming Unicode strings into ASCII strings, allowing applications to use certain ASCII name labels (beginning with a special prefix) to represent non-ASCII name labels, and converting entire domain names to and from the ASCII Compatible Encoding (ACE) form."
PKG_LONGDESC="libidn is a package designed for internationalized string handling based on the Stringprep, Punycode and IDNA specifications defined by the Internet Engineering Task Force (IETF) Internationalized Domain Names (IDN) working group, used for internationalized domain names. This is useful for converting data from the system's native representation into UTF-8, transforming Unicode strings into ASCII strings, allowing applications to use certain ASCII name labels (beginning with a special prefix) to represent non-ASCII name labels, and converting entire domain names to and from the ASCII Compatible Encoding (ACE) form."
PKG_TOOLCHAIN="autotools"

PKG_CONFIGURE_OPTS_TARGET="--enable-static --disable-shared"

post_makeinstall_target() {
  rm -rf $INSTALL
}
