# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2017-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="media_tree_tbsdtv"
PKG_VERSION="ae4de630e55ec48a2c170f0011a61ecaf456c2ed"
PKG_SHA256="765f0de7bafdb6b28f745f5ba3aa9fc664c17f42409c5e4355209ec4e7b1b697"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/tbsdtv/linux_media.git"
PKG_URL="https://github.com/tbsdtv/linux_media/archive/$PKG_VERSION.tar.gz"
PKG_SOURCE_DIR="linux_media-$PKG_VERSION"
PKG_DEPENDS_TARGET="toolchain"
PKG_NEED_UNPACK="$LINUX_DEPENDS"
PKG_LONGDESC="Source of Linux Kernel media_tree subsystem to build with media_build."
PKG_TOOLCHAIN="manual"
