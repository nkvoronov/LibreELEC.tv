# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2023-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="transmission"
PKG_VERSION="4.0.2"
PKG_SHA256="39bf7a104a722805a9dc089cdaaffe33bf90b82230a7ea7f340cae59f00a2ee8"
PKG_LICENSE="OSS"
PKG_SITE="http://www.transmissionbt.com/"
PKG_URL="https://github.com/transmission/transmission/releases/download/${PKG_VERSION}/${PKG_NAME}-${PKG_VERSION}.tar.xz"
PKG_DEPENDS_TARGET="toolchain zlib openssl curl libevent"
PKG_LONGDESC="transmission is a fast, easy and free BitTorrent client"

PKG_CMAKE_OPTS_TARGET="\
      -DCMAKE_BUILD_TYPE=RelWithDebInfo \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DENABLE_CLI=OFF \
      -DENABLE_DAEMON=ON \
      -DENABLE_GTK=OFF \
      -DENABLE_MAC=OFF \
      -DENABLE_QT=OFF \
      -DENABLE_TESTS=OFF \
      -DENABLE_UTILS=ON \
      -DENABLE_UTP=ON \
      -DINSTALL_LIB=ON \
      -DWITH_CRYPTO=openssl"

post_install() {
  mkdir -p ${INSTALL}/usr/bin
    cp ${PKG_BUILD}/.${TARGET_NAME}/daemon/transmission-daemon ${INSTALL}/usr/bin
    cp ${PKG_BUILD}/.${TARGET_NAME}/utils/transmission-remote ${INSTALL}/usr/bin
    cp ${PKG_BUILD}/.${TARGET_NAME}/utils/transmission-create ${INSTALL}/usr/bin
    cp ${PKG_BUILD}/.${TARGET_NAME}/utils/transmission-edit ${INSTALL}/usr/bin
    cp ${PKG_BUILD}/.${TARGET_NAME}/utils/transmission-show ${INSTALL}/usr/bin
    cp -P ${PKG_DIR}/scripts/* ${INSTALL}/usr/bin

  mkdir -p ${INSTALL}/usr/share/transmission/web
    cp -pR ${PKG_BUILD}/web/* ${INSTALL}/usr/share/transmission/web
    rm -rf ${INSTALL}/usr/share/transmission/web/CMakeLists.txt

  enable_service transmission.service
}
