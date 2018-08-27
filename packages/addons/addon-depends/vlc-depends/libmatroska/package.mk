# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="libmatroska"
PKG_VERSION="1.4.8"
#PKG_SHA256="9ba8b04bdb13f7860a2041768ac83b47b397a36549c71c530b94028a3cfd5b51"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.matroska.org"
PKG_URL="https://dl.matroska.org/downloads/libmatroska/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="toolchain libebml"
PKG_SECTION="multimedia"
PKG_SHORTDESC="Matroska is aiming to become the standard of Multimedia Container Formats one day. It is based on EBML (Extensible Binary Meta Language), a kind of binary version of XML. This way the significant advantages in terms of future format extensibility are gained without breaking file support in old parsers."
PKG_LONGDESC="Matroska is aiming to become the standard of Multimedia Container Formats one day. It is based on EBML (Extensible Binary Meta Language), a kind of binary version of XML. This way the significant advantages in terms of future format extensibility are gained without breaking file support in old parsers."

PKG_CONFIGURE_OPTS_TARGET="--prefix=/usr --disable-static"
