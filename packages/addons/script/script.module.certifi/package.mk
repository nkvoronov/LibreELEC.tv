# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="script.module.certifi"
PKG_VERSION="2019.6.16"
#PKG_SHA256="7214ca86205c896f1468dceb9101a3b75c9023acca34fb9c22f4610993ee5cd0"
PKG_LICENSE="GPL"
PKG_SITE="https://kodi.tv/"
PKG_URL="http://mirrors.kodi.tv/addons/leia/$PKG_NAME/$PKG_NAME-$PKG_VERSION.zip"
PKG_SOURCE_DIR="$PKG_NAME"
PKG_DEPENDS_TARGET="toolchain Python2 kodi"
PKG_LONGDESC="Python SSL Certificates"
PKG_TOOLCHAIN="manual"

post_install() {
  mkdir -p $INSTALL/usr/share/kodi/addons/$PKG_NAME
    cp -PR $PKG_BUILD/* $INSTALL/usr/share/kodi/addons/$PKG_NAME

  python -Wi -t -B $TOOLCHAIN/lib/python2.7/compileall.py $INSTALL/usr/share/kodi/addons/$PKG_NAME/lib/ -f
  rm -rf `find $INSTALL/usr/share/kodi/addons/$PKG_NAME/lib/ -name "*.py"`
}
