# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2019-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="xkeyboard-config"
PKG_VERSION="2.29"
PKG_SHA256="1d4175278bf06000683656763a8b1d3282c61a314b6db41260c8efe92d621802"
PKG_LICENSE="MIT"
PKG_SITE="http://www.X.org"
PKG_URL="http://www.x.org/releases/individual/data/$PKG_NAME/$PKG_NAME-$PKG_VERSION.tar.bz2"
PKG_DEPENDS_TARGET="toolchain util-macros"
PKG_LONGDESC="X keyboard extension data files."
PKG_TOOLCHAIN="autotools"

configure_package() {
  if [ "${DISPLAYSERVER}" = "x11" ]; then
    PKG_DEPENDS_TARGET+=" xkbcomp"
  fi
}

pre_configure_target() {
  PKG_CONFIGURE_OPTS_TARGET="--without-xsltproc \
                             --enable-compat-rules \
                             --disable-runtime-deps \
                             --enable-nls \
                             --disable-rpath \
                             --with-gnu-ld"

  if [ "${DISPLAYSERVER}" = "x11" ]; then
    PKG_CONFIGURE_OPTS_TARGET+=" XKBCOMP=/usr/bin/xkbcomp \
                               --with-xkb-base=${XORG_PATH_XKB} \
                               --with-xkb-rules-symlink=xorg"
  fi
}
