# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2021-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="dotnet6-runtime"
PKG_VERSION="6.0.7"
PKG_LICENSE="MIT"
PKG_SITE="https://dotnet.microsoft.com/"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC=".NET Runtime runs applications built with .NET Core, a cross-platform .NET implementation."
PKG_TOOLCHAIN="manual"

case "${ARCH}" in
  "aarch64")
    #PKG_SHA256="375956c3d326f5030a1eff2cafdba8b994ed0e1b87db2dd812ce17e0bca5fb27"
    PKG_URL="https://download.visualstudio.microsoft.com/download/pr/f9706e92-c7a1-4dc8-806a-0e95827c5b02/23be52946e4e2425c798208c5f16bb64/dotnet-runtime-6.0.7-linux-arm64.tar.gz"
    ;;
  "arm")
    #PKG_SHA256="fcc811f37cb6914bf3aa1c96040b1a46fad42939e6b1e1e7e0f513a9be1de680"
    PKG_URL="https://download.visualstudio.microsoft.com/download/pr/a9be5a0b-5a78-42fe-a387-adb609d115e8/faa10b75513805e36ff7b36044d11507/dotnet-runtime-6.0.7-linux-arm.tar.gz"
    ;;
  "x86_64")
    PKG_SHA256="6ed407c5c6d365673e707bd9532a0db78d43fbdb2cea99674a841c784cba5063"
    PKG_URL="https://download.visualstudio.microsoft.com/download/pr/bd828687-1706-4041-a804-5e93631fe256/d4ec75936459a7e8c772c929edcbfeda/dotnet-runtime-6.0.7-linux-x64.tar.gz"
    ;;
esac

PKG_SOURCE_NAME="dotnet6-runtime_${PKG_VERSION}_${ARCH}.tar.gz"
