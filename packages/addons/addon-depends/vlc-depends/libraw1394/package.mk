# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="libraw1394"
PKG_VERSION="2.1.2"
PKG_SHA256="03ccc69761d22c7deb1127fc301010dd13e70e44bb7134b8ff0d07590259a55e"
PKG_LICENSE="GPL"
PKG_SITE="https://ieee1394.wiki.kernel.org"
PKG_URL="https://www.kernel.org/pub/linux/libs/ieee1394/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="library for direct access to IEEE 1394 bus - development files libraw1394 is the only supported interface to the kernel side raw1394 of the Linux IEEE-1394 subsystem, which provides direct access to the connected 1394 buses to user space.  Through libraw1394/raw1394, applications can directly send to and receive from other nodes without requiring a kernel driver for the protocol in question."
PKG_TOOLCHAIN="autotools"

post_makeinstall_target() {
  rm -rf $INSTALL/usr/bin
}
