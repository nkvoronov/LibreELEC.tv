# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="script.module.oauth2client"
PKG_VERSION="4.1.2"
PKG_SHA256="71490172370b03e497edb41fa2ff719f34a701170cc42d11cc306d3b8356a11a"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://kodi.tv/"
PKG_URL="http://mirrors.kodi.tv/addons/leia/$PKG_NAME/$PKG_NAME-$PKG_VERSION.zip"
PKG_SOURCE_DIR="$PKG_NAME"
PKG_DEPENDS_TARGET="toolchain Python2 kodi"
PKG_SECTION="script"
PKG_SHORTDESC="Google Oauth2Client libraries"
PKG_LONGDESC="Google Oauth2Client libraries"
PKG_TOOLCHAIN="manual"

post_install() {
  mkdir -p $INSTALL/usr/share/kodi/addons/$PKG_NAME
    cp -PR $PKG_BUILD/* $INSTALL/usr/share/kodi/addons/$PKG_NAME

  rm $INSTALL/usr/share/kodi/addons/$PKG_NAME/README.md
  rm $INSTALL/usr/share/kodi/addons/$PKG_NAME/LICENSE.txt

  python -Wi -t -B $TOOLCHAIN/lib/python2.7/compileall.py $INSTALL/usr/share/kodi/addons/$PKG_NAME/lib/ -f
  rm -rf `find $INSTALL/usr/share/kodi/addons/$PKG_NAME/lib/ -name "*.py"`
}
