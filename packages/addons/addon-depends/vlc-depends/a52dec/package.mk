# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="a52dec"
PKG_VERSION="0.7.4"
PKG_SHA256="a21d724ab3b3933330194353687df82c475b5dfb997513eef4c25de6c865ec33"
PKG_LICENSE="GPL"
PKG_SITE="http://liba52.sourceforge.net"
PKG_URL="http://download.videolan.org/contrib/a52/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="library for decoding ATSC A/52 streams liba52 is a free library for decoding ATSC A/52 streams. The A/52 standard is used in a variety of applications, including digital television and DVD. It is also known as AC-3."
PKG_TOOLCHAIN="autotools"

post_makeinstall_target() {
  rm -rf $INSTALL/usr/bin
}
