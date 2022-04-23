# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2021-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="jellyfin-web"
PKG_VERSION="10.7.7"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://jellyfin.github.io/"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="tools"
PKG_SHORTDESC="Jellyfin Web"
PKG_LONGDESC="Jellyfin Web"

PKG_DEB="yes"

if [ "${PKG_DEB}" = "yes" ]; then
  PKG_PVERSION="1"
  PKG_DVERSION="all"
  PKG_SHA256="ca06cc1be55cb0393de9cd002e5cd422b7746c68341125b8f4c18907c59647c8"
  PKG_URL="https://repo.jellyfin.org/releases/server/ubuntu/stable/web/${PKG_NAME}_${PKG_VERSION}-${PKG_PVERSION}_${PKG_DVERSION}.deb"
  PKG_TOOLCHAIN="manual"
else
  PKG_SHA256="67b237b05bbc463828229971ce509d860b9d69cfee6aef4ba57b0c15d844bd78"
  PKG_URL="https://github.com/jellyfin/jellyfin-web/archive/v${PKG_VERSION}.tar.gz"
  PKG_DEPENDS_TARGET+=" yarn"
  PKG_TOOLCHAIN="manual"
fi

make_target() {
  if [ "${PKG_DEB}" = "no" ]; then
    cd ${PKG_BUILD}
    yarn install
  fi
}

