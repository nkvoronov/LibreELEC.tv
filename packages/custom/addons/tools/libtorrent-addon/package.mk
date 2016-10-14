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

PKG_NAME="libtorrent-addon"
PKG_VERSION="1.0.3"
PKG_REV="3"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.libtorrent.org/"
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain libtorrent-rasterbar"
PKG_SECTION="tools"
PKG_SHORTDESC="libtorrent (Version: $PKG_VERSION): libtorrent is a feature complete C++ bittorrent implementation focusing on efficiency and scalability. It runs on embedded devices as well as desktops. It boasts a well documented library interface that is easy to use. It comes with a simple bittorrent client demonstrating the use of the library."
PKG_LONGDESC="libtorrent (Version: $PKG_VERSION): libtorrent is a feature complete C++ bittorrent implementation focusing on efficiency and scalability. It runs on embedded devices as well as desktops. It boasts a well documented library interface that is easy to use. It comes with a simple bittorrent client demonstrating the use of the library."

PKG_IS_ADDON="yes"
PKG_ADDON_TYPE="xbmc.python.script"
PKG_AUTORECONF="no"
PKG_ADDON_REPOVERSION="8.0"

make_target() {
  : # nothing to make here
}

makeinstall_target() {
  : # nothing to install here
}

addon() {
  LIBTORRENT_DIR=$(get_build_dir libtorrent-rasterbar)

  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/lib
    cp -P $LIBTORRENT_DIR/.install_pkg/usr/lib/libtorrent-rasterbar.so.8.0.0 $ADDON_BUILD/$PKG_ADDON_ID/lib/libtorrent-rasterbar.so.8
    cp -P $LIBTORRENT_DIR/.install_pkg/usr/lib/python2.7/site-packages/libtorrent.so $ADDON_BUILD/$PKG_ADDON_ID/lib

}
