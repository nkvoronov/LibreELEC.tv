# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="oscam"
PKG_VERSION="d785952"
PKG_SHA256="3f698e522b8d47667a2c2841f75d5d790613664a8eea460f98b396ed7ca22c90"
#PKG_VERSION="11431"
#PKG_SHA256="d085395a3154dd23f582b8108b3f4603fa500e6813bd0c2ce093ac96e0c55989"
PKG_VERSION_NUMBER="11420"
PKG_REV="105"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.streamboard.tv/oscam/wiki"
PKG_URL="http://repo.or.cz/oscam.git/snapshot/$PKG_VERSION.tar.gz"
#PKG_URL="http://www.streamboard.tv/svn/oscam/trunk"
#PKG_URL="https://www.dropbox.com/s/p2dirm18ad792ob/$PKG_NAME-$PKG_VERSION.zip"
PKG_DEPENDS_TARGET="toolchain openssl pcsc-lite"
PKG_SECTION="service.softcam"
PKG_SHORTDESC="OSCam: an Open Source Conditional Access Modul"
PKG_LONGDESC="OSCam: is a software to be used to decrypt digital television channels, as an alternative for a conditional access module."

PKG_CMAKE_OPTS_TARGET="-DLIBUSBDIR=$SYSROOT_PREFIX/usr \
                       -DWITH_SSL=1 \
                       -DHAVE_LIBCRYPTO=1 \
                       -DHAVE_DVBAPI=1 \
                       -DWITH_STAPI=0 \
                       -DWEBIF=1 \
                       -DWITH_DEBUG=0 \
                       -DOPTIONAL_INCLUDE_DIR=$SYSROOT_PREFIX/usr/include \
                       -DSTATIC_LIBUSB=1 \
                       -DCLOCKFIX=0"

pre_configure_target() {
  export OSCAM_ADDON_VERSION="$PKG_VERSION_NUMBER"
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
