# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="a52dec"
PKG_VERSION="0.8.0"
PKG_SHA256="03c181ce9c3fe0d2f5130de18dab9bd8bc63c354071515aa56983c74a9cffcc9"
PKG_LICENSE="GPL"
PKG_SITE="https://git.adelielinux.org/community/a52dec/"
PKG_URL="https://distfiles.adelielinux.org/source/${PKG_NAME}/${PKG_NAME}-${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="library for decoding ATSC A/52 streams liba52 is a free library for decoding ATSC A/52 streams. The A/52 standard is used in a variety of applications, including digital television and DVD. It is also known as AC-3."
PKG_TOOLCHAIN="autotools"

post_makeinstall_target() {
  rm -rf $INSTALL/usr/bin
}
