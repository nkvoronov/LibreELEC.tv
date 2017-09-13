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

PKG_NAME="x264"
PKG_VERSION="snapshot-20170524-2245-stable"
PKG_LICENSE="GPL"
PKG_SITE="http://www.videolan.org/developers/x264.html"
PKG_URL="http://ftp.videolan.org/pub/videolan/x264/snapshots/$PKG_NAME-$PKG_VERSION.tar.bz2"
PKG_DEPENDS_TARGET="toolchain yasm:host"
PKG_SECTION="multimedia"
PKG_SHORTDESC="x264 is a free software library and application for encoding video streams into the H.264/MPEG-4 AVC compression format."
PKG_LONGDESC="x264 is a free software library and application for encoding video streams into the H.264/MPEG-4 AVC compression format."

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

pre_build_target() {
  mkdir -p $PKG_BUILD/.$TARGET_NAME
  cp -RP $PKG_BUILD/* $PKG_BUILD/.$TARGET_NAME
}

pre_configure_target() {
# x264 fails building with LTO support
  strip_lto

# x264 fails running with GOLD support
  strip_gold
  
# set yasm to use
  export AS=yasm
}

configure_target() {
  ./configure --prefix=/usr \
              --host=$TARGET_NAME \
              --cross-prefix=$TARGET_PREFIX \
              --sysroot=$SYSROOT_PREFIX \
              --extra-cflags="$CFLAGS" \
              --extra-ldflags="$LDFLAGS" \
              --enable-static \
              --enable-pic \
              --disable-avs \
              --disable-swscale \
              --disable-lavf \
              --disable-ffms \
              --disable-gpac \
              --disable-lsmash
}
