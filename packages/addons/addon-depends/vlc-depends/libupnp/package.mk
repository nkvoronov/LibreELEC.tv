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

PKG_NAME="libupnp"
PKG_VERSION="1.6.19"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://pupnp.sourceforge.net/"
PKG_URL="http://download.videolan.org/contrib/upnp/$PKG_NAME-$PKG_VERSION.tar.bz2"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="multimedia"
PKG_SHORTDESC="A Portable Open Source UPnP Development Kit"
PKG_LONGDESC="A Portable Open Source UPnP Development Kit"

PKG_IS_ADDON="no"
PKG_AUTORECONF="yes"

pre_build_target() {
  mkdir -p $PKG_BUILD/.$TARGET_NAME
  cp -RP $PKG_BUILD/* $PKG_BUILD/.$TARGET_NAME
}

configure_target() {
  ./configure --host=$TARGET_NAME \
              --build=$HOST_NAME \
              --prefix=/usr \
              --disable-samples \
              --without-documentation
}
