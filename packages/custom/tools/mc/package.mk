################################################################################
#      This file is part of OpenELEC - http://www.openelec.tv
#      Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
#
#  OpenELEC is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 2 of the License, or
#  (at your option) any later version.
#
#  OpenELEC is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with OpenELEC.  If not, see <http://www.gnu.org/licenses/>.
################################################################################

PKG_NAME="mc"
PKG_VERSION="4.8.17"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.midnight-commander.org/"
PKG_URL="http://ftp.midnight-commander.org/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="toolchain libtool:host gettext:host glib pcre slang"
PKG_PRIORITY="optional"
PKG_SECTION="tools"
PKG_SHORTDESC="mc: free cross-platform filemanager"
PKG_LONGDESC="Midnight Commander - free cross-platform filemanager and clone of Norton Commander"

PKG_IS_ADDON="no"
PKG_AUTORECONF="yes"

PKG_CONFIGURE_OPTS_TARGET="--host=$TARGET_NAME \
            --build=$HOST_NAME \
            --prefix=/usr \
            --exec-prefix=/usr \
            --disable-mclib \
            --disable-aspell \
            --disable-vfs \
            --disable-doxygen-doc \
            --disable-doxygen-dot \
            --disable-doxygen-html \
            --with-sysroot=$SYSROOT_PREFIX \
            --with-screen=slang \
            --without-x \
            --with-gnu-ld \
            --without-libiconv-prefix \
            --without-libintl-prefix \
            --with-internal-edit \
            --without-diff-viewer \
            --with-subshell"

pre_configure_target() {
  export CFLAGS="$CFLAGS -I$SYSROOT_PREFIX/usr/include/slang"
  export LDFLAGS=`echo $LDFLAGS | sed -e "s|-Wl,--as-needed||"`
}
