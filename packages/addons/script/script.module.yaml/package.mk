# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="script.module.yaml"
PKG_VERSION="3.11.0"
PKG_SHA256="92d3188ff0e9ddc0f141c54b96fccbdf237ed8e9de2fe7f5e72042a881cf91da"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://kodi.tv/"
PKG_URL="http://mirrors.kodi.tv/addons/leia/$PKG_NAME/$PKG_NAME-$PKG_VERSION.zip"
PKG_SOURCE_DIR="$PKG_NAME"
PKG_DEPENDS_TARGET="toolchain Python kodi"
PKG_SECTION="script"
PKG_SHORTDESC="PyYaml library"
PKG_LONGDESC="PyYaml library"

post_install() {
  mkdir -p $INSTALL/usr/share/kodi/addons/$PKG_NAME
    cp -PR $PKG_BUILD/* $INSTALL/usr/share/kodi/addons/$PKG_NAME

  rm $INSTALL/usr/share/kodi/addons/$PKG_NAME/README.md
  rm $INSTALL/usr/share/kodi/addons/$PKG_NAME/LICENSE

  python -Wi -t -B $TOOLCHAIN/lib/python2.7/compileall.py $INSTALL/usr/share/kodi/addons/$PKG_NAME/lib/ -f
  rm -rf `find $INSTALL/usr/share/kodi/addons/$PKG_NAME/lib/ -name "*.py"`
}
