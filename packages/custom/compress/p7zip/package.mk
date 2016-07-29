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

PKG_NAME="p7zip"
PKG_VERSION="9.20.1"
PKG_REV="0"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://p7zip.sourceforge.net/"
PKG_URL="http://downloads.sourceforge.net/project/p7zip/p7zip/${PKG_VERSION}/p7zip_${PKG_VERSION}_src_all.tar.bz2"
PKG_SOURCE_DIR="${PKG_NAME}_${PKG_VERSION}"
PKG_DEPENDS_TARGET="toolchain"
PKG_PRIORITY="optional"
PKG_SECTION="custom/compress"
PKG_SHORTDESC="p7zip is a port of 7za.exe for POSIX systems like Unix"
PKG_LONGDESC="p7zip is a port of 7za.exe for POSIX systems like Unix"
PKG_DISCLAIMER="this is an unofficial addon. please don't ask for support in openelec forum / irc channel"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

make_target() {
  make TARGET_CXX=$TARGET_CXX TARGET_CC=$TARGET_CC 7z 7za
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/bin
    cp -aP $ROOT/$PKG_BUILD/bin/Codecs $INSTALL/usr/bin
    cp -aP $ROOT/$PKG_BUILD/bin/7z.so $INSTALL/usr/bin
    cp -aP $ROOT/$PKG_BUILD/bin/7z $INSTALL/usr/bin
    cp -aP $ROOT/$PKG_BUILD/bin/7za $INSTALL/usr/bin
}
