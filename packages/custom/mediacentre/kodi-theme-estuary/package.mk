################################################################################
#      This file is part of OpenELEC - http://www.openelec.tv
#      Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
#
#  This Program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2, or (at your option)
#  any later version.
#
#  This Program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with OpenELEC.tv; see the file COPYING.  If not, write to
#  the Free Software Foundation, 51 Franklin Street, Suite 500, Boston, MA 02110, USA.
#  http://www.gnu.org/copyleft/gpl.html
################################################################################

PKG_NAME="kodi-theme-estuary"
PKG_VERSION="eac7b57"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE=""
PKG_GIT_URL="https://github.com/nkvoronov/skin.estuary-jarvis.git"
PKG_GIT_BRANCH="jarvis"
PKG_KEEP_CHECKOUT="yes"
PKG_DEPENDS_TARGET="toolchain Python kodi kodi-addon-pvrfavourites"
PKG_PRIORITY="optional"
PKG_SECTION="custom/mediacentre"
PKG_SHORTDESC="kodi-theme-Confluence-plood: KODI Mediacenter additional theme"
PKG_LONGDESC="KODI Media Center (which was formerly named Xbox Media Center) is a free and open source cross-platform media player and home entertainment system software with a 10-foot user interface designed for the living-room TV. Its graphical user interface allows the user to easily manage video, photos, podcasts, and music from a computer, optical disk, local network, and the internet using a remote control."

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

make_target() {
  : # nothing
}

makeinstall_target() {
  : # nothing
}

post_install() {
  mkdir -p $INSTALL/usr/share/kodi/addons/skin.estuary-jarvis
    cp -PR $PKG_BUILD/skin.estuary-jarvis/* $INSTALL/usr/share/kodi/addons/skin.estuary-jarvis

  rm -fR $INSTALL/usr/share/kodi/addons/skin.estuary-jarvis/1080i/service-OpenELEC-Settings-getPasskey.xml
  rm -fR $INSTALL/usr/share/kodi/addons/skin.estuary-jarvis/1080i/service-OpenELEC-Settings-mainWindow.xml
  rm -fR $INSTALL/usr/share/kodi/addons/skin.estuary-jarvis/1080i/service-OpenELEC-Settings-wizard.xml
}
