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

PKG_NAME="libdvdnav"
PKG_VERSION="5.0.0"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://dvdnav.mplayerhq.hu"
PKG_URL="http://download.videolan.org/pub/contrib/dvdnav/$PKG_NAME-$PKG_VERSION.tar.bz2"
PKG_DEPENDS_TARGET="toolchain libdvdread"
PKG_PRIORITY="optional"
PKG_SECTION="custom/multimedia"
PKG_SHORTDESC="DVD navigation library libdvdnav is a DVD navigation library, which provides an interface to the advanced features of DVDs, like menus and navigation. It contains the VM and other parts useful for writing DVD players. It's based on Ogle, but was modified to be used by xine and mplayer."
PKG_LONGDESC="DVD navigation library libdvdnav is a DVD navigation library, which provides an interface to the advanced features of DVDs, like menus and navigation. It contains the VM and other parts useful for writing DVD players. It's based on Ogle, but was modified to be used by xine and mplayer."

PKG_IS_ADDON="no"
PKG_AUTORECONF="yes"

PKG_CONFIGURE_OPTS_TARGET="--enable-static --disable-shared"
