################################################################################
#      This file is part of OpenELEC - http://www.openelec.tv
#      Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
#
#  This Program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2, or (at your option)
#  any later version.
#
#  This Program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with OpenELEC.tv; see the file COPYING.  If not, write to
#  the Free Software Foundation, 51 Franklin Street, Suite 500, Boston, MA 02110, USA.
#  http://www.gnu.org/copyleft/gpl.html
################################################################################

PKG_NAME="libssh2"
PKG_VERSION="1.4.3"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://libssh2.org"
PKG_URL="$DISTRO_CUSTOM_SRC/$PKG_NAME/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="toolchain libgcrypt zlib"
PKG_PRIORITY="optional"
PKG_SECTION="devel"
PKG_SHORTDESC="libssh2 is a client-side C library implementing the SSH2 protocol. It supports regular terminal, SCP and SFTP sessions; port forwarding; password, key-based and keyboard-interactive authentication."
PKG_LONGDESC="libssh2 is a client-side C library implementing the SSH2 protocol. It supports regular terminal, SCP and SFTP sessions; port forwarding; password, key-based and keyboard-interactive authentication."
PKG_IS_ADDON="no"
PKG_AUTORECONF="yes"

PKG_CONFIGURE_OPTS_TARGET="--disable-shared --enable-static --with-libgcrypt --disable-rpath"
