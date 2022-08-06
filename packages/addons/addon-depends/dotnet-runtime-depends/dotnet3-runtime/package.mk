# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="dotnet3-runtime"
PKG_VERSION="3.1.27"
PKG_LICENSE="MIT"
PKG_SITE="https://dotnet.microsoft.com/"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="ASP.NET Core Runtime runs applications built with .NET Core, a cross-platform .NET implementation."
PKG_TOOLCHAIN="manual"

case "${ARCH}" in
  "aarch64")
    #PKG_SHA256="b76c049484efd86466d2e1cd88994521633c399d090adb1c6804128603816abe"
    PKG_URL="https://download.visualstudio.microsoft.com/download/pr/176b2fbe-87b7-44cd-bbc5-b2d3f17cff6b/c9bfdf9048440f26ae9497e16f0afdcd/dotnet-runtime-3.1.27-linux-arm64.tar.gz"
    ;;
  "arm")
    #PKG_SHA256="a0163cd5c5ceae228bfffb40053f3509e155a110c23e81c38705757a870e24cc"
    PKG_URL="https://download.visualstudio.microsoft.com/download/pr/56641ffc-ee80-4d05-8733-fe59db86331f/d03b4b544471be6a93e96e2a94e10380/dotnet-runtime-3.1.27-linux-arm.tar.gz"
    ;;
  "x86_64")
    PKG_SHA256="a125268b4bff43e501c72ccf946bf978b43afcc8d37f1150f17cb4f70a1dd6b5"
    PKG_URL="https://download.visualstudio.microsoft.com/download/pr/26fcc6c4-0154-4b67-bfe0-85af31f06e7a/b17c38beb93d1642cc8f04d1f18908a4/dotnet-runtime-3.1.27-linux-x64.tar.gz"
    ;;
esac

PKG_SOURCE_NAME="aspnetcore3-runtime_${PKG_VERSION}_${ARCH}.tar.gz"
