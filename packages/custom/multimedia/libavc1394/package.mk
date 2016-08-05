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

PKG_NAME="libavc1394"
PKG_VERSION="0.5.4"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://sourceforge.net/projects/libavc1394"
PKG_URL="$DISTRO_CUSTOM_SRC/$PKG_NAME/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="toolchain libraw1394"
PKG_PRIORITY="optional"
PKG_SECTION="multimedia"
PKG_SHORTDESC="control IEEE 1394 audio/video devices (development files) libavc1394 is a programming interface for the 1394 Trade Association AV/C (Audio/Video Control) Digital Interface Command Set. It allows you to remote control camcorders and similar devices connected to your computer via an IEEE 1394 (aka Firewire) link."
PKG_LONGDESC="control IEEE 1394 audio/video devices (development files) libavc1394 is a programming interface for the 1394 Trade Association AV/C (Audio/Video Control) Digital Interface Command Set. It allows you to remote control camcorders and similar devices connected to your computer via an IEEE 1394 (aka Firewire) link."

PKG_IS_ADDON="no"
PKG_AUTORECONF="yes"

PKG_CONFIGURE_OPTS_TARGET="--enable-static --disable-shared"

post_makeinstall_target() {
  rm -rf $INSTALL/usr/bin
}
