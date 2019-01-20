# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="dockers"
PKG_VERSION="18.09.1"
PKG_SHA256="c9959e42b637fb7362899ac1d1aeef2a966fa0ea85631da91f4c4a7a9ec29644"
PKG_REV="131"
PKG_LICENSE="ASL"
PKG_SITE="http://www.docker.com/"
PKG_URL="https://download.docker.com/linux/static/stable/x86_64/docker-$PKG_VERSION.tgz"
PKG_SOURCE_DIR="docker"
PKG_DEPENDS_TARGET="toolchain systemd"
PKG_SECTION="service/system"
PKG_SHORTDESC="Docker is an open-source engine that automates the deployment of any application as a lightweight, portable, self-sufficient container that will run virtually anywhere."
PKG_LONGDESC="Docker containers can encapsulate any payload, and will run consistently on and between virtually any server. The same container that a developer builds and tests on a laptop will run at scale, in production*, on VMs, bare-metal servers, OpenStack clusters, public instances, or combinations of the above."
PKG_TOOLCHAIN="manual"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="Docker stable"
PKG_ADDON_TYPE="xbmc.service"

addon() {
  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/bin
    cp -P $PKG_BUILD/* $ADDON_BUILD/$PKG_ADDON_ID/bin
}
