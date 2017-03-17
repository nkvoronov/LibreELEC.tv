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

PKG_NAME="oscam"
PKG_VERSION="11378"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.streamboard.tv/oscam/wiki"
PKG_SVN_URL="http://www.streamboard.tv/svn/oscam/trunk"
PKG_KEEP_CHECKOUT="no"
PKG_DEPENDS_TARGET="toolchain pcsc-lite"
PKG_SECTION="multimedia"
PKG_SHORTDESC="oscam: OSCam is Open Source Conditional Access Modul."
PKG_LONGDESC="OSCam is Open Source Conditional Access Modul."
PKG_DISCLAIMER="using oscam may be illegal in your country. if in doubt, do not install"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

pre_unpack()  {
  export OSCAM_VERSION="$PKG_VERSION"
}

PKG_CMAKE_OPTS_TARGET="-DLIBUSBDIR=$SYSROOT_PREFIX/usr \
                       -DWITH_SSL=0 \
                       -DHAVE_LIBCRYPTO=0 \
                       -DHAVE_DVBAPI=1 -DWITH_STAPI=0 \
                       -DWEBIF=1 \
                       -DWITH_DEBUG=0 \
                       -DOPTIONAL_INCLUDE_DIR=$SYSROOT_PREFIX/usr/include \
                       -DSTATIC_LIBUSB=1 \
                       -DCLOCKFIX=0"

makeinstall_target() {
  : # nop
}

makeinstall_target() {
  : # nop
}
