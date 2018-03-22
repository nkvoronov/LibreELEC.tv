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

PKG_NAME="perl"
PKG_VERSION="5.24.1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.cpan.org/"
PKG_URL="http://www.cpan.org/src/5.0/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="lang"
PKG_SHORTDESC="Perl is a high-level programming language"
PKG_LONGDESC="Perl is a high-level programming language"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

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