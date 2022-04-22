# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2021-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="dotnet5-runtime"
PKG_VERSION="5.0.16"
PKG_LICENSE="MIT"
PKG_SITE="https://dotnet.microsoft.com/"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC=".NET Runtime runs applications built with .NET Core, a cross-platform .NET implementation."
PKG_TOOLCHAIN="manual"

case "${ARCH}" in
  "aarch64")
    #PKG_SHA256="375956c3d326f5030a1eff2cafdba8b994ed0e1b87db2dd812ce17e0bca5fb27"
    PKG_URL="https://download.visualstudio.microsoft.com/download/pr/dd28f2e1-3465-471c-9cef-7454ac84045c/a92b8f92aa2226b82c0e3e017b9d998f/dotnet-runtime-5.0.16-linux-arm64.tar.gz"
    ;;
  "arm")
    #PKG_SHA256="fcc811f37cb6914bf3aa1c96040b1a46fad42939e6b1e1e7e0f513a9be1de680"
    PKG_URL="https://download.visualstudio.microsoft.com/download/pr/2519cc01-d9b5-49b3-8c8a-616dd5b1a26a/d12111c61a2f9dd5de92bcb3e9a796a2/dotnet-runtime-5.0.16-linux-arm.tar.gz"
    ;;
  "x86_64")
    PKG_SHA256="7117b2a92f9435a379e0ce2b794ba5878f30fac6bdb8394ba6df11fd3386207e"
    PKG_URL="https://download.visualstudio.microsoft.com/download/pr/ca089696-3890-4d4f-a0c9-969464d98957/a00e3c8fe65ba7d04f5ba32b53e843e2/dotnet-runtime-5.0.16-linux-x64.tar.gz"

    ;;
esac
PKG_SOURCE_NAME="dotnet5-runtime_${PKG_VERSION}_${ARCH}.tar.gz"
