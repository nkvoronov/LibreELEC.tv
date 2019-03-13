# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2017-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="media_tree_tbsdtv"
PKG_VERSION="5d9c46813f2030767e595e42865e2759c0e5e11a"
PKG_SHA256="862b8a6e390383e3c97285e387aab91d027b82f78bb288af5edd929295e7b98b"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/tbsdtv/linux_media.git"
PKG_URL="https://github.com/tbsdtv/linux_media/archive/$PKG_VERSION.tar.gz"
PKG_SOURCE_DIR="linux_media-$PKG_VERSION"
PKG_DEPENDS_TARGET="toolchain"
PKG_NEED_UNPACK="$LINUX_DEPENDS"
PKG_LONGDESC="Source of Linux Kernel media_tree subsystem to build with media_build."
PKG_TOOLCHAIN="manual"
