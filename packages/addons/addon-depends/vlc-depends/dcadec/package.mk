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

PKG_NAME="dcadec"
PKG_VERSION="0e07438"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/foo86/dcadec"
PKG_URL="https://github.com/foo86/dcadec/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="audio"
PKG_SHORTDESC="DTS Coherent Acoustics decoder with support for HD extensions"
PKG_LONGDESC="DTS Coherent Acoustics decoder with support for HD extensions"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

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
