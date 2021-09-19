# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="dotnet5-runtime"
PKG_VERSION="5.0.8"
PKG_REV="116"
PKG_ARCH="any"
PKG_LICENSE="MIT"
PKG_SITE="https://dotnet.github.io/"
PKG_DEPENDS_TARGET="toolchain icu"
PKG_SECTION="tools"
PKG_SHORTDESC=".NET Core Runtime 5"
PKG_LONGDESC=".NET Core Runtime (${PKG_VERSION}) runs applications built with .NET Core, a cross-platform .NET implementation."
PKG_TOOLCHAIN="manual"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME=".Net Core Runtime 5"
PKG_ADDON_PROJECTS="any !RPi1"
PKG_ADDON_TYPE="xbmc.python.script"
PKG_MAINTAINER="Anton Voyl (awiouy)"

case "${ARCH}" in
  "aarch64")
    #PKG_SHA256="ef11a880d59b19f1df355b3c9c8b35ea1aa37e72d179850051cad963cb72358f"
    PKG_URL="https://download.visualstudio.microsoft.com/download/pr/36c6210a-5b28-4598-81f7-2cef1a0bd1d5/296782726e68368c8ddf87ba828b5fc7/aspnetcore-runtime-5.0.8-linux-arm64.tar.gz"
    ;;
  "arm")
    #PKG_SHA256="29c6aa914739dce59e04d1fc7dceb33e97dfec6624ec3c297a8375f66aece092"
    PKG_URL="https://download.visualstudio.microsoft.com/download/pr/7e928c60-5f60-4c62-8439-422be547605c/0d1dc316cf38efdb2557f639ca9da4ad/aspnetcore-runtime-5.0.8-linux-arm.tar.gz"
    ;;
  "x86_64")
    PKG_SHA256="fce507e5e8b30464c8a4890d99d48a6b5f9ae04d0f9b2b7eb9b14b9ed783e55c"
    PKG_URL="https://download.visualstudio.microsoft.com/download/pr/1b54c42a-4904-419b-8c24-bb2f39d4c8ae/279cd30211d8e5a9abf3129d04b4eb0e/aspnetcore-runtime-5.0.8-linux-x64.tar.gz"
    ;;
esac
PKG_SOURCE_NAME="aspnetcore-runtime_${PKG_VERSION}_${ARCH}.tar.gz"

addon() {
  mkdir -p ${ADDON_BUILD}/${PKG_ADDON_ID}/bin
    cp -r ${PKG_BUILD}/* \
          ${ADDON_BUILD}/${PKG_ADDON_ID}/bin

  mkdir -p ${ADDON_BUILD}/${PKG_ADDON_ID}/lib
    cp -L $(get_install_dir icu)/usr/lib/lib*.so.?? \
          ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/
}
