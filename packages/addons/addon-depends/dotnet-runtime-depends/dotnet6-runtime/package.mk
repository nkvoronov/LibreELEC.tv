# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2021-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="dotnet6-runtime"
PKG_VERSION="6.0.6"
PKG_LICENSE="MIT"
PKG_SITE="https://dotnet.microsoft.com/"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC=".NET Runtime runs applications built with .NET Core, a cross-platform .NET implementation."
PKG_TOOLCHAIN="manual"

case "${ARCH}" in
  "aarch64")
    #PKG_SHA256="375956c3d326f5030a1eff2cafdba8b994ed0e1b87db2dd812ce17e0bca5fb27"
    PKG_URL="https://download.visualstudio.microsoft.com/download/pr/44ed3398-9838-4fd0-b225-60d5aadfb00e/00fd4a320d09a380753b45106e2a8e94/dotnet-runtime-6.0.6-linux-arm64.tar.gz"
    ;;
  "arm")
    #PKG_SHA256="fcc811f37cb6914bf3aa1c96040b1a46fad42939e6b1e1e7e0f513a9be1de680"
    PKG_URL="https://download.visualstudio.microsoft.com/download/pr/3ba760ea-befb-4ec8-9fd8-89e7dd1f46be/17ef5757f98629f1c07e1fbca2b65901/dotnet-runtime-6.0.6-linux-arm.tar.gz"
    ;;
  "x86_64")
    PKG_SHA256="9a3e9b9f39ca51c354725738fea4b931dd4a85e30d0373f0dd2c0517f7de65ac"
    PKG_URL="https://download.visualstudio.microsoft.com/download/pr/ec4172e3-077a-42c0-859d-349e517d7935/82d945cdc4c33fbe440a86a240a58a41/dotnet-runtime-6.0.6-linux-x64.tar.gz"
    ;;
esac

PKG_SOURCE_NAME="dotnet6-runtime_${PKG_VERSION}_${ARCH}.tar.gz"
