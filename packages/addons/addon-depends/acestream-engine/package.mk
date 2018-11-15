# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="acestream-engine"
PKG_VERSION="3.1.16"
PKG_SHA256="516ea5149af565f80199cff4b63bbd6b7210634ab004d8bd01f6f5937e70a86b"
PKG_REV="1"
PKG_LICENSE="GPL"
PKG_SITE="http://wiki.acestream.org/wiki/index.php/AceStream_3.0"
PKG_URL="https://www.dropbox.com/s/n8bv00qehfgvjah/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="This is an innovative media platform of a new generation, which will take you to a new high-quality level of multimedia space on the Internet."
PKG_TOOLCHAIN="manual"

post_install() {
  mkdir -p $INSTALL/usr/share/acestream
    cp -PR $PKG_BUILD/acestream/* $INSTALL/usr/share/acestream
    rm $INSTALL/usr/share/acestream/lib/lxml-3.7.2-py2.7-linux-x86_64.egg

    cp -PR $PKG_BUILD/libs/openssl/* $INSTALL/usr/share/acestream/lib
    cp -PR $PKG_BUILD/libs/setuptools/*  $INSTALL/usr/share/acestream/lib

  mkdir -p $INSTALL/usr/share/acestream/lib/M2Crypto
    cp -PR $PKG_BUILD/libs/M2Crypto/*  $INSTALL/usr/share/acestream/lib/M2Crypto

    cp -PR $PKG_BUILD/libs/apsw/*  $INSTALL/usr/share/acestream/lib
    cp -PR $PKG_BUILD/libs/sqlite/*  $INSTALL/usr/share/acestream/lib

  mkdir -p $INSTALL/usr/share/acestream/lib/lxml
    cp -PR $PKG_BUILD/libs/lxml/* $INSTALL/usr/share/acestream/lib/lxml

    cp -PR $PKG_BUILD/libs/libxslt/* $INSTALL/usr/share/acestream/lib

  mkdir -p $INSTALL/usr/bin
    cp -P $PKG_BUILD/acestreamengine-client-console $INSTALL/usr/bin
}
