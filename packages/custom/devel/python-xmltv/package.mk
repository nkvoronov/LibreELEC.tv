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

PKG_NAME="python-xmltv"
PKG_VERSION="1.4.3"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE=""
PKG_SITE="https://bitbucket.org/jfunk/python-xmltv"
PKG_URL="https://pypi.python.org/packages/source/p/python-xmltv/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain Python distutilscross:host"
PKG_PRIORITY="optional"
PKG_SECTION="devel"
PKG_SHORTDESC="A Python Module for Reading and Writing XMLTV Files"
PKG_LONGDESC="A Python Module for Reading and Writing XMLTV Files"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

pre_make_target() {
  export PYTHONXCPREFIX="$SYSROOT_PREFIX/usr"
  export LDFLAGS="$LDFLAGS -L$SYSROOT_PREFIX/usr/lib -L$SYSROOT_PREFIX/lib"
}

make_target() {
  python setup.py build
}

makeinstall_target() {
  python setup.py install --root=./.install --prefix=/usr
}

post_install() {
  rm -rf .install/usr/lib/python*/site-packages/*.py
  cp -PR $ROOT/$PKG_BUILD/.install/* $INSTALL
}
