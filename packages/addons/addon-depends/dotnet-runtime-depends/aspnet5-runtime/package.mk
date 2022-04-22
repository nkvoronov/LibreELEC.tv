# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2021-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="aspnet5-runtime"
PKG_VERSION="5.0.16"
PKG_LICENSE="MIT"
PKG_SITE="https://dotnet.microsoft.com/"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="ASP.NET Core Runtime enables you to run existing web/server applications."
PKG_TOOLCHAIN="manual"

case "${ARCH}" in
  "aarch64")
    #PKG_SHA256="ef11a880d59b19f1df355b3c9c8b35ea1aa37e72d179850051cad963cb72358f"
    PKG_URL="https://download.visualstudio.microsoft.com/download/pr/7647ac91-2b3e-468a-b79f-7e42de4e8780/da52863dc49b8b0bdcc19ae98828f0cc/aspnetcore-runtime-5.0.16-linux-arm64.tar.gz"
    ;;
  "arm")
    #PKG_SHA256="29c6aa914739dce59e04d1fc7dceb33e97dfec6624ec3c297a8375f66aece092"
    PKG_URL="https://download.visualstudio.microsoft.com/download/pr/44d38590-0690-4b13-8b4d-7dae444e531d/ff6fe16b344c8f91fd86bdaa2f5ed904/aspnetcore-runtime-5.0.16-linux-arm.tar.gz"
    ;;
  "x86_64")
    PKG_SHA256="ddf8385427c6b9e1ef5de2f58a0a1c0d496d405f9de445ffa7e5fef555c7fd34"
    PKG_URL="https://download.visualstudio.microsoft.com/download/pr/fa584e5c-68f4-49e0-9a3d-79a52045b509/bc9bb7c98cfc975358b931cd5c2bf7a6/aspnetcore-runtime-5.0.16-linux-x64.tar.gz"
    ;;
esac
PKG_SOURCE_NAME="aspnetcore5-runtime_${PKG_VERSION}_${ARCH}.tar.gz"
