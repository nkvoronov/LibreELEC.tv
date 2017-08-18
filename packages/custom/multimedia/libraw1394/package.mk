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

PKG_NAME="libraw1394"
PKG_VERSION="2.1.0"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://ieee1394.wiki.kernel.org"
PKG_URL="https://www.kernel.org/pub/linux/libs/ieee1394/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="multimedia"
PKG_SHORTDESC="library for direct access to IEEE 1394 bus - development files libraw1394 is the only supported interface to the kernel side raw1394 of the Linux IEEE-1394 subsystem, which provides direct access to the connected 1394 buses to user space.  Through libraw1394/raw1394, applications can directly send to and receive from other nodes without requiring a kernel driver for the protocol in question."
PKG_LONGDESC="library for direct access to IEEE 1394 bus - development files libraw1394 is the only supported interface to the kernel side raw1394 of the Linux IEEE-1394 subsystem, which provides direct access to the connected 1394 buses to user space.  Through libraw1394/raw1394, applications can directly send to and receive from other nodes without requiring a kernel driver for the protocol in question."

PKG_IS_ADDON="no"
PKG_AUTORECONF="yes"

PKG_CONFIGURE_OPTS_TARGET="--enable-static --disable-shared"

post_makeinstall_target() {
  rm -rf $INSTALL/usr/bin
}
