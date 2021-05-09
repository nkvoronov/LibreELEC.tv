# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="kodi-libdvdread"
PKG_VERSION="bd6b329f0137ab6a9f779a28dd96f04713735e17"
PKG_SHA256="2d9d6d185dd25a983d6dfc2a00207cafdc396a969c227d5edd84b6215b2fba89"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/xbmc/libdvdread"
PKG_URL="https://github.com/xbmc/libdvdread/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="libdvdread (for kodi) is a library which provides a simple foundation for reading DVDs."
PKG_TOOLCHAIN="manual"

if [ "${KODI_DVDCSS_SUPPORT}" = yes ]; then
  PKG_DEPENDS_TARGET+=" kodi-libdvdcss"
fi