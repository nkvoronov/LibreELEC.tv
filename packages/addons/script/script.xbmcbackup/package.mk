# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="script.xbmcbackup"
PKG_VERSION="e0368f0cf3a862f08bd9deed582842f1795b010f"
PKG_LICENSE="GPL"
PKG_SITE="https://kodi.tv/"
PKG_URL="https://github.com/nkvoronov/script.xbmcbackup.git"
PKG_GIT_CLONE_BRANCH="vleia"
PKG_DEPENDS_TARGET="toolchain Python2 kodi script.module.httplib2 script.module.oauth2client script.module.uritemplate script.module.yaml script.module.googleapi"
PKG_SOURCE_DIR="$PKG_NAME"
PKG_LONGDESC="Backup and restore your XBMC database and configuration files in the event of a crash or file."
PKG_TOOLCHAIN="manual"

post_install() {
  mkdir -p $INSTALL/usr/share/kodi/addons/$PKG_NAME
    cp -PR $PKG_BUILD/* $INSTALL/usr/share/kodi/addons/$PKG_NAME

  rm $INSTALL/usr/share/kodi/addons/$PKG_NAME/README.md
  rm $INSTALL/usr/share/kodi/addons/$PKG_NAME/LICENSE.txt

  python -Wi -t -B $TOOLCHAIN/lib/python2.7/compileall.py $INSTALL/usr/share/kodi/addons/$PKG_NAME/resources/lib/ -f
  rm -rf `find $INSTALL/usr/share/kodi/addons/$PKG_NAME/resources/lib/ -name "*.py"`
}
