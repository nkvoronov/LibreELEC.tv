# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2021-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="dotnet6-sdk"
PKG_VERSION="6.0.202"
PKG_LICENSE="MIT"
PKG_SITE="https://dotnet.microsoft.com/"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="Build apps - SDK"
PKG_TOOLCHAIN="manual"

case "${ARCH}" in
  "aarch64")
    #PKG_SHA256="ef11a880d59b19f1df355b3c9c8b35ea1aa37e72d179850051cad963cb72358f"
    PKG_URL="https://download.visualstudio.microsoft.com/download/pr/952f5525-7227-496f-85e5-09cadfb44629/eefd0f6eb8f809bfaf4f0661809ed826/dotnet-sdk-6.0.202-linux-arm64.tar.gz"
    ;;
  "arm")
    #PKG_SHA256="29c6aa914739dce59e04d1fc7dceb33e97dfec6624ec3c297a8375f66aece092"
    PKG_URL="https://download.visualstudio.microsoft.com/download/pr/e41a177d-9f0b-4afe-97a4-53587cd89d00/c2c897aa6442d49c1d2d86abb23c20b2/dotnet-sdk-6.0.202-linux-arm.tar.gz"
    ;;
  "x86_64")
    PKG_SHA256="452e08f0d85238c5123f96f422a9cb54ec32d70a8a5787663b2a26770644bf15"
    PKG_URL="https://download.visualstudio.microsoft.com/download/pr/9d8c7137-2091-4fc6-a419-60ba59c8b9de/db0c5cda94f31d2260d369123de32d59/dotnet-sdk-6.0.202-linux-x64.tar.gz"
    ;;
esac
PKG_SOURCE_NAME="dotnet6-sdk_${PKG_VERSION}_${ARCH}.tar.gz"

