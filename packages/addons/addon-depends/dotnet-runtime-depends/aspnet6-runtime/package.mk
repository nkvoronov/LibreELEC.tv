# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2021-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="aspnet6-runtime"
PKG_VERSION="6.0.16"
PKG_LICENSE="MIT"
PKG_SITE="https://dotnet.microsoft.com/"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="ASP.NET Core Runtime enables you to run existing web/server applications."
PKG_TOOLCHAIN="manual"

case "${ARCH}" in
  "aarch64")
    #PKG_SHA256="ef11a880d59b19f1df355b3c9c8b35ea1aa37e72d179850051cad963cb72358f"
    PKG_URL="https://download.visualstudio.microsoft.com/download/pr/5fe35f73-59e4-462e-b7aa-98b5b8782051/74a27e03d896663a9483eb72bc59b275/aspnetcore-runtime-6.0.16-linux-arm64.tar.gz"
    ;;
  "arm")
    #PKG_SHA256="29c6aa914739dce59e04d1fc7dceb33e97dfec6624ec3c297a8375f66aece092"
    PKG_URL="https://download.visualstudio.microsoft.com/download/pr/4054a868-d2c9-4e04-84ea-d78b6b77c8cb/f69efb40d4cc84fa5f792d0bb821eea8/aspnetcore-runtime-6.0.16-linux-arm.tar.gz"
    ;;
  "x86_64")
    PKG_SHA256="099a6aa6516413b88fb877d10deb1d171c1a772f1cd83cdb46003de72aec07cd"
    PKG_URL="https://download.visualstudio.microsoft.com/download/pr/877a2d48-74ed-484b-85a1-605078f5e718/752ce1e38b76ffb5ebfc2ee1772307bf/aspnetcore-runtime-6.0.16-linux-x64.tar.gz"
    ;;
esac

PKG_SOURCE_NAME="aspnetcore6-runtime_${PKG_VERSION}_${ARCH}.tar.gz"
