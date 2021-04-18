# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="libupnp"
PKG_VERSION="1.14.5"
PKG_SHA256="227ffa407be6b91d4e42abee1dd27e4b8d7e5ba8d3d45394cca4e1eadc65149a"
PKG_LICENSE="GPL"
PKG_SITE="http://pupnp.sourceforge.net/"
PKG_URL="https://downloads.sourceforge.net/sourceforge/pupnp/${PKG_NAME}-${PKG_VERSION}.tar.bz2"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="A Portable Open Source UPnP Development Kit"
PKG_TOOLCHAIN="autotools"

PKG_CONFIGURE_OPTS_TARGET="--host=${TARGET_NAME} --build=${HOST_NAME} --prefix=/usr --disable-samples --without-documentation"

