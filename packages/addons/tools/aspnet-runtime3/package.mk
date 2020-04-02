# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

case "$ARCH" in
  "aarch64")
    PKG_NC_ARCH="arm64"
    PKG_SHA256="9dab4863b0203bf7b6b59f3533e55f7dda3624fe209eef3199510e917df9da13"
    PKG_URL="https://download.visualstudio.microsoft.com/download/pr/d5c6e9d7-25b9-47ac-9d67-35ac65211ad3/c8f4ccd0dc02ca8229ba43ecbe84294b/aspnetcore-runtime-3.1.3-linux-arm64.tar.gz"
    ;;
  "arm")
    PKG_NC_ARCH="arm"
    PKG_SHA256="467490cb72058017e557aa8c20c9c5f45d6f3f23d75c530cedb819dea2f7270d"
    PKG_URL="https://download.visualstudio.microsoft.com/download/pr/b68cde83-05c7-4421-ad9a-3e6f2cc53824/876dbfc9b4521d3ca89a226c6438ffc1/aspnetcore-runtime-3.1.3-linux-arm.tar.gz"
    ;;
  "x86_64")
    PKG_NC_ARCH="x64"
    PKG_SHA256="34cc5c7f16b45234603d9f352a1bd3997d5e07d7380c49266860f75dbc29146d"
    PKG_URL="https://download.visualstudio.microsoft.com/download/pr/7faca87b-7526-4dcd-ae23-4559d2c51ce3/7db1f314c733191ea43e1757e3b2583d/aspnetcore-runtime-3.1.3-linux-x64.tar.gz"
    ;;
esac

PKG_NAME="aspnet-runtime3"
PKG_VERSION="3.1.3"
PKG_REV="111"
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
