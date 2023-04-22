# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="dotnet3-runtime"
PKG_VERSION="3.1.32"
PKG_LICENSE="MIT"
PKG_SITE="https://dotnet.microsoft.com/"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="ASP.NET Core Runtime runs applications built with .NET Core, a cross-platform .NET implementation."
PKG_TOOLCHAIN="manual"

case "${ARCH}" in
  "aarch64")
    #PKG_SHA256="b76c049484efd86466d2e1cd88994521633c399d090adb1c6804128603816abe"
    PKG_URL="https://download.visualstudio.microsoft.com/download/pr/edfb706e-83fe-4a81-804c-23d80b041b70/4f98b067bd2817976a4362c25fbf70e7/dotnet-runtime-3.1.32-linux-arm64.tar.gz"
    ;;
  "arm")
    #PKG_SHA256="a0163cd5c5ceae228bfffb40053f3509e155a110c23e81c38705757a870e24cc"
    PKG_URL="https://download.visualstudio.microsoft.com/download/pr/0581a17a-bd80-44ad-81c4-263669a29549/5607ac4ee7bc42dd30a5cfc1749300ee/dotnet-runtime-3.1.32-linux-arm.tar.gz"
    ;;
  "x86_64")
    #PKG_SHA256="c9d1a4e88cc5801c93aaa2448521d5eed5045ee46a0ce1f4a33b6efaed796c11"
    PKG_URL="https://download.visualstudio.microsoft.com/download/pr/fea239ad-fd47-4764-aa71-6a147a82f632/20ee58b0bf08ae9f6e76e37ba3765c57/dotnet-runtime-3.1.32-linux-x64.tar.gz"
    ;;
esac

PKG_SOURCE_NAME="aspnetcore3-runtime_${PKG_VERSION}_${ARCH}.tar.gz"
