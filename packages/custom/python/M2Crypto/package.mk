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

PKG_NAME="M2Crypto"
PKG_VERSION="0.24.0"
PKG_ARCH="any"
PKG_LICENSE="MIT"
PKG_SITE="https://pypi.python.org/pypi/M2Crypto"
PKG_URL="https://pypi.python.org/packages/58/75/362faac80a1bc2742b4b696dc350518312043d568bfd2687a9270f18da88/M2Crypto-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain Python setuptools openssl swig"
PKG_SECTION="python"
PKG_SHORTDESC="A crypto and SSL toolkit for Python."
PKG_LONGDESC="A crypto and SSL toolkit for Python"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"


pre_make_target() {
  export PYTHONXCPREFIX="$SYSROOT_PREFIX/usr"
  export LDSHARED="$CC -shared"
}

make_target() {
  python setup.py build
}

makeinstall_target() {
  python setup.py install --root=$INSTALL --prefix=/usr
}

post_makeinstall_target() {
  find $INSTALL/usr/lib -name "*.py" -exec rm -rf "{}" ";"
}
