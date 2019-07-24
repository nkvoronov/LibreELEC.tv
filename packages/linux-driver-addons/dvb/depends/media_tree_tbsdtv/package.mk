# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2017-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="media_tree_tbsdtv"
PKG_VERSION="17587ba554c68dff58d48f20669a7b37d7551547"
PKG_SHA256="20244a6b9f30058e7f72e8cf48a967cc923afb3136ea909c037cd82c5245d3bf"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/tbsdtv/linux_media.git"
PKG_URL="https://github.com/tbsdtv/linux_media/archive/$PKG_VERSION.tar.gz"
PKG_SOURCE_DIR="linux_media-$PKG_VERSION"
PKG_DEPENDS_TARGET="toolchain"
PKG_NEED_UNPACK="$LINUX_DEPENDS"
PKG_LONGDESC="Source of Linux Kernel media_tree subsystem to build with media_build."
PKG_TOOLCHAIN="manual"
