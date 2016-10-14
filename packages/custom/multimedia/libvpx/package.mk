################################################################################
#      This file is part of OpenELEC - http://www.openelec.tv
#      Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
#      Copyright (C) 2014 Stefan Benz (benz.st@gmail.com)
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

PKG_NAME="libvpx"
PKG_VERSION="1.5.0"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="BSD-3c"
PKG_SITE="http://www.webmproject.org/"
PKG_URL="http://storage.googleapis.com/downloads.webmproject.org/releases/webm/${PKG_NAME}-${PKG_VERSION}.tar.bz2"
PKG_DEPENDS_TARGET="toolchain yasm:host"
PKG_SECTION="multimedia"
PKG_SHORTDESC="VP8/VP9 Codec SDK"
PKG_LONGDESC="The WebM Project is dedicated to developing a high-quality, open video format for the web that's freely available to everyone."

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

pre_configure_target() {
# ffmpeg fails building with LTO support
  strip_lto

# ffmpeg fails running with GOLD support
  strip_gold
}

configure_target() {
  $PKG_CONFIGURE_SCRIPT --prefix=/usr \
                       --extra-cflags="$CFLAGS" \
                       --extra-cxxflags="$CXXFLAGS" \
                       --enable-pic \
                       --as=yasm \
                       --enable-static \
                       --enable-vp8 \
                       --enable-vp9 \
                       --enable-small \
                       --disable-examples \
                       --disable-docs \
                       --disable-shared \
                       --disable-unit-tests \
                       --disable-vp8-decoder \
                       --disable-vp9-decoder
}
