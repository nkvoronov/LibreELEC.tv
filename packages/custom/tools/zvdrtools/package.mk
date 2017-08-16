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

PKG_NAME="zvdrtools"
PKG_VERSION="d06044e"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/SlavikZ/zvdrtools.git"
PKG_GIT_URL="https://github.com/SlavikZ/zvdrtools.git"
PKG_DEPENDS_TARGET="toolchain Python python-xmltv"
PKG_SECTION="tools"
PKG_SHORTDESC="zvdrtools: python VDR tools"
PKG_LONGDESC="zvdrtools: python VDR tools"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

post_unpack() {
  for patch in `ls $PKG_DIR/patches.upstream/*.patch`; do
    cat $patch | patch -d \
    `echo $BUILD/$PKG_NAME-$PKG_VERSION | cut -f1 -d\ ` -p1
  done
}

make_target() {
  : # nothing to make here
}

makeinstall_target() {
  : # nothing to install here
}

post_install() {
  mkdir -p $INSTALL/usr/config/epgs/bin
    cp -P $PKG_DIR/scripts/* $INSTALL/usr/config/epgs/bin

  mkdir -p $INSTALL/usr/config/epgs/resources/$PKG_NAME
    cp -PR $PKG_BUILD/* $INSTALL/usr/config/epgs/resources/$PKG_NAME

  mkdir -p $INSTALL/usr/config/epgs/config/$PKG_NAME
    cp -P $PKG_DIR/config/* $INSTALL/usr/config/epgs/config/$PKG_NAME
}