# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="dotnet3-runtime"
PKG_VERSION="3.1.29"
PKG_LICENSE="MIT"
PKG_SITE="https://dotnet.microsoft.com/"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="ASP.NET Core Runtime runs applications built with .NET Core, a cross-platform .NET implementation."
PKG_TOOLCHAIN="manual"

case "${ARCH}" in
  "aarch64")
    #PKG_SHA256="b76c049484efd86466d2e1cd88994521633c399d090adb1c6804128603816abe"
    PKG_URL="https://download.visualstudio.microsoft.com/download/pr/d859c2b0-4af9-441f-8c13-35e119224624/357a1322f8612211c336c63f25553f46/dotnet-runtime-3.1.29-linux-arm64.tar.gz"
    ;;
  "arm")
    #PKG_SHA256="a0163cd5c5ceae228bfffb40053f3509e155a110c23e81c38705757a870e24cc"
    PKG_URL="https://download.visualstudio.microsoft.com/download/pr/95e6a096-b2bd-4eb8-8cb4-69ca86f8183e/3a9932b042bd575f831cff60be32ae04/dotnet-runtime-3.1.29-linux-arm.tar.gz"
    ;;
  "x86_64")
    PKG_SHA256="c9d1a4e88cc5801c93aaa2448521d5eed5045ee46a0ce1f4a33b6efaed796c11"
    PKG_URL="https://download.visualstudio.microsoft.com/download/pr/8a8cff44-0a23-413a-8643-2a0fa3b4da3c/c937fe6ed4d60efb1ef2929d983398cd/dotnet-runtime-3.1.29-linux-x64.tar.gz"
    ;;
esac

PKG_SOURCE_NAME="aspnetcore3-runtime_${PKG_VERSION}_${ARCH}.tar.gz"
