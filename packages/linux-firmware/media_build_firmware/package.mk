################################################################################
#      This file is part of LibreELEC - https://libreelec.tv
#      Copyright (C) 2016-present Team LibreELEC
#      Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
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

PKG_NAME="media_build_firmware"
PKG_VERSION="1.0.0"
PKG_ARCH="any"
PKG_LICENSE="Free-to-use"
PKG_SITE="https://bitbucket.org/CrazyCat/media_build/downloads/"
PKG_URL="https://bitbucket.org/CrazyCat/media_build/downloads/dvb-firmwares.tar.bz2"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="firmware"
PKG_SHORTDESC="dvb-firmware: firmwares for various DVB drivers"
PKG_LONGDESC="dvb-firmware: firmwares for various DVB drivers"

PKG_AUTORECONF="no"

unpack() {
  mkdir -p $PKG_BUILD/firmware
  cd $PKG_BUILD/firmware
  tar xvfj $ROOT/sources/$PKG_NAME/$PKG_NAME-$PKG_VERSION.tar.bz2
}

make_target() {
  : # nothing todo
}

makeinstall_target() {
  DESTDIR=$INSTALL/usr ./install
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/firmware
    cp -PR $PKG_BUILD/firmware/* $INSTALL/usr/lib/firmware
}
