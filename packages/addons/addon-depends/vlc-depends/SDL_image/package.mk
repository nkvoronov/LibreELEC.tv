# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="SDL_image"
PKG_VERSION="1.2.12"
PKG_SHA256="0b90722984561004de84847744d566809dbb9daf732a9e503b91a1b5a84e5699"
PKG_LICENSE="GPL"
PKG_SITE="http://www.libsdl.org/"
PKG_URL="http://www.libsdl.org/projects/SDL_image/release/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain SDL libjpeg-turbo libpng tiff"
PKG_LONGDESC="SDL_image is an image loading library that is used with the SDL library, and almost as portable. It allows a programmer to use multiple image formats without having to code all the loading and conversion algorithms themselves."
PKG_TOOLCHAIN="autotools"

PKG_CONFIGURE_OPTS_TARGET="--disable-png \
                           --enable-tif \
                           --disable-sdltest \
                           --with-sdl-prefix=$SYSROOT_PREFIX/usr"
