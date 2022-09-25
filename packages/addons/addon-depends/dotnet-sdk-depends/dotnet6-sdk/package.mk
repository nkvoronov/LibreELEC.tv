# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2021-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="dotnet6-sdk"
PKG_VERSION="6.0.401"
PKG_LICENSE="MIT"
PKG_SITE="https://dotnet.microsoft.com/"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="Build apps - SDK"
PKG_TOOLCHAIN="manual"

case "${ARCH}" in
  "aarch64")
    #PKG_SHA256="ef11a880d59b19f1df355b3c9c8b35ea1aa37e72d179850051cad963cb72358f"
    PKG_URL="https://download.visualstudio.microsoft.com/download/pr/a567a07f-af9d-451a-834c-a746ac299e6b/1d9d74b54cf580f93cad71a6bf7b32be/dotnet-sdk-6.0.401-linux-arm64.tar.gz"
    ;;
  "arm")
    #PKG_SHA256="29c6aa914739dce59e04d1fc7dceb33e97dfec6624ec3c297a8375f66aece092"
    PKG_URL="https://download.visualstudio.microsoft.com/download/pr/451f282f-dd26-4acd-9395-36cc3a9758e4/f5399d2ebced2ad9640db6283aa9d714/dotnet-sdk-6.0.401-linux-arm.tar.gz"
    ;;
  "x86_64")
    PKG_SHA256="90613d213d6100566a3be1c3e4d940f9dc4fb94d9bfd7e6346c429e61c31d917"
    PKG_URL="https://download.visualstudio.microsoft.com/download/pr/8159607a-e686-4ead-ac99-b4c97290a5fd/ec6070b1b2cc0651ebe57cf1bd411315/dotnet-sdk-6.0.401-linux-x64.tar.gz"
    ;;
esac

PKG_SOURCE_NAME="dotnet6-sdk_${PKG_VERSION}_${ARCH}.tar.gz"

