# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)

PKG_NAME="Perl"
PKG_VERSION="5.24.1"
PKG_SHA256="e6c185c9b09bdb3f1b13f678999050c639859a7ef39c8cad418448075f5918af"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.cpan.org/"
PKG_URL="http://www.cpan.org/src/5.0/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="lang"
PKG_SHORTDESC="Perl is a high-level programming language"
PKG_LONGDESC="Perl is a high-level programming language"

pre_build_target() {
  rm -rf $PKG_BUILD/.$TARGET_NAME
  mkdir -p $PKG_BUILD/.$TARGET_NAME
  cp -RP $PKG_BUILD/* $PKG_BUILD/.$TARGET_NAME
}

configure_target() {
  ./Configure -des -Dprefix=/usr
}

make_target() {
  make
  make test
}