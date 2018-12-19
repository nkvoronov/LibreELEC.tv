# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="libavc1394"
PKG_VERSION="0.5.4"
PKG_SHA256="7cb1ff09506ae911ca9860bef4af08c2403f3e131f6c913a2cbd6ddca4215b53"
PKG_LICENSE="GPL"
PKG_SITE="http://sourceforge.net/projects/libavc1394"
PKG_URL="http://downloads.sourceforge.net/sourceforge/libavc1394/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain libraw1394"
PKG_LONGDESC="control IEEE 1394 audio/video devices (development files) libavc1394 is a programming interface for the 1394 Trade Association AV/C (Audio/Video Control) Digital Interface Command Set. It allows you to remote control camcorders and similar devices connected to your computer via an IEEE 1394 (aka Firewire) link."
PKG_TOOLCHAIN="autotools"

post_makeinstall_target() {
  rm -rf $INSTALL/usr/bin
}
