# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2017 Lukas Rusak (lrusak@libreelec.tv)
# Copyright (C) 2017-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="docker"
if [ "${DOCKER_STABLE}" = "yes" ]; then
  PKG_VERSION="20.10.24"
  PKG_SHA256="ab91092320a87691a1eaf0225b48585db9c69cff0ed4b0f569f744ff765515e3"
  PKG_REV="166"
  PKG_URL="https://download.docker.com/linux/static/stable/x86_64/${PKG_NAME}-${PKG_VERSION}.tgz"
  PKG_SOURCE_DIR="docker"
  PKG_BUILD_FLAGS="-strip"
else
  PKG_REV="0"
fi
PKG_ARCH="any"
PKG_LICENSE="ASL"
PKG_SITE="http://www.docker.com/"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="service/system"
PKG_SHORTDESC="Docker is an open-source engine that automates the deployment of any application as a lightweight, portable, self-sufficient container that will run virtually anywhere."
PKG_LONGDESC="Docker containers can encapsulate any payload, and will run consistently on and between virtually any server. The same container that a developer builds and tests on a laptop will run at scale, in production*, on VMs, bare-metal servers, OpenStack clusters, public instances, or combinations of the above."
PKG_TOOLCHAIN="manual"

if [ "${DOCKER_STABLE}" != "yes" ]; then
  PKG_DEPENDS_TARGET+=" cli containerd moby runc tini"
fi

PKG_IS_ADDON="yes"
if [ "${DOCKER_STABLE}" = "yes" ]; then
  PKG_ADDON_NAME="Docker stable"
else
  PKG_ADDON_NAME="Docker"
fi
PKG_ADDON_TYPE="xbmc.service"

addon() {
  mkdir -p ${ADDON_BUILD}/${PKG_ADDON_ID}/bin
  if [ "${DOCKER_STABLE}" = "yes" ]; then
    cp -P ${PKG_BUILD}/* ${ADDON_BUILD}/${PKG_ADDON_ID}/bin
  else
    # cli
    cp -P $(get_build_dir cli)/bin/docker ${ADDON_BUILD}/${PKG_ADDON_ID}/bin

    # moby
    cp -P $(get_build_dir moby)/bin/dockerd ${ADDON_BUILD}/${PKG_ADDON_ID}/bin
    cp -P $(get_build_dir moby)/bin/docker-proxy ${ADDON_BUILD}/${PKG_ADDON_ID}/bin/docker-proxy

    # containerd
    cp -P $(get_build_dir containerd)/bin/containerd ${ADDON_BUILD}/${PKG_ADDON_ID}/bin/containerd
    cp -P $(get_build_dir containerd)/bin/containerd-shim ${ADDON_BUILD}/${PKG_ADDON_ID}/bin/containerd-shim
    cp -P $(get_build_dir containerd)/bin/containerd-shim-runc-v2 ${ADDON_BUILD}/${PKG_ADDON_ID}/bin/containerd-shim-runc-v2

    # runc
    cp -P $(get_build_dir runc)/bin/runc ${ADDON_BUILD}/${PKG_ADDON_ID}/bin/runc

    # tini
    cp -P $(get_build_dir tini)/.${TARGET_NAME}/tini-static ${ADDON_BUILD}/${PKG_ADDON_ID}/bin/docker-init
  fi
}

post_install_addon() {
  if [ "${DOCKER_STABLE}" != "yes" ]; then
    sed -e "s/@DISTRO_PKG_SETTINGS_ID@/${DISTRO_PKG_SETTINGS_ID}/g" -i "${INSTALL}/default.py"
  fi
}

