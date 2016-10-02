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

PKG_NAME="kodi-theme-confluence-extented-s"
PKG_VERSION="923e94f"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/nkvoronov/skin.confluence-extented.git"
PKG_GIT_URL="https://github.com/nkvoronov/skin.confluence-extented.git"
PKG_GIT_BRANCH="krypton-s"
PKG_KEEP_CHECKOUT="no"
PKG_DEPENDS_TARGET="toolchain Python kodi kodi-addon-skinwidgets kodi-addon-pvrfavourites kodi-addon-skinshortcuts kodi-addon-skinhelperservice"
PKG_PRIORITY="optional"
PKG_SECTION="mediacentre"
PKG_SHORTDESC="kodi-theme-Confluence-extented-s: KODI Mediacenter additional theme"
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
  mkdir -p $INSTALL/usr/config/skin.confluence-extented-s-krypton
    cp -pR $PKG_DIR/config/* $INSTALL/usr/config/skin.confluence-extented-s-krypton
  mkdir -p $INSTALL/usr/share/kodi/addons/skin.confluence-extented-s-krypton
    cp -PR $PKG_BUILD/skin.confluence-extented-s-krypton/* $INSTALL/usr/share/kodi/addons/skin.confluence-extented-s-krypton
    rm -f $INSTALL/usr/share/kodi/addons/skin.confluence-extented-s-krypton/720p/script-skinshortcuts-includes.xml
    ln -sf /storage/.config/skin.confluence-extented-s-krypton/script-skinshortcuts-includes.xml $INSTALL/usr/share/kodi/addons/skin.confluence-extented-s-krypton/720p/script-skinshortcuts-includes.xml
}
