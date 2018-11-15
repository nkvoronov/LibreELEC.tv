# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)

PKG_NAME="pcre"
PKG_VERSION="8.42"
PKG_SHA256="2cd04b7c887808be030254e8d77de11d3fe9d4505c39d4b15d2664ffe8bf9301"
PKG_LICENSE="OSS"
PKG_SITE="http://www.pcre.org/"
PKG_URL="https://ftp.pcre.org/pub/pcre/$PKG_NAME-$PKG_VERSION.tar.bz2"
PKG_DEPENDS_HOST=""
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="The PCRE library is a set of functions that implement regular expression pattern matching using the same syntax and semantics as Perl 5. PCRE has its own native API, as well as a set of wrapper functions that correspond to the POSIX regular expression API. The PCRE library is free, even for building commercial software."
PKG_TOOLCHAIN="configure"
PKG_BUILD_FLAGS="+pic"

if [ "$CUSTOM_SUPPORT" = "yes" -a "$ENABLE_SHARED" = "yes" ]; then
  SHARED="--enable-shared"
else
  SHARED="--disable-shared"
fi

PKG_CONFIGURE_OPTS_HOST="--prefix=$TOOLCHAIN \
             --enable-static \
             --enable-utf8 \
             --enable-unicode-properties \
             --with-gnu-ld"

PKG_CONFIGURE_OPTS_TARGET="$SHARED \
             --enable-static \
             --enable-utf8 \
             --enable-pcre16 \
             --enable-unicode-properties \
             --with-gnu-ld"

post_makeinstall_target() {
  rm -rf $INSTALL/usr/bin
  sed -e "s:\(['= ]\)/usr:\\1$SYSROOT_PREFIX/usr:g" -i $SYSROOT_PREFIX/usr/bin/$PKG_NAME-config
}
