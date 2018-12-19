# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="oscam"
PKG_VERSION="11442"
#PKG_SHA256="15a84d3239b2bae2641107b4b92a0baa23d8f7cd4e0ba99bc9c94c1b81c7d827"
PKG_LICENSE="GPL"
PKG_SITE="http://www.streamboard.tv/oscam/wiki"
PKG_URL="https://www.dropbox.com/s/93i3orl012nnv54/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain openssl pcsc-lite"
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
                       -DCLOCKFIX=0 \
                       -DCARDREADER_DB2COM=OFF"

pre_configure_target() {
  export OSCAM_VERSION="$PKG_VERSION"
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
