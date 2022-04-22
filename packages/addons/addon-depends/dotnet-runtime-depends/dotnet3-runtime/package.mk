# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="dotnet3-runtime"
PKG_VERSION="3.1.24"
PKG_LICENSE="MIT"
PKG_SITE="https://dotnet.microsoft.com/"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="ASP.NET Core Runtime runs applications built with .NET Core, a cross-platform .NET implementation."
PKG_TOOLCHAIN="manual"

case "${ARCH}" in
  "aarch64")
    #PKG_SHA256="b76c049484efd86466d2e1cd88994521633c399d090adb1c6804128603816abe"
    PKG_URL="https://download.visualstudio.microsoft.com/download/pr/3196b061-a4aa-45f6-a68b-e6ddc0cca170/1072dbc1e493f057bb4c1a5ae14e0963/aspnetcore-runtime-3.1.24-linux-arm64.tar.gz"
    ;;
  "arm")
    #PKG_SHA256="a0163cd5c5ceae228bfffb40053f3509e155a110c23e81c38705757a870e24cc"
    PKG_URL="https://download.visualstudio.microsoft.com/download/pr/b3ec74f2-38e7-4e91-8e95-692aba5db391/03399b889cb0c8f53740680b48628855/aspnetcore-runtime-3.1.24-linux-arm.tar.gz"
    ;;
  "x86_64")
    PKG_SHA256="514abd2a836fe8ba73fc946e7bb1463cd1b197d19b45d2283e05dacf30cd1472"
    PKG_URL="https://download.visualstudio.microsoft.com/download/pr/cedf0bef-c6f9-4b4a-88e9-8c7835ddb834/5aa57e202f43c2a72b8760be4b2cd008/aspnetcore-runtime-3.1.24-linux-x64.tar.gz"
    ;;
esac
PKG_SOURCE_NAME="aspnetcore3-runtime_${PKG_VERSION}_${ARCH}.tar.gz"
