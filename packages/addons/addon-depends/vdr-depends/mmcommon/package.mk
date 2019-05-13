# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)

PKG_NAME="mmcommon"
PKG_VERSION="9879643187642c20a59be650de00b441653d389c"
PKG_LICENSE="GPL2"
PKG_SITE="http://www.gtkmm.org/"
PKG_URL="https://gitlab.gnome.org/GNOME/mm-common.git"
PKG_DEPENDS_TARGET="toolchain libsigc++"
PKG_LONGDESC="Common build files of the C++ bindings"
PKG_TOOLCHAIN="autotools"

PKG_CONFIGURE_OPTS_TARGET="--prefix=/usr  --disable-network"

pre_build_target() {
  cp -p $PKG_DIR/doctags/*.tag $PKG_BUILD/doctags
}
