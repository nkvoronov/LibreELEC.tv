# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="dotnet5-runtime"
PKG_VERSION="5.0.5"
PKG_REV="113"
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
    PKG_URL="https://download.visualstudio.microsoft.com/download/pr/3acd1792-c80d-4336-8ffc-552776a1297c/08af3aa6f51d6e8670bb422b6bec5541/aspnetcore-runtime-5.0.5-linux-arm64.tar.gz"
    ;;
  "arm")
    #PKG_SHA256="29c6aa914739dce59e04d1fc7dceb33e97dfec6624ec3c297a8375f66aece092"
    PKG_URL="https://download.visualstudio.microsoft.com/download/pr/254a9fbb-e834-470c-af08-294c274a349f/ee755caf0b8a801cf30dcdc0c9e4273d/aspnetcore-runtime-5.0.5-linux-arm.tar.gz"
    ;;
  "x86_64")
    PKG_SHA256="a6db0176d2a8453bdfcb7da6e6d57300a7000eceffbaec74965ef98aacd8b316"
    PKG_URL="https://download.visualstudio.microsoft.com/download/pr/827b12a8-8dea-43da-92a2-2d24c4936236/d2d61b3ed4b5ba3f682de3e04fc4d243/aspnetcore-runtime-5.0.5-linux-x64.tar.gz"
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
