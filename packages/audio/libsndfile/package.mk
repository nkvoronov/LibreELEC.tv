# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)

PKG_NAME="libsndfile"
PKG_VERSION="1.0.28"
PKG_SHA256="1ff33929f042fa333aed1e8923aa628c3ee9e1eb85512686c55092d1e5a9dfa9"
PKG_ARCH="any"
PKG_LICENSE="LGPL"
PKG_SITE="http://www.mega-nerd.com/libsndfile/"
PKG_URL="http://www.mega-nerd.com/$PKG_NAME/files/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain alsa-lib"
PKG_SECTION="audio"
PKG_SHORTDESC="libsndfile: A library for accessing various audio file formats"
PKG_LONGDESC="libsndfile is a C library for reading and writing sound files such as AIFF, AU, WAV, and others through one standard interface. It can currently read/write 8, 16, 24 and 32-bit PCM files as well as 32 and 64-bit floating point WAV files and a number of compressed formats. It compiles and runs on *nix, MacOS, and Win32."
PKG_TOOLCHAIN="configure"

# package specific configure options
PKG_CONFIGURE_OPTS_TARGET="--enable-static --disable-shared \
                           --disable-silent-rules \
                           --disable-sqlite \
                           --enable-alsa \
                           --disable-external-libs \
                           --disable-experimental \
                           --disable-test-coverage \
                           --enable-largefile \
                           --with-gnu-ld \
                           --with-pic"

post_makeinstall_target() {
  rm -rf $INSTALL/usr/bin
}
