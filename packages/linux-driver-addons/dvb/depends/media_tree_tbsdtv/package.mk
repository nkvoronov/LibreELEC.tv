# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2019-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="media_tree_tbsdtv"
PKG_VERSION="36f998cbe206fa3a377cbb60b95e0701217ddc98"
PKG_SHA256="2084cd49b72d3acf6406c79ddb231c5e3945f532e3a74c1d62a6ca9fe4406a89"
PKG_SITE="https://github.com/tbsdtv/linux_media.git"
PKG_URL="https://github.com/tbsdtv/linux_media/archive/${PKG_VERSION}.tar.gz"
PKG_SOURCE_DIR="linux_media-${PKG_VERSION}"
PKG_DEPENDS_TARGET="toolchain"
PKG_NEED_UNPACK="${LINUX_DEPENDS}"
PKG_LONGDESC="Source of Linux Kernel media_tree subsystem to build with media_build."
PKG_TOOLCHAIN="manual"

post_unpack() {
  # hack/workaround for borked upstream kernel/media_build
  # without removing atomisp there a lot additional includes that 
  # slowdown build process after modpost from 3min to 6min
  # even if atomisp is disabled via kernel.conf
  rm -rf ${PKG_BUILD}/drivers/staging/media/atomisp
  sed -i 's|^.*drivers/staging/media/atomisp.*$||' \
    ${PKG_BUILD}/drivers/staging/media/Kconfig
}
