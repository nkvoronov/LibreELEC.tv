# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2021-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="dotnet6-sdk"
PKG_VERSION="6.0.302"
PKG_LICENSE="MIT"
PKG_SITE="https://dotnet.microsoft.com/"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="Build apps - SDK"
PKG_TOOLCHAIN="manual"

case "${ARCH}" in
  "aarch64")
    #PKG_SHA256="ef11a880d59b19f1df355b3c9c8b35ea1aa37e72d179850051cad963cb72358f"
    PKG_URL="https://download.visualstudio.microsoft.com/download/pr/33389348-a7d7-41ae-850f-ec46d3ca9612/36bad11f948b05a4fa9faac93c35e574/dotnet-sdk-6.0.302-linux-arm64.tar.gz"
    ;;
  "arm")
    #PKG_SHA256="29c6aa914739dce59e04d1fc7dceb33e97dfec6624ec3c297a8375f66aece092"
    PKG_URL="https://download.visualstudio.microsoft.com/download/pr/f35557f7-d5e1-43be-93b6-e59ee8bd823c/9dd2c25a4d7351412ff5902c355732ca/dotnet-sdk-6.0.302-linux-arm.tar.gz"
    ;;
  "x86_64")
    PKG_SHA256="883a25a15a6aa9d74ae35b23efdb6dced85e52b9519fc590313cec6c2626af79"
    PKG_URL="https://download.visualstudio.microsoft.com/download/pr/0e83f50a-0619-45e6-8f16-dc4f41d1bb16/e0de908b2f070ef9e7e3b6ddea9d268c/dotnet-sdk-6.0.302-linux-x64.tar.gz"
    ;;
esac

PKG_SOURCE_NAME="dotnet6-sdk_${PKG_VERSION}_${ARCH}.tar.gz"

