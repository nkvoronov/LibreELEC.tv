# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)

PKG_NAME="glibmm"
PKG_VERSION="2.40.0"
PKG_SHA256="34f320fad7e0057c63863706caa802ae0051b21523bed91ec33baf8421ca484f"
PKG_LICENSE="GPL"
PKG_SITE="https://developer.gnome.org/glibmm/stable/"
PKG_URL="http://ftp.gnome.org/pub/GNOME/sources/$PKG_NAME/${PKG_VERSION:0:4}/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="toolchain mmcommon libsigc++"
PKG_LONGDESC="glibmm is the official C++ interface for the popular cross-platform library Glib. It provides non-UI API that is not available in standard C++ and makes it possible for gtkmm to wrap GObject-based APIs. See also the Programming with gtkmm book for a tutorial on programming with gtkmm and glibmm."

PKG_CONFIGURE_OPTS_TARGET="--prefix=/usr --enable-maintainer-mode"
