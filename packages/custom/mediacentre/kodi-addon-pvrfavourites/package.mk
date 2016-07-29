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

PKG_NAME="kodi-addon-pvrfavourites"
PKG_VERSION="fc1d7c7"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/nkvoronov/script.pvr.favourites.git"
PKG_GIT_URL="https://github.com/nkvoronov/script.pvr.favourites.git"
PKG_GIT_BRANCH="master"
PKG_KEEP_CHECKOUT="yes"
PKG_DEPENDS_TARGET="toolchain Python kodi"
PKG_PRIORITY="optional"
PKG_SECTION="custom/mediacentre"
PKG_SHORTDESC="pvrfavourites addon for KODI"
PKG_LONGDESC="This addon allows pvrfavourites KODI."

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

make_target() {
  : # nothing
}

makeinstall_target() {
  : # nothing
}

post_install() {
  mkdir -p $INSTALL/usr/share/kodi/addons/script.pvr.favourites
    cp -PR $PKG_BUILD/* $INSTALL/usr/share/kodi/addons/script.pvr.favourites

  python -Wi -t -B $ROOT/$TOOLCHAIN/lib/python2.7/compileall.py $INSTALL/usr/share/kodi/addons/script.pvr.favourites/resources/lib/ -f
  rm -rf `find $INSTALL/usr/share/kodi/addons/script.pvr.favourites/resources/lib/ -name "*.py"`
}
