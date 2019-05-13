# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="chromaprint"
PKG_VERSION="1.4.3"
PKG_SHA256="ea18608b76fb88e0203b7d3e1833fb125ce9bb61efe22c6e169a50c52c457f82"
PKG_LICENSE="GPL"
PKG_SITE="https://acoustid.org/chromaprint"
PKG_URL="https://github.com/acoustid/chromaprint/releases/download/v$PKG_VERSION/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="Chromaprint is a library for calculating audio fingerprints which are used by the Acoustid service. Its main purpose is to provide an accurate identifier for record tracks"
PKG_TOOLCHAIN="cmake"

CMAKE_OPTS_TARGET="-DCMAKE_TOOLCHAIN_FILE=$CMAKE_CONF \
                   -DCMAKE_INSTALL_PREFIX=/usr \
                   -DCMAKE_BUILD_TYPE=Release \
                   -DBUILD_EXAMPLES=ON"

post_makeinstall_target() {
  rm -rf $INSTALL/usr/bin
}
