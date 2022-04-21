# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2021-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="dotnet5-runtime"
PKG_VERSION="5.0.8"
PKG_LICENSE="MIT"
PKG_SITE="https://dotnet.microsoft.com/"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC=".NET Runtime runs applications built with .NET Core, a cross-platform .NET implementation."
PKG_TOOLCHAIN="manual"

case "${ARCH}" in
  "aarch64")
    #PKG_SHA256="375956c3d326f5030a1eff2cafdba8b994ed0e1b87db2dd812ce17e0bca5fb27"
    PKG_URL="https://download.visualstudio.microsoft.com/download/pr/9810823d-5422-4582-8765-22a88738f706/5f0f5842ed94d48513a88419d301d693/dotnet-runtime-5.0.8-linux-arm64.tar.gz"
    ;;
  "arm")
    #PKG_SHA256="fcc811f37cb6914bf3aa1c96040b1a46fad42939e6b1e1e7e0f513a9be1de680"
    PKG_URL="https://download.visualstudio.microsoft.com/download/pr/06f47628-7e59-4e2a-9002-72d7e11b8cde/79a68d8fc9812b4f94e4f9f32f3acbc8/dotnet-runtime-5.0.8-linux-arm.tar.gz"
    ;;
  "x86_64")
    PKG_SHA256="2a729240c6518c7c995769b1be7757e2e0388a58dca65236561a300f60ef096a"
    PKG_URL="https://download.visualstudio.microsoft.com/download/pr/50687c84-e120-4410-bd4a-b1e0869d03f4/6038576259f95ef61d4d103ee3967130/dotnet-runtime-5.0.8-linux-x64.tar.gz"

    ;;
esac
PKG_SOURCE_NAME="dotnet-runtime_${PKG_VERSION}_${ARCH}.tar.gz"
