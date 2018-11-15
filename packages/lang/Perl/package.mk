# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)

PKG_NAME="Perl"
PKG_VERSION="5.28.0"
PKG_SHA256="7e929f64d4cb0e9d1159d4a59fc89394e27fa1f7004d0836ca0d514685406ea8"
PKG_LICENSE="GPL"
PKG_SITE="http://www.cpan.org/"
PKG_URL="http://www.cpan.org/src/5.0/perl-$PKG_VERSION.tar.gz"
PKG_SOURCE_DIR="perl-$PKG_VERSION"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="Perl is a high-level programming language"
PKG_TOOLCHAIN="manual"

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