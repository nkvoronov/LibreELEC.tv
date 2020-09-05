# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

case "$ARCH" in
  "aarch64")
    PKG_NC_ARCH="arm64"
    #PKG_SHA256="d5e97a7c3e495ffe03f62415802a5a6f8fc57e9ee86f7730e6752b016747514507fbf79c0e65a815b9d09fb35af05026ca8ea99626535b31703a217559909309"
    PKG_URL="https://download.visualstudio.microsoft.com/download/pr/e0982947-c956-4c44-b94a-3ecc13d7aa64/28f9a7f461d5aac85121492ba4513517/dotnet-runtime-3.1.7-linux-arm64.tar.gz"
    ;;
  "arm")
    PKG_NC_ARCH="arm"
    #PKG_SHA256="a586ed88cebbef298cda04c94e1809017800abea50668e18bcf27c3aa1ca114bb16963bcdcc4fd535288838120cba52966d594ef395bb8fac11693f64c97ccc1"
    PKG_URL="https://download.visualstudio.microsoft.com/download/pr/69984653-402e-442c-9588-eb92560d0fce/5ad7995a09334dd2ee56f00fb6dc0521/dotnet-runtime-3.1.7-linux-arm.tar.gz"
    ;;
  "x86_64")
    PKG_NC_ARCH="x64"
    #PKG_SHA256="4f0ce619c1b1dbc8ccd799877b5d73158a07b1ebd1222d44b909bba13bdf735c"
    PKG_URL="https://download.visualstudio.microsoft.com/download/pr/e7d0601d-41b4-483f-b411-f2b42708054a/191b56b81e1830b413d0794728831eea/aspnetcore-runtime-3.1.7-linux-x64.tar.gz"
    ;;
esac

PKG_NAME="aspnet-runtime3"
PKG_VERSION="3.1.7"
PKG_REV="112"
PKG_ARCH="any"
PKG_LICENSE="MIT"
PKG_SITE="https://dotnet.github.io/"
PKG_DEPENDS_TARGET="toolchain curl curl3 krb5 lttng-ust"
PKG_SECTION="tools"
PKG_SHORTDESC="ASP.NET Core Runtime"
PKG_LONGDESC="The ASP.NET Core Runtime ($PKG_VERSION) enables you to run existing web/server applications. On Windows, we recommended installing the Hosting Bundle, which includes the .NET Core Runtime and IIS support."
PKG_TOOLCHAIN="manual"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME=".AspNet Core Runtime"
PKG_ADDON_TYPE="xbmc.python.script"
PKG_MAINTAINER="Anton Voyl (awiouy)"

addon() {
  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/bin
  cp -r $PKG_BUILD/* \
        $ADDON_BUILD/$PKG_ADDON_ID/bin

  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/libs
  cp -L $(get_build_dir curl3)/.install_pkg/usr/lib/libcurl.so.? \
        $(get_build_dir krb5)/.install_pkg/usr/lib/libcom_err.so.? \
        $(get_build_dir krb5)/.install_pkg/usr/lib/libgssapi_krb5.so.? \
        $(get_build_dir krb5)/.install_pkg/usr/lib/libk5crypto.so.? \
        $(get_build_dir krb5)/.install_pkg/usr/lib/libkrb5.so.? \
        $(get_build_dir krb5)/.install_pkg/usr/lib/libkrb5support.so.? \
        $(get_build_dir lttng-ust)/.install_pkg/usr/lib/liblttng-ust.so.? \
        $(get_build_dir lttng-ust)/.install_pkg/usr/lib/liblttng-ust-tracepoint.so.? \
        $ADDON_BUILD/$PKG_ADDON_ID/libs
}
