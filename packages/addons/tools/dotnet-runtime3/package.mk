# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

case "$ARCH" in
  "aarch64")
    PKG_NC_ARCH="arm64"
    PKG_SHA256="9721d849bd4935c82fdb0e4a5324cf5ac5b93bd9cac81ace619186630d96752b"
    PKG_URL="https://download.visualstudio.microsoft.com/download/pr/d3ee4d51-5cbf-4591-baf0-f9af7f9a07e7/59fa68462184d031275c2fa09cdf375d/dotnet-runtime-3.1.2-linux-arm64.tar.gz"
    ;;
  "arm")
    PKG_NC_ARCH="arm"
    PKG_SHA256="cd15ac49bdb11a8eae28c321198d25c93433c6e1f600282330eaa0f59c2cd1d7"
    PKG_URL="https://download.visualstudio.microsoft.com/download/pr/30ed47bb-c25b-431c-9cfd-7b942b07314f/5c92af345a5475ca58b6878dd974e1dc/dotnet-runtime-3.1.2-linux-arm.tar.gz"
    ;;
  "x86_64")
    PKG_NC_ARCH="x64"
    PKG_SHA256="5c6dc963344c26a67d6268e15c96c0155a456f8dc34f20b1076e9e51bac7ea2c"
    PKG_URL="https://download.visualstudio.microsoft.com/download/pr/38269fba-9fdb-4723-a14c-067cc316827d/53e4161da346d70404375fb8804ee91a/dotnet-runtime-3.1.2-linux-x64.tar.gz"
    ;;
esac

PKG_NAME="dotnet-runtime3"
PKG_VERSION="3.1.2"
PKG_REV="108"
PKG_ARCH="any"
PKG_LICENSE="MIT"
PKG_SITE="https://dotnet.github.io/"
PKG_DEPENDS_TARGET="toolchain curl curl3 krb5 lttng-ust"
PKG_SECTION="tools"
PKG_SHORTDESC=".NET Core Runtime"
PKG_LONGDESC=".NET Core Runtime ($PKG_VERSION) runs applications built with .NET Core, a cross-platform .NET implementation."
PKG_TOOLCHAIN="manual"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME=".Net Core Runtime"
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
