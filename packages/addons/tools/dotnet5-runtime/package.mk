# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="dotnet5-runtime"
PKG_VERSION="5.0.7"
PKG_REV="115"
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
    PKG_URL="https://download.visualstudio.microsoft.com/download/pr/d0a22fa3-b916-49ce-8284-97131b424cb3/cb884163ad34b83f1ae1dbd33e09d77a/aspnetcore-runtime-5.0.7-linux-arm64.tar.gz"
    ;;
  "arm")
    #PKG_SHA256="29c6aa914739dce59e04d1fc7dceb33e97dfec6624ec3c297a8375f66aece092"
    PKG_URL="https://download.visualstudio.microsoft.com/download/pr/2f690848-1342-4768-a7d7-45fa476a4a22/50dd1c50ed7864140b04fec057bb8bd6/aspnetcore-runtime-5.0.7-linux-arm.tar.gz"
    ;;
  "x86_64")
    PKG_SHA256="22f9f93b4d6a00e76980918b721f7f62654421d7582d486e830ec478c365707c"
    PKG_URL="https://download.visualstudio.microsoft.com/download/pr/d6be94b3-458f-43c4-8bb5-9ba261de8c9c/bbe13b54208d088b5fdf428759b5bc0a/aspnetcore-runtime-5.0.7-linux-x64.tar.gz"
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
