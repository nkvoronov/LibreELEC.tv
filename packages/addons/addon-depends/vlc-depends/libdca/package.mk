# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="libdca"
PKG_VERSION="0.0.5"
PKG_SHA256="dba022e022109a5bacbe122d50917769ff27b64a7bba104bd38ced8de8510642"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.videolan.org/developers/libdca.html"
PKG_URL="http://download.videolan.org/pub/contrib/dca/$PKG_NAME-$PKG_VERSION.tar.bz2"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="audio"
PKG_SHORTDESC="decoding library for DTS Coherent Acoustics streams (development) libdca provides a low-level interface to decode audio frames encoded using DTS Coherent Acoustics. DTS Coherent Acoustics streams are commonly found on DVDs, DTS audio CDs and some radio broadcastings. libdca also provides downmixing and dynamic range compression for various output configurations."
PKG_LONGDESC="decoding library for DTS Coherent Acoustics streams (development) libdca provides a low-level interface to decode audio frames encoded using DTS Coherent Acoustics. DTS Coherent Acoustics streams are commonly found on DVDs, DTS audio CDs and some radio broadcastings. libdca also provides downmixing and dynamic range compression for various output configurations."
PKG_TOOLCHAIN="autotools"

PKG_CONFIGURE_OPTS_TARGET="--disable-shared --enable-static"

post_makeinstall_target() {
  rm -rf $INSTALL/usr/bin
}
