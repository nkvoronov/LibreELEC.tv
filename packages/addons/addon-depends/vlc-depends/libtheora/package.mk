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

PKG_NAME="libtheora"
PKG_VERSION="1.1.1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.theora.org"
PKG_URL="http://download.videolan.org/pub/contrib/theora/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="toolchain libvorbis libpng SDL"
PKG_SECTION="multimedia"
PKG_SHORTDESC="Theora is an open video codec being developed by the Xiph.org Foundation as part of their Ogg project. Theora is originally derived from On2's VP3 codec, and has improved on it significantly with the merging of code from the Thusnelda branch."
PKG_LONGDESC="Theora is an open video codec being developed by the Xiph.org Foundation as part of their Ogg project. Theora is originally derived from On2's VP3 codec, and has improved on it significantly with the merging of code from the Thusnelda branch."

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

PKG_CONFIGURE_OPTS_TARGET="--enable-static --disable-shared --with-sdl-prefix=$SYSROOT_PREFIX/usr --disable-examples"
