# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="dotnet5-runtime"
PKG_VERSION="5.0.6"
PKG_REV="114"
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
    PKG_URL="https://download.visualstudio.microsoft.com/download/pr/6b735496-0974-4873-ab92-edc2caa05f99/7fecb279d8abbb8f78bff5474cb2a32c/aspnetcore-runtime-5.0.6-linux-arm64.tar.gz"
    ;;
  "arm")
    #PKG_SHA256="29c6aa914739dce59e04d1fc7dceb33e97dfec6624ec3c297a8375f66aece092"
    PKG_URL="https://download.visualstudio.microsoft.com/download/pr/9d2abf34-b484-46ab-8e3b-504b0057827b/7266d743d6441c1f80510a50c17491dc/aspnetcore-runtime-5.0.6-linux-arm.tar.gz"
    ;;
  "x86_64")
    PKG_SHA256="9ab1493fb64ebe485e8d61e2010d3b46c7ee03aa8e2414931795100eb6086171"
    PKG_URL="https://download.visualstudio.microsoft.com/download/pr/4a7f1f6c-6777-42c4-9793-581bba4b632e/e03e6237a8f49f60014d459f0f758923/aspnetcore-runtime-5.0.6-linux-x64.tar.gz"
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
