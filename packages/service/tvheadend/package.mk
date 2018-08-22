# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="tvheadend"
PKG_VERSION="9b9ee68"
PKG_VERSION_NUMBER="4.3.1292"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.tvheadend.org"
PKG_URL="https://github.com/tvheadend/tvheadend.git"
PKG_DEPENDS_TARGET="toolchain avahi curl dvb-apps ffmpegx libdvbcsa libiconv openssl pngquant:host Python2:host tvh-dtv-scan-tables"
PKG_SECTION="service"
PKG_SHORTDESC="Tvheadend: a TV streaming server for Linux"
PKG_LONGDESC="Tvheadend: is a TV streaming server for Linux supporting DVB-S/S2, DVB-C, DVB-T/T2, IPTV, SAT>IP, ATSC and ISDB-T"

# basic transcoding options
PKG_TVH_TRANSCODING="\
  --disable-ffmpeg_static \
  --disable-libfdkaac_static \
  --disable-libopus_static \
  --disable-libtheora \
  --disable-libtheora_static \
  --disable-libvorbis_static \
  --disable-libvpx_static \
  --disable-libx264_static \
  --disable-libx265_static \
  --enable-libav \
  --enable-libfdkaac \
  --enable-libopus \
  --enable-libvorbis \
  --enable-libvpx \
  --enable-libx264 \
  --enable-libx265"

# specific transcoding options
if [[ "$TARGET_ARCH" != "x86_64" ]]; then
  PKG_TVH_TRANSCODING="$PKG_TVH_TRANSCODING \
    --disable-libvpx \
    --disable-libx265"
fi

PKG_CONFIGURE_OPTS_TARGET="--prefix=/usr \
                           --arch=$TARGET_ARCH \
                           --cpu=$TARGET_CPU \
                           --cc=$CC \
                           $PKG_TVH_TRANSCODING \
                           --enable-avahi \
                           --enable-bundle \
                           --disable-dbus_1 \
                           --enable-dvbcsa \
                           --enable-dvben50221 \
                           --disable-dvbscan \
                           --enable-hdhomerun_client \
                           --enable-epoll \
                           --enable-inotify \
                           --enable-pngquant \
                           --disable-libmfx_static \
                           --disable-nvenc \
                           --disable-uriparser \
                           --enable-tvhcsa \
                           --enable-trace \
                           --nowerror \
                           --disable-bintray_cache \
                           --python=$TOOLCHAIN/bin/python"

post_unpack() {
  sed -e 's/VER="0.0.0~unknown"/VER="'$PKG_VERSION_NUMBER'~g'$PKG_VERSION'~libreelec"/g' -i $PKG_BUILD/support/version
  sed -e 's|'/usr/bin/pngquant'|'$TOOLCHAIN/bin/pngquant'|g' -i $PKG_BUILD/support/mkbundle
}

pre_configure_target() {
# fails to build in subdirs
  cd $PKG_BUILD
  rm -rf .$TARGET_NAME

# pass ffmpegx to build
  PKG_CONFIG_PATH="$(get_build_dir ffmpegx)/.INSTALL_PKG/usr/local/lib/pkgconfig"
  CFLAGS="$CFLAGS -I$(get_build_dir ffmpegx)/.INSTALL_PKG/usr/local/include"
  LDFLAGS="$LDFLAGS -L$(get_build_dir ffmpegx)/.INSTALL_PKG/usr/local/lib"

  export CROSS_COMPILE="$TARGET_PREFIX"
  export CFLAGS="$CFLAGS -I$SYSROOT_PREFIX/usr/include/iconv -L$SYSROOT_PREFIX/usr/lib/iconv"
}

# transcoding link tvheadend with g++
if [ "$TARGET_ARCH" = x86_64 ]; then
  pre_make_target() {
    export CXX=$CXX
  }
fi

post_make_target() {
  $CC -O -fbuiltin -fomit-frame-pointer -fPIC -shared -o capmt_ca.so src/extra/capmt_ca.c -ldl
}

post_install() {
  mkdir -p $INSTALL/usr/bin
    cp -P $PKG_BUILD/build.linux/tvheadend $INSTALL/usr/bin
    cp -P $PKG_DIR/scripts/* $INSTALL/usr/bin
    cp -P $PKG_DIR/tv_grabs/* $INSTALL/usr/bin

  mkdir -p $INSTALL/usr/lib
    cp -P $PKG_BUILD/capmt_ca.so $INSTALL/usr/lib

  mkdir -p $INSTALL/usr/share/tvheadend
    cp -pR $PKG_BUILD/data $INSTALL/usr/share/tvheadend

  mkdir -p $INSTALL/usr/config/tvheadend
    cp -pR $PKG_DIR/config/* $INSTALL/usr/config/tvheadend

  enable_service tvheadend.service
}
