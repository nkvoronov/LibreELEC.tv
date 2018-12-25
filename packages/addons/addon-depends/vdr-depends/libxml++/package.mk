# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)

PKG_NAME="libxml++"
PKG_VERSION="3.0.1"
PKG_SHA256="19dc8d21751806c015179bc0b83f978e65c878724501bfc0b6c1bcead29971a6"
PKG_LICENSE="GPL"
PKG_SITE="http://libxmlplusplus.sourceforge.net/"
PKG_URL="http://ftp.gnome.org/pub/GNOME/sources/$PKG_NAME/3.0/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="toolchain glibmm"
PKG_LONGDESC="libxml++ is a C++ wrapper for the libxml2 XML parser and builder library. It presents a simple C++-like API that can achieve common tasks with less code."

PKG_CONFIGURE_OPTS_TARGET="--prefix=/usr"
