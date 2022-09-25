# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2021-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="jellyfin-server"
PKG_VERSION="10.8.5"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://jellyfin.github.io/"
PKG_DEPENDS_TARGET="toolchain"
PKG_SHORTDESC="Jellyfin Server"
PKG_LONGDESC="Jellyfin Server"
PKG_TOOLCHAIN="manual"

PKG_DOTNET="dotnet6-sdk"
PKG_DEB="no"

if [ "${PKG_DEB}" = "yes" ]; then
  PKG_PVERSION="1"
  PKG_DVERSION="amd64"
  PKG_SHA256="896b547430db30f6afefcc9bd8d713b34bbc6a06879d3eae790457e0718c68f3"
  PKG_URL="https://repo.jellyfin.org/releases/server/ubuntu/stable/server/${PKG_NAME}_${PKG_VERSION}-${PKG_PVERSION}_${PKG_DVERSION}.deb"
else
  PKG_SHA256="8bc8247ac37cd91b24b07e49847aeb446ff059f12ca586e6eafe44019279d86e"
  PKG_URL="https://github.com/jellyfin/jellyfin/archive/v${PKG_VERSION}.tar.gz"
  PKG_DEPENDS_TARGET+=" ${PKG_DOTNET}"
fi

PKG_DOTNET_BIN=$(get_build_dir ${PKG_DOTNET})/dotnet
DOTNETRUNTIME="debian-x64"

make_target() {
  if [ "${PKG_DEB}" = "no" ]; then
    cd ${PKG_BUILD}
    mkdir ${PKG_BUILD}/release

    # Disable dotnet telemetry
    export DOTNET_CLI_TELEMETRY_OPTOUT=1

    ${PKG_DOTNET_BIN} publish --configuration Release --output ${PKG_BUILD}/release --self-contained --runtime ${DOTNETRUNTIME} "-p:DebugSymbols=false;DebugType=none" Jellyfin.Server
  fi
}

