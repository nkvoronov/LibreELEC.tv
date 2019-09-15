# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="acestream-engine"
PKG_VERSION="b78eb20349630883e2c57ac21c508688fb8b4b4b"
PKG_VERSION_NUM="3.1.35"
PKG_REV="13"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://wiki.acestream.org/wiki/index.php/AceStream_3.0"
PKG_URL="https://github.com/nkvoronov/tools-ace.git"
PKG_GIT_CLONE_BRANCH="v$PKG_VERSION_NUM"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="service"
PKG_SHORTDESC="acestream (Version: $PKG_VERSION_NUM): This is an innovative media platform of a new generation, which will take you to a new high-quality level of multimedia space on the Internet."
PKG_LONGDESC="acestream (Version: $PKG_VERSION_NUM): This is an innovative media platform of a new generation, which will take you to a new high-quality level of multimedia space on the Internet."
PKG_TOOLCHAIN="manual"
PKG_BUILD_FLAGS="-strip"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="ACE stream engine"
PKG_ADDON_TYPE="xbmc.service"

addon() {
  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/share/acestream/data
    cp -PR $PKG_BUILD/acestream/data/* $ADDON_BUILD/$PKG_ADDON_ID/share/acestream/data

  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/share/acestream/lib
    cp -PR $PKG_BUILD/acestream/lib/* $ADDON_BUILD/$PKG_ADDON_ID/share/acestream/lib
    rm $ADDON_BUILD/$PKG_ADDON_ID/share/acestream/lib/lxml-3.7.2-py2.7-linux-x86_64.egg
    rm $ADDON_BUILD/$PKG_ADDON_ID/share/acestream/lib/m2crypto.egg

    cp -PR $PKG_BUILD/libs/openssl/*.so.* $ADDON_BUILD/$PKG_ADDON_ID/share/acestream/lib
    cp -PR $PKG_BUILD/libs/setuptools/* $ADDON_BUILD/$PKG_ADDON_ID/share/acestream/lib

  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/share/acestream/lib/M2Crypto
    cp -PR $PKG_BUILD/libs/M2Crypto/* $ADDON_BUILD/$PKG_ADDON_ID/share/acestream/lib/M2Crypto

    cp -PR $PKG_BUILD/libs/apsw/* $ADDON_BUILD/$PKG_ADDON_ID/share/acestream/lib
    cp -PR $PKG_BUILD/libs/sqlite/* $ADDON_BUILD/$PKG_ADDON_ID/share/acestream/lib

  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/share/acestream/lib/lxml
    cp -PR $PKG_BUILD/libs/lxml/* $ADDON_BUILD/$PKG_ADDON_ID/share/acestream/lib/lxml

    cp -PR $PKG_BUILD/libs/libxslt/* $ADDON_BUILD/$PKG_ADDON_ID/share/acestream/lib

    cp -P $PKG_BUILD/acestream/acestream.conf $ADDON_BUILD/$PKG_ADDON_ID/share/acestream
    cp -P $PKG_BUILD/acestream/acestreamengine $ADDON_BUILD/$PKG_ADDON_ID/share/acestream

    rm -rf `find $ADDON_BUILD/$PKG_ADDON_ID/share/acestream/lib/ -name "*.pyc"`
    rm -rf `find $ADDON_BUILD/$PKG_ADDON_ID/share/acestream/lib/ -name "*.pyo"`
}
