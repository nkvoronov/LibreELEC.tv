################################################################################
#      This file is part of OpenELEC - http://www.openelec.tv
#      Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
#
#  OpenELEC is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 2 of the License, or
#  (at your option) any later version.
#
#  OpenELEC is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with OpenELEC.  If not, see <http://www.gnu.org/licenses/>.
################################################################################

PKG_NAME="apsw"
PKG_VERSION="3.15.2"
PKG_ARCH="any"
PKG_LICENSE="MIT"
PKG_SITE="https://github.com/rogerbinns/apsw"
PKG_URL="https://github.com/rogerbinns/apsw/archive/$PKG_VERSION-r1.tar.gz"
PKG_DEPENDS_TARGET="toolchain Python sqlite"
PKG_SECTION="python"
PKG_SHORTDESC="APSW provides an SQLite 3 wrapper that provides the thinnest layer over the SQLite database library possible."
PKG_LONGDESC="APSW provides an SQLite 3 wrapper that provides the thinnest layer over the SQLite database library possible."

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"


pre_make_target() {
  export PYTHONXCPREFIX="$SYSROOT_PREFIX/usr"
  export LDSHARED="$CC -shared"
}

make_target() {
  python setup.py build --enable=load_extension
}

makeinstall_target() {
  python setup.py install --root=$INSTALL --prefix=/usr
}

post_makeinstall_target() {
  find $INSTALL/usr/lib -name "*.py" -exec rm -rf "{}" ";"
}
