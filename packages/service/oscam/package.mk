# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2019-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="oscam"
PKG_VERSION="11693"
PKG_LICENSE="GPL"
PKG_SITE="http://www.streamboard.tv/oscam/wiki"
PKG_URL="http://www.streamboard.tv/svn/oscam/trunk"
PKG_DEPENDS_TARGET="toolchain openssl pcsc-lite"
PKG_LONGDESC="OSCam: is a software to be used to decrypt digital television channels, as an alternative for a conditional access module."

PKG_CMAKE_OPTS_TARGET="\
  `#Building` \
  -DLIBUSBDIR=${SYSROOT_PREFIX}/usr \
  -DOPTIONAL_INCLUDE_DIR=${SYSROOT_PREFIX}/usr/include \
  \
  `#Readers` \
  -DCARDREADER_DB2COM=OFF \
  -DCARDREADER_DRECAS=ON \
  -DCARDREADER_INTERNAL=OFF \
  -DCARDREADER_MP35=ON \
  -DCARDREADER_PHOENIX=ON \
  -DCARDREADER_SC8IN1=ON \
  -DCARDREADER_SMARGO=ON \
  -DCARDREADER_STAPI5=OFF \
  -DCARDREADER_STAPI=OFF \
  -DCARDREADER_STINGER=ON \
  \
  `#Protocol` \
  -DMODULE_CAMD33=OFF \
  -DMODULE_CAMD35=ON \
  -DMODULE_CAMD35_TCP=ON \
  -DMODULE_CCCAM=ON \
  -DMODULE_CCCSHARE=ON \
  -DMODULE_CONSTCW=ON \
  -DMODULE_GBOX=ON \
  -DMODULE_GHTTP=ON \
  -DMODULE_NEWCAMD=ON \
  -DMODULE_PANDORA=ON \
  -DMODULE_RADEGAST=ON \
  -DMODULE_SCAM=ON \
  -DMODULE_SERIAL=ON \
  \
  `#Features` \
  -DCLOCKFIX=0 \
  -DCS_ANTICASC=ON \
  -DCS_CACHEEX=ON \
  -DCW_CYCLE_CHECK=ON \
  -DHAVE_DVBAPI=1 \
  -DHAVE_LIBCRYPTO=1 \
  -DSTATIC_LIBUSB=1 \
  -DTOUCH=ON \
  -DWEBIF=1 \
  -DWEBIF_LIVELOG=1 \
  -DWEBIF_JQUERY=1 \
  -DWITH_DEBUG=0 \
  -DWITH_SSL=1 \
  -DWITH_STAPI=0"

pre_configure_target() {
  export OSCAM_VERSION="${PKG_VERSION}"
}

post_install() {
  mkdir -p ${INSTALL}/usr/bin
    cp -P ${PKG_BUILD}/.${TARGET_NAME}/oscam ${INSTALL}/usr/bin
    cp -P ${PKG_BUILD}/.${TARGET_NAME}/utils/list_smargo ${INSTALL}/usr/bin
    cp -P ${PKG_DIR}/scripts/* ${INSTALL}/usr/bin

  mkdir -p ${INSTALL}/usr/config/oscam
    cp -p ${PKG_DIR}/config/* ${INSTALL}/usr/config/oscam

  enable_service oscam.service
}
