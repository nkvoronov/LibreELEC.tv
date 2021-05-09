# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2019-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="media_tree_tbsdtv"
PKG_VERSION="4a3d911da787b1f7544a70cd85eab6c73be97de0"
PKG_SHA256="520b938e7b6ec18fdf7d4635ffb0fab97d869a4da129aeab685d1e5058bfa504"
PKG_LICENSE="GPL"
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
