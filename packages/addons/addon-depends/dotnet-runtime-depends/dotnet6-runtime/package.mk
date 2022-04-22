# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2021-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="dotnet6-runtime"
PKG_VERSION="6.0.4"
PKG_LICENSE="MIT"
PKG_SITE="https://dotnet.microsoft.com/"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC=".NET Runtime runs applications built with .NET Core, a cross-platform .NET implementation."
PKG_TOOLCHAIN="manual"

case "${ARCH}" in
  "aarch64")
    #PKG_SHA256="375956c3d326f5030a1eff2cafdba8b994ed0e1b87db2dd812ce17e0bca5fb27"
    PKG_URL="https://download.visualstudio.microsoft.com/download/pr/3641affa-8bb0-486f-93d9-68adff4f4af7/1e3df9fb86cba7299b9e575233975734/dotnet-runtime-6.0.4-linux-arm64.tar.gz"
    ;;
  "arm")
    #PKG_SHA256="fcc811f37cb6914bf3aa1c96040b1a46fad42939e6b1e1e7e0f513a9be1de680"
    PKG_URL="https://download.visualstudio.microsoft.com/download/pr/f8e1ab66-58f7-4ebb-a9bb-9decfa03501f/88e1fb49af6f75dc54c23383162409c5/dotnet-runtime-6.0.4-linux-arm.tar.gz"
    ;;
  "x86_64")
    PKG_SHA256="02e2c5b5950e3fc1fe4dd146175758f198c711e495883f7f286d575437fd82c4"
    PKG_URL="https://download.visualstudio.microsoft.com/download/pr/5b08d331-15ac-4a53-82a5-522fa45b1b99/65ae300dd160ae0b88b91dd78834ce3e/dotnet-runtime-6.0.4-linux-x64.tar.gz"

    ;;
esac
PKG_SOURCE_NAME="dotnet6-runtime_${PKG_VERSION}_${ARCH}.tar.gz"
