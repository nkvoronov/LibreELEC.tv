# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2021-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="jellyfin-web"
PKG_VERSION="10.8.0"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://jellyfin.github.io/"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="tools"
PKG_SHORTDESC="Jellyfin Web"
PKG_LONGDESC="Jellyfin Web"
PKG_TOOLCHAIN="manual"

PKG_DEB="yes"

if [ "${PKG_DEB}" = "yes" ]; then
  PKG_PVERSION="1"
  PKG_DVERSION="all"
  PKG_SHA256="f5e5861f3e9941cef17fbd04d294a6f538f258f6167ef5201b97632167cd3af4"
  PKG_URL="https://repo.jellyfin.org/releases/server/ubuntu/stable/web/${PKG_NAME}_${PKG_VERSION}-${PKG_PVERSION}_${PKG_DVERSION}.deb"
else
  PKG_SHA256="db913b7f8d355e330f7e649bda68ef849ca9e9184696601c72696b6c03e72a3b"
  PKG_URL="https://github.com/jellyfin/jellyfin-web/archive/v${PKG_VERSION}.tar.gz"
fi

make_target() {
  if [ "${PKG_DEB}" = "no" ]; then
    cd ${PKG_BUILD}
    rm -rf ${PKG_BUILD}/node_modules
    npm ci --no-audit --unsafe-perm
  fi
}

