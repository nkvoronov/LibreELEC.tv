# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="tinc"
PKG_VERSION="1.1pre16"
PKG_SHA256="14c66389dc68cac61b8719d808ba840a5d756929fd255ba28d91c22464164005"
PKG_REV="104"
PKG_ARCH="any"
PKG_LICENSE="GPLv2"
PKG_SITE="http://www.tinc-vpn.org/"
PKG_URL="https://github.com/gsliepen/tinc/archive/release-$PKG_VERSION.tar.gz"
PKG_SOURCE_DIR="tinc-release-$PKG_VERSION"
PKG_DEPENDS_TARGET="toolchain lzo miniupnpc ncurses openssl readline zlib"
PKG_SECTION="service/system"
PKG_SHORTDESC="tinc: a Virtual Private Network daemon"
PKG_LONGDESC="tinc ($PKG_VERSION) is a Virtual Private Network (VPN) daemon that uses tunnelling and encryption to create a secure private network between hosts on the Internet. Because the VPN appears to the IP level network code as a normal network device, there is no need to adapt any existing software. This allows VPN sites to share information with each other over the Internet without exposing any information to others."
PKG_TOOLCHAIN="autotools"
PKG_BUILD_FLAGS="+pic"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="tinc"
PKG_ADDON_TYPE="xbmc.service"
PKG_MAINTAINER="Anton Voyl (awiouy)"

PKG_CONFIGURE_OPTS_TARGET="--enable-miniupnpc \
                           --sysconfdir=/run"
PKG_MAKE_OPTS_TARGET="SUBDIRS=src"
PKG_MAKEINSTALL_OPTS_TARGET="SUBDIRS=src"

make_target() {
  :
}

addon() {
  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/bin
  cp $PKG_BUILD/.install_pkg/usr/sbin/* \
     $ADDON_BUILD/$PKG_ADDON_ID/bin
}
