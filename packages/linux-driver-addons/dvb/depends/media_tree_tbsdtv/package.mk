# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2019-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="media_tree_tbsdtv"
PKG_VERSION="0bc8cfa5b40283ec1f075d690c94c192c375b051"
PKG_SHA256="756f9599d48f0b186a2345d60fdf70ebe351098d0919c4be732fa83d0359b6ec"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/tbsdtv/linux_media.git"
PKG_URL="https://github.com/tbsdtv/linux_media/archive/${PKG_VERSION}.tar.gz"
PKG_SOURCE_DIR="linux_media-$PKG_VERSION"
PKG_DEPENDS_TARGET="toolchain"
PKG_NEED_UNPACK="${LINUX_DEPENDS}"
PKG_LONGDESC="Source of Linux Kernel media_tree subsystem to build with media_build."
PKG_TOOLCHAIN="manual"

unpack() {
  mkdir -p ${PKG_BUILD}/
  tar -xf ${SOURCES}/${PKG_NAME}/${PKG_NAME}-${PKG_VERSION}.tar.bz2 -C ${PKG_BUILD}/
}

post_unpack() {
  # hack/workaround for borked upstream kernel/media_build
  # without removing atomisp there a lot additional includes that 
  # slowdown build process after modpost from 3min to 6min
  # even if atomisp is disabled via kernel.conf
  rm -rf ${PKG_BUILD}/drivers/staging/media/atomisp
  sed -i 's|^.*drivers/staging/media/atomisp.*$||' \
    ${PKG_BUILD}/drivers/staging/media/Kconfig
}