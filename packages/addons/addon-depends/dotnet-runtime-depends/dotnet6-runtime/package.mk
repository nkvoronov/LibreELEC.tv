# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2021-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="dotnet6-runtime"
PKG_VERSION="6.0.16"
PKG_LICENSE="MIT"
PKG_SITE="https://dotnet.microsoft.com/"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC=".NET Runtime runs applications built with .NET Core, a cross-platform .NET implementation."
PKG_TOOLCHAIN="manual"

case "${ARCH}" in
  "aarch64")
    #PKG_SHA256="375956c3d326f5030a1eff2cafdba8b994ed0e1b87db2dd812ce17e0bca5fb27"
    PKG_URL="https://download.visualstudio.microsoft.com/download/pr/e7866e12-a380-4994-9c56-1bd3a1e0a546/22a5e54cb4e637c5aac7ec6dcab0d739/dotnet-runtime-6.0.16-linux-arm64.tar.gz"
    ;;
  "arm")
    #PKG_SHA256="fcc811f37cb6914bf3aa1c96040b1a46fad42939e6b1e1e7e0f513a9be1de680"
    PKG_URL="https://download.visualstudio.microsoft.com/download/pr/7039aeff-2d14-46b3-a560-e5af5591d6c6/3cb3a4aae10e161413fda1100007551a/dotnet-runtime-6.0.16-linux-arm.tar.gz"
    ;;
  "x86_64")
    PKG_SHA256="93d49e7298fc03232b2b04d4227316ebb9541bcbda202a5c41ed24004eaeb0fd"
    PKG_URL="https://download.visualstudio.microsoft.com/download/pr/45395f1b-8928-41c5-9585-f01d949b2afb/0911c4025fffc0f51c3ab535695c6ca6/dotnet-runtime-6.0.16-linux-x64.tar.gz"
    ;;
esac

PKG_SOURCE_NAME="dotnet6-runtime_${PKG_VERSION}_${ARCH}.tar.gz"
