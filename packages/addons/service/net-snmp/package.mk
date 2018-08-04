# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="net-snmp"
PKG_VERSION="5.7.3"
PKG_SHA256="12ef89613c7707dc96d13335f153c1921efc9d61d3708ef09f3fc4a7014fb4f0"
PKG_REV="105"
PKG_ARCH="any"
PKG_LICENSE="BSD"
PKG_SITE="http://www.net-snmp.org"
PKG_URL="http://sourceforge.net/projects/net-snmp/files/$PKG_NAME/$PKG_VERSION/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain libnl openssl"
PKG_SECTION="service"
PKG_SHORTDESC="Simple Network Management Protocol utilities."
PKG_LONGDESC="Simple Network Management Protocol (SNMP) is a widely used protocol for monitoring the health and welfare of network equipment."
PKG_TOOLCHAIN="autotools"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="Net-SNMP"
PKG_ADDON_TYPE="xbmc.service"

PKG_CONFIGURE_OPTS_TARGET="--with-defaults \
        --disable-applications \
        --disable-manuals \
        --disable-debugging \
        --disable-deprecated \
        --disable-snmptrapd-subagent \
        --disable-scripts \
        --enable-static=yes \
        --enable-shared=no \
        --with-nl \
        --with-logfile=/storage/.kodi/userdata/addon_data/${PKG_ADDON_ID} \
        --with-persistent-directory=/storage/.kodi/userdata/addon_data/${PKG_ADDON_ID} \
        --sysconfdir=/storage/.kodi/userdata/addon_data/${PKG_ADDON_ID} \
        --prefix=/storage/.kodi/addons/${PKG_ADDON_ID} \
        --exec-prefix=/storage/.kodi/addons/${PKG_ADDON_ID} \
        --datarootdir=/storage/.kodi/userdata/addon_data/${PKG_ADDON_ID}/share \
        --bindir=/storage/.kodi/addons/${PKG_ADDON_ID}/bin \
        --sbindir=/storage/.kodi/addons/${PKG_ADDON_ID}/bin \
        --libdir=/storage/.kodi/addons/${PKG_ADDON_ID}/lib \
        --disable-embedded-perl \
        --with-sysroot=$SYSROOT_PREFIX"

make_target() {
  make
}

makeinstall_target() {
  make install INSTALL_PREFIX=$PKG_BUILD/.$TARGET_NAME
}

addon() {
  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/lib
  cp -r $PKG_BUILD/.$TARGET_NAME/storage/.kodi/addons/${PKG_ADDON_ID}/bin $PKG_BUILD/.$TARGET_NAME/storage/.kodi/userdata/addon_data/${PKG_ADDON_ID}/share $ADDON_BUILD/$PKG_ADDON_ID/
}
