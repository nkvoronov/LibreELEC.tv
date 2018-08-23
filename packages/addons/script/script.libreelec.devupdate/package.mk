# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="script.libreelec.devupdate"
PKG_VERSION="a911ba1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://kodi.tv/"
PKG_URL="https://github.com/nkvoronov/$PKG_NAME.git"
PKG_GIT_CLONE_BRANCH="vleia"
PKG_DEPENDS_TARGET="toolchain Python2 kodi script.module.beautifulsoup4 script.module.requests script.module.html2text script.xbmcbackup"
PKG_SECTION="script"
PKG_SHORTDESC="Unofficial LibreELEC updater"
PKG_LONGDESC="Unofficial LibreELEC updater"
PKG_TOOLCHAIN="manual"

post_install() {
  mkdir -p $INSTALL/usr/share/kodi/addons/$PKG_NAME
    cp -PR $PKG_BUILD/* $INSTALL/usr/share/kodi/addons/$PKG_NAME

  rm $INSTALL/usr/share/kodi/addons/$PKG_NAME/README.md
  rm $INSTALL/usr/share/kodi/addons/$PKG_NAME/LICENSE.txt

  python -Wi -t -B $TOOLCHAIN/lib/python2.7/compileall.py $INSTALL/usr/share/kodi/addons/$PKG_NAME/resources/lib/ -f
  rm -rf `find $INSTALL/usr/share/kodi/addons/$PKG_NAME/resources/lib/ -name "*.py"`
}
