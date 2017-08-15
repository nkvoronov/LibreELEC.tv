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

PKG_NAME="python-xmltv"
PKG_VERSION="1.4.3"
PKG_ARCH="any"
PKG_LICENSE=""
PKG_SITE="https://bitbucket.org/jfunk/python-xmltv"
PKG_URL="https://pypi.python.org/packages/source/p/python-xmltv/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain Python distutilscross:host"
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
  cp -PR $PKG_BUILD/.install/* $INSTALL
}
