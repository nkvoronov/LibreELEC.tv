# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="libretro-reicast"
PKG_VERSION="c78cc08daa4debd28c4488ec27da0a96548efb12"
PKG_SHA256="78597f5c5be358dacf646bbe9ffc82c31fa3f908a5e8079f06789cf3335d85f3"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/libretro/reicast-emulator"
PKG_URL="https://github.com/libretro/reicast-emulator/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain kodi-platform"
PKG_LONGDESC="Reicast is a multiplatform Sega Dreamcast emulator"

PKG_LIBNAME="reicast_libretro.so"
PKG_LIBPATH="$PKG_LIBNAME"
PKG_LIBVAR="REICAST_LIB"

make_target() {
  if [ "$DEVICE" = "RPi2" ]; then
    make platform=${DEVICE,,}
  else
    case $TARGET_CPU in
      arm1176jzf-s)
        make platform=arm FORCE_GLES=1
        ;;
      cortex-a7|cortex-a9)
        make platform=armv7-neon-hardfloat-$TARGET_CPU FORCE_GLES=1
        ;;
      x86-64)
        make
        ;;
    esac
  fi
}

makeinstall_target() {
  mkdir -p $SYSROOT_PREFIX/usr/lib/cmake/$PKG_NAME
  cp $PKG_LIBPATH $SYSROOT_PREFIX/usr/lib/$PKG_LIBNAME
  echo "set($PKG_LIBVAR $SYSROOT_PREFIX/usr/lib/$PKG_LIBNAME)" > $SYSROOT_PREFIX/usr/lib/cmake/$PKG_NAME/$PKG_NAME-config.cmake
}
