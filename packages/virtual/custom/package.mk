# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2021 Stephan Raue (stephan@openelec.tv)

PKG_NAME="custom"
PKG_VERSION=""
PKG_LICENSE="GPL"
PKG_SITE=""
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="virtual"
PKG_LONGDESC="custom is a Metapackage for installing custom package"

if [ "${KODI_REPOSITORY_YELLOWDRAGON}" = "yes" ]; then
  PKG_DEPENDS_TARGET+=" repository.yellowdragon repository.yellowdragon.libreelec"
# script.libreelec.devupdate"
fi

if [ "${LCDPROC_SERVICE}" = "yes" ]; then
  PKG_DEPENDS_TARGET+=" lcdproc"
fi

if [ "${TRANSMISSION_SERVICE}" = "yes" ]; then
  PKG_DEPENDS_TARGET+=" transmission"
fi

if [ "${OSCAM_SERVICE}" = "yes" ]; then
  PKG_DEPENDS_TARGET+=" ccid oscam"
fi

if [ "${TVHEADEND_SERVICE}" = "yes" ]; then
  PKG_DEPENDS_TARGET+=" tvheadend"
fi

if [ "${LIBXCB_EXT}" = "yes" ]; then
  PKG_DEPENDS_TARGET+=" libxcb xcb-proto xcb-util xcb-util-keysyms xcb-util-wm xcb-util-renderutil xcb-util-image"
fi

if [ "${SYS_TOOLS_ENABLED}" = "yes" ]; then
  PKG_DEPENDS_TARGET+=" tools-system"
fi

if [ "${DVB_TOOLS_ENABLED}" = "yes" ]; then
  PKG_DEPENDS_TARGET+=" tools-dvb"
fi

post_install() {
  if [ "${DOCKER_FIX}" = "yes" ]; then
    ln -sf /storage/.kodi/userdata/addon_data/service.system.docker/config ${INSTALL}/etc/docker
  fi
}

