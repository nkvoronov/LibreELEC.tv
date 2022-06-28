# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="dotnet3-runtime"
PKG_VERSION="3.1.26"
PKG_LICENSE="MIT"
PKG_SITE="https://dotnet.microsoft.com/"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="ASP.NET Core Runtime runs applications built with .NET Core, a cross-platform .NET implementation."
PKG_TOOLCHAIN="manual"

case "${ARCH}" in
  "aarch64")
    #PKG_SHA256="b76c049484efd86466d2e1cd88994521633c399d090adb1c6804128603816abe"
    PKG_URL="https://download.visualstudio.microsoft.com/download/pr/cb0e8b4b-7b2b-40cc-b7a6-30f0d4fabe6c/f5cb06cbb1b1b5d198792333b3db235a/dotnet-runtime-3.1.26-linux-arm64.tar.gz"
    ;;
  "arm")
    #PKG_SHA256="a0163cd5c5ceae228bfffb40053f3509e155a110c23e81c38705757a870e24cc"
    PKG_URL="https://download.visualstudio.microsoft.com/download/pr/e6e33223-7d66-4527-a136-4cf975353bfa/1b50d103dd24165c4bb87011c4bb41d6/dotnet-runtime-3.1.26-linux-arm.tar.gz"
    ;;
  "x86_64")
    PKG_SHA256="ef6a030adfc4708e2840c85a69038c29a1e98a0bc009a1828034c15e6c30c0e6"
    PKG_URL="https://download.visualstudio.microsoft.com/download/pr/a14c8e4d-a22b-47f8-953c-bb4337634513/58017d103d432f7106c44b0891936aba/dotnet-runtime-3.1.26-linux-x64.tar.gz"
    ;;
esac

PKG_SOURCE_NAME="aspnetcore3-runtime_${PKG_VERSION}_${ARCH}.tar.gz"
