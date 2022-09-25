# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2021-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="dotnet6-runtime"
PKG_VERSION="6.0.9"
PKG_LICENSE="MIT"
PKG_SITE="https://dotnet.microsoft.com/"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC=".NET Runtime runs applications built with .NET Core, a cross-platform .NET implementation."
PKG_TOOLCHAIN="manual"

case "${ARCH}" in
  "aarch64")
    #PKG_SHA256="375956c3d326f5030a1eff2cafdba8b994ed0e1b87db2dd812ce17e0bca5fb27"
    PKG_URL="https://download.visualstudio.microsoft.com/download/pr/2dc40bad-57b6-42ae-b9dd-bd457af4e73e/b95f86d6f9cf49e156227bad231d4aa0/dotnet-runtime-6.0.9-linux-arm64.tar.gz"
    ;;
  "arm")
    #PKG_SHA256="fcc811f37cb6914bf3aa1c96040b1a46fad42939e6b1e1e7e0f513a9be1de680"
    PKG_URL="https://download.visualstudio.microsoft.com/download/pr/9fdc5a53-a4be-45a3-8a38-95877cc521a9/60899abe1ad0deb7ebf2def2617fc5c3/dotnet-runtime-6.0.9-linux-arm.tar.gz"
    ;;
  "x86_64")
    #PKG_SHA256="be20edcb435e3505f661b01a0d363378f9e067fdd05e21b177817f072d43b2dd"
    PKG_URL="https://download.visualstudio.microsoft.com/download/pr/05f1a3dd-75f2-49f4-a976-25ce08f77cbb/b6e8e327a84b91513c2744bfccf90140/dotnet-runtime-6.0.9-linux-x64.tar.gz"
    ;;
esac

PKG_SOURCE_NAME="dotnet6-runtime_${PKG_VERSION}_${ARCH}.tar.gz"
