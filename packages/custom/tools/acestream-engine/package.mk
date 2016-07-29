################################################################################
#      This file is part of OpenELEC - http://www.openelec.tv
#      Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
#
#  This Program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2, or (at your option)
#  any later version.
#
#  This Program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with OpenELEC.tv; see the file COPYING.  If not, write to
#  the Free Software Foundation, 51 Franklin Street, Suite 500, Boston, MA 02110, USA.
#  http://www.gnu.org/copyleft/gpl.html
################################################################################

PKG_NAME="acestream-engine"
PKG_VERSION="3.0.3"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://wiki.acestream.org/wiki/index.php/AceStream_3.0"
PKG_URL="$DISTRO_CUSTOM_SRC/$PKG_NAME/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="toolchain"
PKG_PRIORITY="optional"
PKG_SECTION="custom/tools"
PKG_SHORTDESC="This is an innovative media platform of a new generation, which will take you to a new high-quality level of multimedia space on the Internet."
PKG_LONGDESC="This is an innovative media platform of a new generation, which will take you to a new high-quality level of multimedia space on the Internet."

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

PYTHON_MODULES="no"

if [ "$PYTHON_MODULES" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET M2Crypto apsw PyAMF"
fi

make_target() {
  : # nothing to make here
}

makeinstall_target() {
  : # nothing to install here
}

post_install() {
  mkdir -p $INSTALL/usr/share/acestream
  if [ "$PROJECT" = "Generic" ]; then
    cp -PR $PKG_BUILD/$TARGET_ARCH/acestream/* $INSTALL/usr/share/acestream    
  elif [ "$PROJECT" = "RPi" ]; then
    cp -PR $PKG_BUILD/arm/RPi/acestream/* $INSTALL/usr/share/acestream 
  elif [ "$PROJECT" = "imx6" ]; then
    cp -PR $PKG_BUILD/arm/v7/acestream/* $INSTALL/usr/share/acestream 
  fi

  if [ "$PROJECT" = "Generic" ]; then
    mkdir -p $INSTALL/usr/bin
      cp -P $PKG_BUILD/acestreamengine-client-console $INSTALL/usr/bin
  fi
}
