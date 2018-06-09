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

PKG_NAME="oscam"
PKG_VERSION="11424"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.streamboard.tv/oscam/wiki"
PKG_URL="http://www.streamboard.tv/svn/oscam/trunk"
PKG_TYPE="svn"
PKG_REMOVE_CVS_FILES="no"
PKG_DEPENDS_TARGET="toolchain pcsc-lite"
PKG_SECTION="service"
PKG_SHORTDESC="OSCam: an Open Source Conditional Access Modul"
PKG_LONGDESC="OSCam: is a software to be used to decrypt digital television channels, as an alternative for a conditional access module."

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

PKG_CMAKE_OPTS_TARGET="-DLIBUSBDIR=$SYSROOT_PREFIX/usr \
                       -DWITH_SSL=0 \
                       -DHAVE_LIBCRYPTO=0 \
                       -DHAVE_DVBAPI=1 -DWITH_STAPI=0 \
                       -DWEBIF=1 \
                       -DWITH_DEBUG=0 \
                       -DOPTIONAL_INCLUDE_DIR=$SYSROOT_PREFIX/usr/include \
                       -DSTATIC_LIBUSB=1 \
                       -DCLOCKFIX=0"

pre_unpack()  {
  export OSCAM_VERSION="$PKG_VERSION"
}

makeinstall_target() {
  : # nothing to do here
}

post_install() {
  mkdir -p $INSTALL/usr/bin
    cp -P $PKG_BUILD/.$TARGET_NAME/oscam $INSTALL/usr/bin
    cp -P $PKG_BUILD/.$TARGET_NAME/utils/list_smargo $INSTALL/usr/bin
    cp -P $PKG_DIR/scripts/* $INSTALL/usr/bin

  mkdir -p $INSTALL/usr/config/oscam
    cp -p $PKG_DIR/config/* $INSTALL/usr/config/oscam

  enable_service oscam.service
}
