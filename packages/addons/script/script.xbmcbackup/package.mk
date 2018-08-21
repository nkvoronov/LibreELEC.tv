# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="script.xbmcbackup"
PKG_VERSION="1.1.2"
PKG_SHA256="8cc8d0367161e1e0be938a1849da17422b97e9afa09b8e98cb2ff5055d3ce41d"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://kodi.tv/"
PKG_URL="http://mirrors.kodi.tv/addons/leia/$PKG_NAME/$PKG_NAME-$PKG_VERSION.zip"
PKG_DEPENDS_TARGET="toolchain Python kodi script.module.httplib2 script.module.oauth2client script.module.uritemplate script.module.yaml script.module.googleapi"
PKG_SOURCE_DIR="$PKG_NAME"
PKG_SECTION="script"
PKG_SHORTDESC="Backup and restore your XBMC database and configuration files in the event of a crash or file."
PKG_LONGDESC="Backup and restore your XBMC database and configuration files in the event of a crash or file."

post_install() {
  mkdir -p $INSTALL/usr/share/kodi/addons/$PKG_NAME
    cp -PR $PKG_BUILD/* $INSTALL/usr/share/kodi/addons/$PKG_NAME

  rm $INSTALL/usr/share/kodi/addons/$PKG_NAME/README.md
  rm $INSTALL/usr/share/kodi/addons/$PKG_NAME/LICENSE.txt

  python -Wi -t -B $TOOLCHAIN/lib/python2.7/compileall.py $INSTALL/usr/share/kodi/addons/$PKG_NAME/resources/lib/ -f
  rm -rf `find $INSTALL/usr/share/kodi/addons/$PKG_NAME/resources/lib/ -name "*.py"`
}
