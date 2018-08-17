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

PKG_NAME="libavc1394"
PKG_VERSION="0.5.4"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://sourceforge.net/projects/libavc1394"
PKG_URL="http://downloads.sourceforge.net/sourceforge/libavc1394/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain libraw1394"
PKG_SECTION="multimedia"
PKG_SHORTDESC="control IEEE 1394 audio/video devices (development files) libavc1394 is a programming interface for the 1394 Trade Association AV/C (Audio/Video Control) Digital Interface Command Set. It allows you to remote control camcorders and similar devices connected to your computer via an IEEE 1394 (aka Firewire) link."
PKG_LONGDESC="control IEEE 1394 audio/video devices (development files) libavc1394 is a programming interface for the 1394 Trade Association AV/C (Audio/Video Control) Digital Interface Command Set. It allows you to remote control camcorders and similar devices connected to your computer via an IEEE 1394 (aka Firewire) link."

PKG_IS_ADDON="no"
PKG_AUTORECONF="yes"

PKG_CONFIGURE_OPTS_TARGET="--enable-static --disable-shared"

post_makeinstall_target() {
  rm -rf $INSTALL/usr/bin
}
