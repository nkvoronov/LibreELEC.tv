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

PKG_NAME="docker-service"
PKG_VERSION="18.03.0"
PKG_ARCH="any"
PKG_LICENSE="ASL"
PKG_SITE="http://www.docker.com/"
PKG_URL="https://download.docker.com/linux/ubuntu/dists/xenial/pool/stable/amd64/docker-ce_${PKG_VERSION}~ce-0~ubuntu_amd64.deb"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="service"
PKG_SHORTDESC="Docker is an open-source engine that automates the deployment of any application as a lightweight, portable, self-sufficient container that will run virtually anywhere."
PKG_LONGDESC="Docker containers can encapsulate any payload, and will run consistently on and between virtually any server. The same container that a developer builds and tests on a laptop will run at scale, in production*, on VMs, bare-metal servers, OpenStack clusters, public instances, or combinations of the above."

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

make_target() {
  : # nothing to do here
}

makeinstall_target() {
  : # nothing to do here
}

post_install() {

  mkdir -p $INSTALL/usr/bin
    cp -P $PKG_BUILD/usr/bin/* $INSTALL/usr/bin

  mkdir -p $INSTALL/usr/config/docker/etc
  mkdir -p $INSTALL/usr/config/docker/data
    cp -p $PKG_DIR/config/* $INSTALL/usr/config/docker/etc

  mkdir -p $INSTALL/usr/lib/docker
    cp -p $PKG_DIR/lib/* $INSTALL/usr/lib/docker

  ln -sf /storage/.config/docker/etc $INSTALL/etc/docker
  mkdir -p $INSTALL/var/lib/docker
  ln -sf /storage/.config/docker/data $INSTALL/var/lib/docker

  mkdir -p $INSTALL/usr/lib/udev/rules.d
    cp -PR $PKG_BUILD/lib/udev/rules.d/*.rules $INSTALL/usr/lib/udev/rules.d

  enable_service docker.service
}