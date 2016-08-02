################################################################################
#      This file is part of OpenELEC - http://www.openelec.tv
#      Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
#
#  This Program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2, or (at your option)
#  any later version.
#
#  This Program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with OpenELEC.tv; see the file COPYING.  If not, write to
#  the Free Software Foundation, 51 Franklin Street, Suite 500, Boston, MA 02110, USA.
#  http://www.gnu.org/copyleft/gpl.html
################################################################################

PKG_NAME="hddtemp_"
PKG_VERSION="0.3-beta15"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.guzu.net/linux/hddtemp.php"
PKG_URL="http://download.savannah.gnu.org/releases/hddtemp/$PKG_NAME-$PKG_VERSION.tar.bz2"
PKG_DEPENDS_TARGET="toolchain"
PKG_PRIORITY="optional"
PKG_SECTION="custom/debug"
PKG_SHORTDESC="hddtemp: tool that reports hard drive temperature"
PKG_LONGDESC="hddtemp is a small utility (daemonizable) that gives you the temperature of your hard drive by reading S.M.A.R.T. informations (for drives that support this feature)."

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

PKG_CONFIGURE_OPTS_TARGET="--with-db-path=/etc/hddtemp.db"

makeinstall_target() {
  : # nop
}

post_install() {
  mkdir -p $INSTALL/usr/bin
    cp -P $PKG_BUILD/.$TARGET_NAME/src/hddtemp $INSTALL/usr/bin
  mkdir -p $INSTALL/etc
    cp -P $PKG_DIR/data/hddtemp.db $INSTALL/etc
}
