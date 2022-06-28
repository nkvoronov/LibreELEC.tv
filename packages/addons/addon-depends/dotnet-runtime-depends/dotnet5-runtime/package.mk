# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2021-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="dotnet5-runtime"
PKG_VERSION="5.0.17"
PKG_LICENSE="MIT"
PKG_SITE="https://dotnet.microsoft.com/"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC=".NET Runtime runs applications built with .NET Core, a cross-platform .NET implementation."
PKG_TOOLCHAIN="manual"

case "${ARCH}" in
  "aarch64")
    #PKG_SHA256="375956c3d326f5030a1eff2cafdba8b994ed0e1b87db2dd812ce17e0bca5fb27"
    PKG_URL="https://download.visualstudio.microsoft.com/download/pr/6690730f-cf10-40f1-9d4d-4c0d002f22d0/e117133858f190c169873200b8d7b9d7/dotnet-runtime-5.0.17-linux-arm64.tar.gz"
    ;;
  "arm")
    #PKG_SHA256="fcc811f37cb6914bf3aa1c96040b1a46fad42939e6b1e1e7e0f513a9be1de680"
    PKG_URL="https://download.visualstudio.microsoft.com/download/pr/bf63c6b3-686f-42c1-bc6c-7d4fa5aa419c/cf21a114adde9ecbc66f17a693562c4f/dotnet-runtime-5.0.17-linux-arm.tar.gz"
    ;;
  "x86_64")
    PKG_SHA256="12b44025aabf3d28242c47f84dd14237ad7f496715be55a7c5afd0fb34f66c8b"
    PKG_URL="https://download.visualstudio.microsoft.com/download/pr/e77438f6-865f-45e0-9a52-3e4b04aa609f/024a880ed4bfbfd3b9f222fec0b6aaff/dotnet-runtime-5.0.17-linux-x64.tar.gz"
    ;;
esac

PKG_SOURCE_NAME="dotnet5-runtime_${PKG_VERSION}_${ARCH}.tar.gz"
