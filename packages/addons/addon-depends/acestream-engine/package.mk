# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="acestream-engine"
PKG_VERSION="b78eb20349630883e2c57ac21c508688fb8b4b4b"
PKG_REV="1"
PKG_LICENSE="GPL"
PKG_SITE="http://wiki.acestream.org/wiki/index.php/AceStream_3.0"
PKG_URL="https://github.com/nkvoronov/tools-ace.git"
PKG_GIT_CLONE_BRANCH="v3.1.35"
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
