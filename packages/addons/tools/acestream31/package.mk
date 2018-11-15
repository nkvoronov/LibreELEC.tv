# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="acestream31"
PKG_VERSION="3.1.16"
PKG_REV="7"
PKG_LICENSE="GPL"
PKG_SITE="http://wiki.acestream.org/wiki/index.php/AceStream_3.0"
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain acestream-engine"
PKG_LONGDESC="acestream (Version: $PKG_VERSION): This is an innovative media platform of a new generation, which will take you to a new high-quality level of multimedia space on the Internet."
PKG_TOOLCHAIN="manual"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="ACE stream engine 3.1.x"
PKG_ADDON_TYPE="xbmc.python.script"

addon() {
  ACESTREAM_DIR=$(get_build_dir acestream-engine)

  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/share/acestream/data
    cp -PR $ACESTREAM_DIR/acestream/data/* $ADDON_BUILD/$PKG_ADDON_ID/share/acestream/data

  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/share/acestream/lib
    cp -PR $ACESTREAM_DIR/acestream/lib/* $ADDON_BUILD/$PKG_ADDON_ID/share/acestream/lib
    rm $ADDON_BUILD/$PKG_ADDON_ID/share/acestream/lib/lxml-3.7.2-py2.7-linux-x86_64.egg

    cp -PR $ACESTREAM_DIR/libs/openssl/* $ADDON_BUILD/$PKG_ADDON_ID/share/acestream/lib
    cp -PR $ACESTREAM_DIR/libs/setuptools/* $ADDON_BUILD/$PKG_ADDON_ID/share/acestream/lib

  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/share/acestream/lib/M2Crypto
    cp -PR $ACESTREAM_DIR/libs/M2Crypto/* $ADDON_BUILD/$PKG_ADDON_ID/share/acestream/lib/M2Crypto

    cp -PR $ACESTREAM_DIR/libs/apsw/* $ADDON_BUILD/$PKG_ADDON_ID/share/acestream/lib
    cp -PR $ACESTREAM_DIR/libs/sqlite/* $ADDON_BUILD/$PKG_ADDON_ID/share/acestream/lib

  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/share/acestream/lib/lxml
    cp -PR $ACESTREAM_DIR/libs/lxml/* $ADDON_BUILD/$PKG_ADDON_ID/share/acestream/lib/lxml

    cp -PR $ACESTREAM_DIR/libs/libxslt/* $ADDON_BUILD/$PKG_ADDON_ID/share/acestream/lib

    cp -P $ACESTREAM_DIR/acestream/acestream.conf $ADDON_BUILD/$PKG_ADDON_ID/share/acestream
    cp -P $ACESTREAM_DIR/acestream/acestreamengine $ADDON_BUILD/$PKG_ADDON_ID/share/acestream
}
