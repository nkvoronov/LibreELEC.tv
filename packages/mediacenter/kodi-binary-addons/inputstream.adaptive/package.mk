# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="inputstream.adaptive"
PKG_VERSION="2.4.3-Leia"
PKG_SHA256="83c3d1c45ed5f63d95ca8fa93fcf57fb249586987f9fe74ef4857ca660ed2f64"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/peak3d/inputstream.adaptive"
PKG_URL="https://github.com/peak3d/inputstream.adaptive/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain kodi-platform"
PKG_SECTION=""
PKG_SHORTDESC="inputstream.adaptive"
PKG_LONGDESC="inputstream.adaptive"

PKG_IS_ADDON="yes"

if [ "$TARGET_ARCH" = "x86_64" ] || [ "$TARGET_ARCH" = "arm" ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET nss"
fi

addon() {
  install_binary_addon $PKG_ADDON_ID

  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID
  cp -P $PKG_BUILD/.$TARGET_NAME/wvdecrypter/libssd_wv.so $ADDON_BUILD/$PKG_ADDON_ID
}
