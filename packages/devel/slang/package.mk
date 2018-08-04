# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="slang"
PKG_VERSION="2.1.4"
PKG_SHA256="14877efebbf0e57a3543f7ab3c72b491d3e398ea852616990f88463d64a3b4e3"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://s-lang.org/"
PKG_URL="ftp://space.mit.edu/pub/davis/slang/v2.1/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="devel"
PKG_SHORTDESC="slang: multi-platform programmer's library designed to allow a developer to create robust multi-platform software."
PKG_LONGDESC="S-Lang is a multi-platform programmer's library designed to allow a developer to create robust multi-platform software. It provides facilities required by interactive applications such as display/screen management, keyboard input, keymaps, and so on. The most exciting feature of the library is the slang interpreter that may be easily embedded into a program to make it extensible. While the emphasis has always been on the embedded nature of the interpreter, it may also be used in a stand-alone fashion through the use of slsh, which is part of the S-Lang distribution."
PKG_BUILD_FLAGS="-parallel"

PKG_CONFIGURE_OPTS_TARGET="--without-onig"

pre_configure_target() {
 # slang fails to build in subdirs
 cd $PKG_BUILD
 rm -rf .$TARGET_NAME
}

pre_configure_host() {
 # slang fails to build in subdirs
 cd $PKG_BUILD
 rm -rf .$HOST_NAME
}
