# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2021-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="jellyfin-server"
PKG_VERSION="10.7.7"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://jellyfin.github.io/"
PKG_DEPENDS_TARGET="toolchain"
PKG_SHORTDESC="Jellyfin Server"
PKG_LONGDESC="Jellyfin Server"
PKG_TOOLCHAIN="manual"

PKG_DOTNET="dotnet5-sdk"
PKG_DEB="no"

if [ "${PKG_DEB}" = "yes" ]; then
  PKG_PVERSION="1"
  PKG_DVERSION="amd64"
  PKG_SHA256="f546d3efbdd5291734ce1a51bb7ebd8930be7921e819cc5eddfecc450a5d4af9"
  PKG_URL="https://repo.jellyfin.org/releases/server/ubuntu/stable/server/${PKG_NAME}_${PKG_VERSION}-${PKG_PVERSION}_${PKG_DVERSION}.deb"
else
  PKG_SHA256="9cc1ff3c6c48afb1c7e4a8c63d05e9c501f5d05485ca56b74d1c72736a43221d"
  PKG_URL="https://github.com/jellyfin/jellyfin/archive/v${PKG_VERSION}.tar.gz"
  PKG_DEPENDS_TARGET+=" ${PKG_DOTNET}"
fi

PKG_DOTNET_BIN=$(get_build_dir ${PKG_DOTNET})/dotnet
DOTNETRUNTIME="linux-x64"

make_target() {
  if [ "${PKG_DEB}" = "no" ]; then
    cd ${PKG_BUILD}
    mkdir ${PKG_BUILD}/release

    # Disable dotnet telemetry
    export DOTNET_CLI_TELEMETRY_OPTOUT=1

    ${PKG_DOTNET_BIN} publish --configuration Release --output ${PKG_BUILD}/release --self-contained --runtime ${DOTNETRUNTIME} "-p:DebugSymbols=false;DebugType=none" Jellyfin.Server
  fi
}

