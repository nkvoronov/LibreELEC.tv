################################################################################
#      This file is part of OpenELEC - http://www.openelec.tv
#      Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
#
#  OpenELEC is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 2 of the License, or
#  (at your option) any later version.
#
#  OpenELEC is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with OpenELEC.  If not, see <http://www.gnu.org/licenses/>.
################################################################################

PKG_NAME="Date-Manip"
PKG_VERSION="6.48"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://cpansearch.perl.org/"
PKG_URL="$DISTRO_CUSTOM_SRC/$PKG_NAME/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain perl Test-Inter"
PKG_PRIORITY="optional"
PKG_SECTION="custom/devel"
PKG_SHORTDESC="Perl Date manipulation routines"
PKG_LONGDESC="Perl Date manipulation routines"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

make_target() {
  perl Makefile.PL PREFIX=/usr \
    INSTALLPRIVLIB=/usr/lib/perl5 \
    INSTALLSCRIPT=/usr/bin \
    INSTALLSITELIB=/usr/lib/perl5/site_perl/$PERL_VERSION \
    INSTALLBIN=/usr/bin
  make
  make test
}

post_makeinstall_target() {
  rm -rf $INSTALL/usr/local
  rm -rf $INSTALL/usr/lib/perl
}