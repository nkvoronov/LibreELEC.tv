# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="chromaprint"
PKG_VERSION="1.3.2"
#PKG_SHA256="9ba8b04bdb13f7860a2041768ac83b47b397a36549c71c530b94028a3cfd5b51"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://acoustid.org/chromaprint"
PKG_URL="https://bitbucket.org/acoustid/chromaprint/downloads/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="audio"
PKG_SHORTDESC="Audio fingerprinting library"
PKG_LONGDESC="Chromaprint is a library for calculating audio fingerprints which are used by the Acoustid service. Its main purpose is to provide an accurate identifier for record tracks"

configure_target() {
  cmake -DCMAKE_TOOLCHAIN_FILE=$CMAKE_CONF \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_EXAMPLES=ON \
        ..
}

post_makeinstall_target() {
  rm -rf $INSTALL/usr/bin
}
