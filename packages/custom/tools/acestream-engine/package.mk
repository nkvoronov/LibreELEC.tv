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

PKG_NAME="acestream-engine"
PKG_VERSION="9317769"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://wiki.acestream.org/wiki/index.php/AceStream_3.0"
PKG_URL="https://github.com/nkvoronov/tools-ace.git"
PKG_BRANCH="v3.1.16"
PKG_TYPE="git"
PKG_DEPENDS_TARGET="toolchain setuptools"
PKG_SECTION="tools"
PKG_SHORTDESC="This is an innovative media platform of a new generation, which will take you to a new high-quality level of multimedia space on the Internet."
PKG_LONGDESC="This is an innovative media platform of a new generation, which will take you to a new high-quality level of multimedia space on the Internet."

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

make_target() {
  : # nothing to make here
}

makeinstall_target() {
  : # nothing to install here
}

post_install() {
  mkdir -p $INSTALL/usr/share/acestream
    cp -PR $PKG_BUILD/acestream/* $INSTALL/usr/share/acestream
    cp -PR $PKG_BUILD/openssl/* $INSTALL/usr/share/acestream/lib
    cp -PR $PKG_BUILD/old/* $INSTALL/usr/share/acestream/lib
    cp -PR $PKG_BUILD/lxml/* $INSTALL/usr/share/acestream/lib
    rm $INSTALL/acestream/lib/lxml-3.7.2-py2.7-linux-x86_64.egg

  mkdir -p $INSTALL/usr/bin
    cp -P $PKG_BUILD/acestreamengine-client-console $INSTALL/usr/bin
}
