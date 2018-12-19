# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="libtheora"
PKG_VERSION="1.1.1"
PKG_SHA256="f36da409947aa2b3dcc6af0a8c2e3144bc19db2ed547d64e9171c59c66561c61"
PKG_LICENSE="GPL"
PKG_SITE="http://www.theora.org"
PKG_URL="http://download.videolan.org/pub/contrib/theora/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="toolchain libvorbis libpng SDL"
PKG_LONGDESC="Theora is an open video codec being developed by the Xiph.org Foundation as part of their Ogg project. Theora is originally derived from On2's VP3 codec, and has improved on it significantly with the merging of code from the Thusnelda branch."

PKG_CONFIGURE_OPTS_TARGET="--with-sdl-prefix=$SYSROOT_PREFIX/usr --disable-examples"
