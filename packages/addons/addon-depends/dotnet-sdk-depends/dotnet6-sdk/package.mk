# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2021-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="dotnet6-sdk"
PKG_VERSION="6.0.301"
PKG_LICENSE="MIT"
PKG_SITE="https://dotnet.microsoft.com/"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="Build apps - SDK"
PKG_TOOLCHAIN="manual"

case "${ARCH}" in
  "aarch64")
    #PKG_SHA256="ef11a880d59b19f1df355b3c9c8b35ea1aa37e72d179850051cad963cb72358f"
    PKG_URL="https://download.visualstudio.microsoft.com/download/pr/06c4ee8e-bf2c-4e46-ab1c-e14dd72311c1/f7bc6c9677eaccadd1d0e76c55d361ea/dotnet-sdk-6.0.301-linux-arm64.tar.gz"
    ;;
  "arm")
    #PKG_SHA256="29c6aa914739dce59e04d1fc7dceb33e97dfec6624ec3c297a8375f66aece092"
    PKG_URL="https://download.visualstudio.microsoft.com/download/pr/a218e3b9-941b-43be-bfb1-615862777457/80954de34ab68729981ed372a8d25b46/dotnet-sdk-6.0.301-linux-arm.tar.gz"
    ;;
  "x86_64")
    PKG_SHA256="57d146fac54f7c91686a2940d8f098aae91f998cd15b800f29fe88476af66cef"
    PKG_URL="https://download.visualstudio.microsoft.com/download/pr/77d472e5-194c-421e-992d-e4ca1d08e6cc/56c61ac303ddf1b12026151f4f000a2b/dotnet-sdk-6.0.301-linux-x64.tar.gz"
    ;;
esac

PKG_SOURCE_NAME="dotnet6-sdk_${PKG_VERSION}_${ARCH}.tar.gz"

