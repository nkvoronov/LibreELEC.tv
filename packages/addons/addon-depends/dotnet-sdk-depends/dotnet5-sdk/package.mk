# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2021-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="dotnet5-sdk"
PKG_VERSION="5.0.407"
PKG_LICENSE="MIT"
PKG_SITE="https://dotnet.microsoft.com/"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="ASP.NET Core Runtime enables you to run existing web/server applications."
PKG_TOOLCHAIN="manual"

case "${ARCH}" in
  "aarch64")
    #PKG_SHA256="ef11a880d59b19f1df355b3c9c8b35ea1aa37e72d179850051cad963cb72358f"
    PKG_URL="https://download.visualstudio.microsoft.com/download/pr/8be77687-0931-40e4-8e50-b1b4cb367277/eef06721da36a9395dbaf8cb879ba820/dotnet-sdk-5.0.407-linux-arm64.tar.gz"
    ;;
  "arm")
    #PKG_SHA256="29c6aa914739dce59e04d1fc7dceb33e97dfec6624ec3c297a8375f66aece092"
    PKG_URL="https://download.visualstudio.microsoft.com/download/pr/17588888-bd97-41e6-a1ef-9f1da6b8bdf6/ab16a7b0b82297f76abc793b5d187952/dotnet-sdk-5.0.407-linux-arm.tar.gz"
    ;;
  "x86_64")
    PKG_SHA256="98bd16719d18662c8206f83f17aa4328ff828c72a31640214c1dd7d7958123b2"
    PKG_URL="https://download.visualstudio.microsoft.com/download/pr/06628342-344d-4524-ba62-e4762c0322f2/49fc2867cf4cfde29c721ff3b03cdf1b/dotnet-sdk-5.0.407-linux-x64.tar.gz"
    ;;
esac
PKG_SOURCE_NAME="dotnet5-sdk_${PKG_VERSION}_${ARCH}.tar.gz"
