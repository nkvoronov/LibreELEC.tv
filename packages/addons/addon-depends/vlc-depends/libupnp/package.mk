# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="libupnp"
PKG_VERSION="1.14.17"
PKG_SHA256="9b877242eba0428c7f949af4d6e7b7b908ce5ebc67cc13475ee6eb0d9bcb6ffb"
PKG_LICENSE="GPL"
PKG_SITE="http://pupnp.sourceforge.net/"
PKG_URL="https://downloads.sourceforge.net/sourceforge/pupnp/${PKG_NAME}-${PKG_VERSION}.tar.bz2"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="A Portable Open Source UPnP Development Kit"
PKG_TOOLCHAIN="autotools"

PKG_CONFIGURE_OPTS_TARGET="--host=${TARGET_NAME} --build=${HOST_NAME} --prefix=/usr --disable-samples --without-documentation"

