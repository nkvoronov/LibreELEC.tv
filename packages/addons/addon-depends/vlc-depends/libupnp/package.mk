# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="libupnp"
PKG_VERSION="1.6.25"
PKG_SHA256="c5a300b86775435c076d58a79cc0d5a977d76027d2a7d721590729b7f369fa43"
PKG_LICENSE="GPL"
PKG_SITE="http://pupnp.sourceforge.net/"
PKG_URL="https://downloads.sourceforge.net/sourceforge/pupnp/$PKG_NAME-$PKG_VERSION.tar.bz2"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="A Portable Open Source UPnP Development Kit"
PKG_TOOLCHAIN="autotools"

PKG_CONFIGURE_OPTS_TARGET="--host=$TARGET_NAME --build=$HOST_NAME --prefix=/usr --disable-samples --without-documentation"

