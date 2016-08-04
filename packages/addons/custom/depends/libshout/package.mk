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

PKG_NAME="libshout"
PKG_VERSION="2.3.1"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.icecast.org"
PKG_URL="http://download.videolan.org/pub/contrib/shout/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain libvorbis libtheora speex"
PKG_PRIORITY="optional"
PKG_SECTION="custom/audio"
PKG_SHORTDESC="A library for communicating with and sending data to Icecast and Icecast 2 streaming audio servers.  It handles the socket connection, the timing of the data transmission, and prevents bad data from getting to the server."
PKG_LONGDESC="A library for communicating with and sending data to Icecast and Icecast 2 streaming audio servers.  It handles the socket connection, the timing of the data transmission, and prevents bad data from getting to the server."

PKG_IS_ADDON="no"
PKG_AUTORECONF="yes"

PKG_CONFIGURE_OPTS_TARGET="--disable-shared --enable-static"
