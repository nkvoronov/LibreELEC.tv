# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2021-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="jellyfin-web"
PKG_VERSION="10.8.1"
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
  PKG_SHA256="0b7ab57f6d88ea1bd87f88b56bcaf597b88f3b73ca037007d3f6dae7b4673215"
  PKG_URL="https://repo.jellyfin.org/releases/server/ubuntu/stable/web/${PKG_NAME}_${PKG_VERSION}-${PKG_PVERSION}_${PKG_DVERSION}.deb"
else
  PKG_SHA256="66304b68c7360718d614cb650d580cfd7026e37734ff2f2ec27d185cb0c8358b"
  PKG_URL="https://github.com/jellyfin/jellyfin-web/archive/v${PKG_VERSION}.tar.gz"
fi

make_target() {
  if [ "${PKG_DEB}" = "no" ]; then
    cd ${PKG_BUILD}
    rm -rf ${PKG_BUILD}/node_modules
    npm ci --no-audit --unsafe-perm
  fi
}

