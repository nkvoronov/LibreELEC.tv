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

PKG_NAME="speexdsp"
PKG_VERSION="1.2rc3"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.speex.org"
PKG_URL="http://download.videolan.org/pub/contrib/speexdsp/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain libogg"
PKG_SECTION="audio"
PKG_SHORTDESC="Speex is an audio codec especially designed for compressing voice at low bit-rates for applications such as voice over IP (VoIP). In some senses, it is meant to be complementary to the Vorbis codec which places a greater emphasis on high-quality music reproduction."
PKG_LONGDESC="Speex is an audio codec especially designed for compressing voice at low bit-rates for applications such as voice over IP (VoIP). In some senses, it is meant to be complementary to the Vorbis codec which places a greater emphasis on high-quality music reproduction."

PKG_IS_ADDON="no"
PKG_AUTORECONF="yes"

PKG_CONFIGURE_OPTS_TARGET="--disable-shared --enable-static"

post_makeinstall_target() {
  rm -rf $INSTALL/usr/bin
}
