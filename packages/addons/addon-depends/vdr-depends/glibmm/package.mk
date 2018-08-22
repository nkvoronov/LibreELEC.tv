# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)

PKG_NAME="glibmm"
PKG_VERSION="2.56.0"
PKG_SHA256="6e74fcba0d245451c58fc8a196e9d103789bc510e1eee1a9b1e816c5209e79a9"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://developer.gnome.org/glibmm/stable/"
PKG_URL="http://ftp.gnome.org/pub/GNOME/sources/$PKG_NAME/${PKG_VERSION:0:4}/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="toolchain libsigc++"
PKG_SECTION="devel"
PKG_SHORTDESC="glibmm is the official C++ interface for the popular cross-platform library Glib. It provides non-UI API that is not available in standard C++ and makes it possible for gtkmm to wrap GObject-based APIs. See also the Programming with gtkmm book for a tutorial on programming with gtkmm and glibmm."
PKG_LONGDESC="glibmm is the official C++ interface for the popular cross-platform library Glib. It provides non-UI API that is not available in standard C++ and makes it possible for gtkmm to wrap GObject-based APIs. See also the Programming with gtkmm book for a tutorial on programming with gtkmm and glibmm."
PKG_TOOLCHAIN="manual"
