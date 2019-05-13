# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="libmtp"
PKG_VERSION="1.1.16"
PKG_SHA256="5b68f9dd1ed38de558de687f40e255a39e4d5e32ef3de601f0ac19dd5682bba0"
PKG_LICENSE="GPL"
PKG_SITE="http://libmtp.sourceforge.net/"
PKG_URL="$SOURCEFORGE_SRC/project/$PKG_NAME/$PKG_NAME/$PKG_VERSION/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain libusb"
PKG_LONGDESC="An Initiator implementation of the Media Transfer Protocol (MTP)."
PKG_TOOLCHAIN="autotools"

PKG_CONFIGURE_OPTS_TARGET="ac_cv_func_malloc_0_nonnull=yes \
                           --disable-mtpz"
