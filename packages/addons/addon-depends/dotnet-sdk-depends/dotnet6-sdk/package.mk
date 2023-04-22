# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2021-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="dotnet6-sdk"
PKG_VERSION="6.0.408"
PKG_LICENSE="MIT"
PKG_SITE="https://dotnet.microsoft.com/"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="Build apps - SDK"
PKG_TOOLCHAIN="manual"

case "${ARCH}" in
  "aarch64")
    #PKG_SHA256="ef11a880d59b19f1df355b3c9c8b35ea1aa37e72d179850051cad963cb72358f"
    PKG_URL="https://download.visualstudio.microsoft.com/download/pr/9c4bff1b-9f35-44a3-95a3-d17224810b08/0f7426d4ce82cd5b55ed1b6f07877d5e/dotnet-sdk-6.0.408-linux-arm64.tar.gz"
    ;;
  "arm")
    #PKG_SHA256="29c6aa914739dce59e04d1fc7dceb33e97dfec6624ec3c297a8375f66aece092"
    PKG_URL="https://download.visualstudio.microsoft.com/download/pr/ddd2d69f-65ef-4cb2-b34f-468c582d3092/f5572b4b10386c9defc75a813836c3f3/dotnet-sdk-6.0.408-linux-arm.tar.gz"
    ;;
  "x86_64")
    PKG_SHA256="1430024c646db07f97c102db12242f8eb140fa992eac5ff4480dc0228164eace"
    PKG_URL="https://download.visualstudio.microsoft.com/download/pr/dd7d2255-c9c1-4c6f-b8ad-6e853d6bb574/c8e1b5f47bf17b317a84487491915178/dotnet-sdk-6.0.408-linux-x64.tar.gz"
    ;;
esac

PKG_SOURCE_NAME="dotnet6-sdk_${PKG_VERSION}_${ARCH}.tar.gz"

