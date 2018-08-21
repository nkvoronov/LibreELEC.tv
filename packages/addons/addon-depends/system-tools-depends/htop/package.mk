# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="htop"
PKG_VERSION="2.0.2"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://hisham.hm/htop"
PKG_URL="https://github.com/hishamhm/htop/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain ncurses"
PKG_SECTION="tools"
PKG_LONGDESC="An interactive process viewer for Unix"
PKG_TOOLCHAIN="autotools"

pre_configure_target() {
  export CFLAGS="$CFLAGS -fno-strict-aliasing -lncurses -lterminfo"
}
