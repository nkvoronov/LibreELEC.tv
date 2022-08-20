# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2021-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="dotnet6-runtime"
PKG_VERSION="6.0.8"
PKG_LICENSE="MIT"
PKG_SITE="https://dotnet.microsoft.com/"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC=".NET Runtime runs applications built with .NET Core, a cross-platform .NET implementation."
PKG_TOOLCHAIN="manual"

case "${ARCH}" in
  "aarch64")
    #PKG_SHA256="375956c3d326f5030a1eff2cafdba8b994ed0e1b87db2dd812ce17e0bca5fb27"
    PKG_URL="https://download.visualstudio.microsoft.com/download/pr/866ce4df-8aaa-417d-ad81-26131a2b8734/7ba8391188bc194156ee7d82f494ee00/dotnet-runtime-6.0.8-linux-arm64.tar.gz"
    ;;
  "arm")
    #PKG_SHA256="fcc811f37cb6914bf3aa1c96040b1a46fad42939e6b1e1e7e0f513a9be1de680"
    PKG_URL="https://download.visualstudio.microsoft.com/download/pr/3bdc231e-36c3-4bc9-85d0-c1889b17b1af/ec691544aec785d52417173ba7c17359/dotnet-runtime-6.0.8-linux-arm.tar.gz"
    ;;
  "x86_64")
    PKG_SHA256="be20edcb435e3505f661b01a0d363378f9e067fdd05e21b177817f072d43b2dd"
    PKG_URL="https://download.visualstudio.microsoft.com/download/pr/5596ef6f-a174-4fba-aef1-99173e3f3c67/77edd755d605688885ca7114bc4f9ae9/dotnet-runtime-6.0.8-linux-x64.tar.gz"
    ;;
esac

PKG_SOURCE_NAME="dotnet6-runtime_${PKG_VERSION}_${ARCH}.tar.gz"
