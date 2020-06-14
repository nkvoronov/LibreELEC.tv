# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="script.module.six"
PKG_VERSION="1.13.0"
PKG_SHA256="d71727843d6816cb51cf4df0abfb0bf0de7b76b649956b66faab59baed5a7d65"
PKG_LICENSE="GPL"
PKG_SITE="https://kodi.tv/"
PKG_URL="http://mirrors.kodi.tv/addons/leia/$PKG_NAME/$PKG_NAME-$PKG_VERSION.zip"
PKG_SOURCE_DIR="$PKG_NAME"
PKG_DEPENDS_TARGET="toolchain Python2 kodi"
PKG_LONGDESC="Python 2 and 3 compatibility utilities."
PKG_TOOLCHAIN="manual"

post_install() {
  mkdir -p $INSTALL/usr/share/kodi/addons/$PKG_NAME
    cp -PR $PKG_BUILD/* $INSTALL/usr/share/kodi/addons/$PKG_NAME

  rm $INSTALL/usr/share/kodi/addons/$PKG_NAME/README
  rm $INSTALL/usr/share/kodi/addons/$PKG_NAME/LICENSE

  python -Wi -t -B $TOOLCHAIN/lib/python2.7/compileall.py $INSTALL/usr/share/kodi/addons/$PKG_NAME/lib/ -f
  rm -rf `find $INSTALL/usr/share/kodi/addons/$PKG_NAME/lib/ -name "*.py"`
}
