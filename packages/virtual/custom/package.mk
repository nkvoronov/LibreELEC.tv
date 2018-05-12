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

PKG_NAME="custom"
PKG_VERSION=""
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE=""
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="virtual"
PKG_SHORTDESC="custom: Metapackage for installing custom package"
PKG_LONGDESC="custom is a Metapackage for installing custom package"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

if [ "$KODI_REPOSITORY_YELLOWDRAGON" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET repository.yellowdragon repository.yellowdragon.libreelec script.libreelec.devupdate"
fi

if [ "$TRANSMISSION_SERVICE" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET transmission"
fi

if [ "$OSCAM_SERVICE" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET ccid oscam"
fi

if [ "$TVHEADEND_SERVICE" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET tvheadend"
fi

if [ "$VDR_SERVICE" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET vdr-service"
fi

if [ "$SYS_TOOLS_ENABLED" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET tools-system"
fi

if [ "$DVB_TOOLS_ENABLED" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET tools-dvb"
fi

if [ "$PERL_SUPPORT" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET perl"
fi

post_install() {
  if [ "$DOCKER_FIX" = yes ]; then
    ln -sf /storage/.kodi/userdata/addon_data/service.system.docker/config $INSTALL/etc/docker
  fi
}

