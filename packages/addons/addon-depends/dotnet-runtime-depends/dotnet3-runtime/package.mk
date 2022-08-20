# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="dotnet3-runtime"
PKG_VERSION="3.1.28"
PKG_LICENSE="MIT"
PKG_SITE="https://dotnet.microsoft.com/"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="ASP.NET Core Runtime runs applications built with .NET Core, a cross-platform .NET implementation."
PKG_TOOLCHAIN="manual"

case "${ARCH}" in
  "aarch64")
    #PKG_SHA256="b76c049484efd86466d2e1cd88994521633c399d090adb1c6804128603816abe"
    PKG_URL="https://download.visualstudio.microsoft.com/download/pr/d71449b4-4504-410b-a805-48b3a6af5182/06abb8b35645e76dbe8cc4d17fdcbf89/dotnet-runtime-3.1.28-linux-arm64.tar.gz"
    ;;
  "arm")
    #PKG_SHA256="a0163cd5c5ceae228bfffb40053f3509e155a110c23e81c38705757a870e24cc"
    PKG_URL="https://download.visualstudio.microsoft.com/download/pr/70405685-0adb-4e7e-92a3-da9f22041538/cc88879e8aa05ac1d8c555142fd83ae7/dotnet-runtime-3.1.28-linux-arm.tar.gz"
    ;;
  "x86_64")
    PKG_SHA256="dbb5552b8082b22d0a348291d030b324cf4e4c7d409dccb6fb3c859b9f16a114"
    PKG_URL="https://download.visualstudio.microsoft.com/download/pr/9a0b8ff8-d3da-4e77-9b5b-2fb3202afbbe/94dbcaacd4ebf59106a141c8e9e84167/dotnet-runtime-3.1.28-linux-x64.tar.gz"
    ;;
esac

PKG_SOURCE_NAME="aspnetcore3-runtime_${PKG_VERSION}_${ARCH}.tar.gz"
