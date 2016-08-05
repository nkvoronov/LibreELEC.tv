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

PKG_NAME="kodi-module-six"
PKG_VERSION="3ef2427"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/XBMC-Addons/script.module.six.git"
PKG_GIT_URL="https://github.com/XBMC-Addons/script.module.six.git"
PKG_GIT_BRANCH="master"
PKG_KEEP_CHECKOUT="no"
PKG_DEPENDS_TARGET="toolchain Python kodi"
PKG_PRIORITY="optional"
PKG_SECTION="mediacentre"
PKG_SHORTDESC="Python 2 and 3 compatibility utilities."
PKG_LONGDESC="Six is a Python 2 and 3 compatibility library. It provides utility functions for smoothing over the differences between the Python versions with the goal of writing Python code that is compatible on both Python versions. See the documentation for more information on what is provided."

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

make_target() {
  : # nothing to make here
}

makeinstall_target() {
  : # nothing to install here
}

post_install() {
  mkdir -p $INSTALL/usr/share/kodi/addons/script.module.six
    cp -PR $PKG_BUILD/* $INSTALL/usr/share/kodi/addons/script.module.six

  python -Wi -t -B $ROOT/$TOOLCHAIN/lib/python2.7/compileall.py $INSTALL/usr/share/kodi/addons/script.module.six/lib/ -f
  rm -rf `find $INSTALL/usr/share/kodi/addons/script.module.six/lib/ -name "*.py"`
}