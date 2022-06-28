# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2021-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="aspnet5-runtime"
PKG_VERSION="5.0.17"
PKG_LICENSE="MIT"
PKG_SITE="https://dotnet.microsoft.com/"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="ASP.NET Core Runtime enables you to run existing web/server applications."
PKG_TOOLCHAIN="manual"

case "${ARCH}" in
  "aarch64")
    #PKG_SHA256="ef11a880d59b19f1df355b3c9c8b35ea1aa37e72d179850051cad963cb72358f"
    PKG_URL="https://download.visualstudio.microsoft.com/download/pr/6eb8aee2-cbea-4c4f-9bb9-ea6229ec229b/d6c438e5071c359ad995134f0a33e731/aspnetcore-runtime-5.0.17-linux-arm64.tar.gz"
    ;;
  "arm")
    #PKG_SHA256="29c6aa914739dce59e04d1fc7dceb33e97dfec6624ec3c297a8375f66aece092"
    PKG_URL="https://download.visualstudio.microsoft.com/download/pr/b0a08e01-2992-45d1-9f93-3b9d538bb007/eb834b9711f525447d3178627983bc14/aspnetcore-runtime-5.0.17-linux-arm.tar.gz"
    ;;
  "x86_64")
    PKG_SHA256="b9979c99d49bcebcbdfc1cf780a8336323dfdc5cd1c656dcb6e7aae66e12006c"
    PKG_URL="https://download.visualstudio.microsoft.com/download/pr/a2b96f83-e22a-4fa6-a10e-709b3effac9a/0d6ade6c0ceebc8ef7dbf2b1a6d86f17/aspnetcore-runtime-5.0.17-linux-x64.tar.gz"
    ;;
esac

PKG_SOURCE_NAME="aspnetcore5-runtime_${PKG_VERSION}_${ARCH}.tar.gz"
