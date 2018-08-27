# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="dcadec"
PKG_VERSION="0e07438"
#PKG_SHA256="9ba8b04bdb13f7860a2041768ac83b47b397a36549c71c530b94028a3cfd5b51"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/foo86/dcadec"
PKG_URL="https://github.com/foo86/dcadec/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="audio"
PKG_SHORTDESC="DTS Coherent Acoustics decoder with support for HD extensions"
PKG_LONGDESC="DTS Coherent Acoustics decoder with support for HD extensions"

# todo: we need to build as shared library, otherwise sond dont work
# in kodi with enabled dcadec support and we have 100% CPU usage
# (to test disable passtrough and use a DTS-HD sample)
PKG_MAKE_OPTS_TARGET="PREFIX=/usr BINDIR=/usr/bin LIBDIR=/usr/lib INCLUDEDIR=/usr/include PKG_CONFIG_PATH=/usr/lib/pkgconfig CONFIG_SHARED=1"
PKG_MAKEINSTALL_OPTS_TARGET="$PKG_MAKE_OPTS_TARGET"

pre_configure_target() {
  export CFLAGS="$CFLAGS -fPIC -DPIC"
  export LDFLAGS="$LDFLAGS -fPIC -DPIC"
}

post_makeinstall_target() {
  rm -rf $INSTALL/usr/bin
}
