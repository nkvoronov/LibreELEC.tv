################################################################################
#      This file is part of LibreELEC - http://www.libreelec.tv
#      Copyright (C) 2016 Team LibreELEC
#
#  LibreELEC is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 2 of the License, or
#  (at your option) any later version.
#
#  LibreELEC is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with LibreELEC.  If not, see <http://www.gnu.org/licenses/>.
################################################################################

PKG_NAME="acestream31"
PKG_VERSION="3.1.16"
PKG_REV="6"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://wiki.acestream.org/wiki/index.php/AceStream_3.0"
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain acestream-engine"
PKG_SECTION="tools"
PKG_SHORTDESC="acestream (Version: $PKG_VERSION): This is an innovative media platform of a new generation, which will take you to a new high-quality level of multimedia space on the Internet."
PKG_LONGDESC="acestream (Version: $PKG_VERSION): This is an innovative media platform of a new generation, which will take you to a new high-quality level of multimedia space on the Internet."
PKG_AUTORECONF="no"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="ACE stream engine 3.1.x"
PKG_ADDON_TYPE="xbmc.python.script"

make_target() {
  : # nothing to make here
}

makeinstall_target() {
  : # nothing to install here
}

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
