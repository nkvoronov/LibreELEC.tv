################################################################################
#      This file is part of OpenELEC - http://www.openelec.tv
#      Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
#
#  This Program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2, or (at your option)
#  any later version.
#
#  This Program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with OpenELEC.tv; see the file COPYING.  If not, write to
#  the Free Software Foundation, 51 Franklin Street, Suite 500, Boston, MA 02110, USA.
#  http://www.gnu.org/copyleft/gpl.html
################################################################################

PKG_NAME="tvheadend"
PKG_VERSION="b536cdb"
PKG_VERSION_NUMBER="4.1.2146"
PKG_REV="135"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.tvheadend.org"
PKG_GIT_URL="https://github.com/tvheadend/tvheadend.git"
PKG_GIT_BRANCH="master"
PKG_KEEP_CHECKOUT="no"
PKG_DEPENDS_TARGET="toolchain curl libdvbcsa libiconv libressl Python:host yasm"
PKG_PRIORITY="optional"
PKG_SECTION="multimedia"
PKG_SHORTDESC="tvheadend (Version: $PKG_VERSION): a TV streaming server for Linux supporting DVB-S, DVB-S2, DVB-C, DVB-T, ATSC, IPTV, and Analog video (V4L) as input sources."
PKG_LONGDESC="Tvheadend (Version: $PKG_VERSION) is a TV streaming server for Linux supporting DVB-S, DVB-S2, DVB-C, DVB-T, ATSC, IPTV, and Analog video (V4L) as input sources. It also comes with a powerful and easy to use web interface both used for configuration and day-to-day operations, such as searching the EPG and scheduling recordings. Even so, the most notable feature of Tvheadend is how easy it is to set up: Install it, navigate to the web user interface, drill into the TV adapters tab, select your current location and Tvheadend will start scanning channels and present them to you in just a few minutes. If installing as an Addon a reboot is needed"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

# transcoding only for generic
if [ "$TARGET_ARCH" = x86_64 ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET libva-intel-driver"
  TVH_TRANSCODING="--enable-ffmpeg_static --enable-libav --enable-libfdkaac --disable-libtheora --enable-libvorbis --enable-libvpx --enable-libx264 --enable-libx265 --disable-qsv"
else
  TVH_TRANSCODING="--disable-ffmpeg_static --disable-libav"
fi

PKG_CONFIGURE_OPTS_TARGET="--prefix=/usr \
                           --arch=$TARGET_ARCH \
                           --cpu=$TARGET_CPU \
                           --cc=$TARGET_CC \
                           --disable-avahi \
                           --enable-bundle \
                           --disable-dbus_1 \
                           --enable-dvbcsa \
                           --disable-dvben50221 \
                           --enable-hdhomerun_client \
                           --enable-hdhomerun_static \
                           --enable-epoll \
                           --enable-inotify \
                           --disable-nvenc \
                           --disable-uriparser \
                           $TVH_TRANSCODING \
                           --enable-tvhcsa \
                           --nowerror \
                           --python=$ROOT/$TOOLCHAIN/bin/python"

post_unpack() {
  sed -e 's/VER="0.0.0~unknown"/VER="'$PKG_VERSION_NUMBER'~g'$PKG_VERSION'~libreelec"/g' -i $PKG_BUILD/support/version
}

pre_configure_target() {
  # fails to build in subdirs
  cd $ROOT/$PKG_BUILD
  rm -rf .$TARGET_NAME

  # transcoding
  if [ "$TARGET_ARCH" = x86_64 ]; then
    export AS=$ROOT/$TOOLCHAIN/bin/yasm
  fi

  export CROSS_COMPILE=$TARGET_PREFIX
  export CFLAGS="$CFLAGS -I$SYSROOT_PREFIX/usr/include/iconv -L$SYSROOT_PREFIX/usr/lib/iconv"
}

# transcoding link tvheadend with g++
if [ "$TARGET_ARCH" = x86_64 ]; then
  pre_make_target() {
    export CXX=$TARGET_CXX
  }
fi

post_make_target() {
  $CC -O -fbuiltin -fomit-frame-pointer -fPIC -shared -o capmt_ca.so src/extra/capmt_ca.c -ldl
}

makeinstall_target() {
  : # nothing to do here
}
