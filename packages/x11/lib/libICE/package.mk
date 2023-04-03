# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2020-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="libICE"
PKG_VERSION="1.1.1"
PKG_SHA256="03e77afaf72942c7ac02ccebb19034e6e20f456dcf8dddadfeb572aa5ad3e451"
PKG_LICENSE="OSS"
PKG_SITE="https://www.X.org"
PKG_URL="https://xorg.freedesktop.org/archive/individual/lib/${PKG_NAME}-${PKG_VERSION}.tar.xz"
PKG_DEPENDS_TARGET="toolchain util-macros xtrans"
PKG_LONGDESC="X Inter-Client Exchange (ICE) protocol library."

if [ "${CUSTOM_SUPPORT}" = "yes" -a "${ENABLE_SHARED}" = "yes" ]; then
  SHARED="--enable-shared"
else
  SHARED="--disable-shared"
fi

PKG_CONFIGURE_OPTS_TARGET="--enable-static \
                           ${SHARED} \
                           --disable-ipv6 \
                           --without-xmlto"
