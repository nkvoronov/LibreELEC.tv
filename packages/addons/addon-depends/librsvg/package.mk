# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)

PKG_NAME="librsvg"
PKG_VERSION="2.40.9"
PKG_SHA256="13964c5d35357552b47d365c34215eee0a63bf0e6059b689f048648c6bf5f43a"
PKG_LICENSE="GPL"
PKG_SITE="http://live.gnome.org/LibRsvg"
PKG_URL="http://ftp.gnome.org/pub/GNOME/sources/${PKG_NAME}/${PKG_VERSION:0:4}/${PKG_NAME}-${PKG_VERSION}.tar.xz"
PKG_DEPENDS_TARGET="toolchain cairo pangox gdk-pixbufx libcroco"
PKG_LONGDESC="librsvg is a free software SVG rendering library written as part of the GNOME project, intended to be lightweight and portable."
PKG_TOOLCHAIN="autotools"

PKG_CONFIGURE_OPTS_TARGET="--enable-introspection=no --disable-gtk-doc"

pre_configure_target() {
  export GDK_PIXBUF_QUERYLOADERS=$SYSROOT_PREFIX/usr/bin
  export PKG_CONFIG_PATH="$(get_build_dir pango)/.$TARGET_NAME"
  export CFLAGS="$CFLAGS -I$(get_build_dir pango) -L$(get_build_dir pango)/.$TARGET_NAME/pango"
}