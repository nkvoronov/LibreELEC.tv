# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="libraw1394"
PKG_VERSION="2.1.0"
PKG_SHA256="0b3126d8158d156de9da2ff4d861c47857acc4318a7ac260258015a22071964f"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://ieee1394.wiki.kernel.org"
PKG_URL="https://www.kernel.org/pub/linux/libs/ieee1394/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="multimedia"
PKG_SHORTDESC="library for direct access to IEEE 1394 bus - development files libraw1394 is the only supported interface to the kernel side raw1394 of the Linux IEEE-1394 subsystem, which provides direct access to the connected 1394 buses to user space.  Through libraw1394/raw1394, applications can directly send to and receive from other nodes without requiring a kernel driver for the protocol in question."
PKG_LONGDESC="library for direct access to IEEE 1394 bus - development files libraw1394 is the only supported interface to the kernel side raw1394 of the Linux IEEE-1394 subsystem, which provides direct access to the connected 1394 buses to user space.  Through libraw1394/raw1394, applications can directly send to and receive from other nodes without requiring a kernel driver for the protocol in question."
PKG_TOOLCHAIN="autotools"

PKG_CONFIGURE_OPTS_TARGET="--enable-static --disable-shared"

post_makeinstall_target() {
  rm -rf $INSTALL/usr/bin
}
