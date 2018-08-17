################################################################################
#      This file is part of LibreELEC - http://www.libreelec.tv
#      Copyright (C) 2016 Team LibreELEC
#
#  LibreELEC is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 2 of the License, or
#  (at your option) any later version.
#
#  LibreELEC is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with LibreELEC.  If not, see <http://www.gnu.org/licenses/>.
################################################################################

PKG_NAME="libshout"
PKG_VERSION="2.3.1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.icecast.org"
PKG_URL="http://download.videolan.org/pub/contrib/shout/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain libvorbis libtheora speex"
PKG_SECTION="audio"
PKG_SHORTDESC="A library for communicating with and sending data to Icecast and Icecast 2 streaming audio servers.  It handles the socket connection, the timing of the data transmission, and prevents bad data from getting to the server."
PKG_LONGDESC="A library for communicating with and sending data to Icecast and Icecast 2 streaming audio servers.  It handles the socket connection, the timing of the data transmission, and prevents bad data from getting to the server."

PKG_IS_ADDON="no"
PKG_AUTORECONF="yes"

PKG_CONFIGURE_OPTS_TARGET="--disable-shared --enable-static"
