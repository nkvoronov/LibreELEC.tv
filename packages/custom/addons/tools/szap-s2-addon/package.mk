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

PKG_NAME="szap-s2-addon"
PKG_VERSION="5.10"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://bitbucket.org/CrazyCat/szap-s2"
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain szap-s2"
PKG_PRIORITY="optional"
PKG_SECTION="tools"
PKG_SHORTDESC="szap-s2"
PKG_LONGDESC="szap-s2"

PKG_IS_ADDON="yes"
PKG_ADDON_TYPE="xbmc.python.script"
PKG_AUTORECONF="no"
PKG_ADDON_REPOVERSION="8.0"

make_target() {
  : # nothing to make here
}

makeinstall_target() {
  : # nothing to install here
}

addon() {
  SZAPS2_DIR=$(get_build_dir szap-s2)

  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/bin
    cp -PR $SZAPS2_DIR/szap-s2 $ADDON_BUILD/$PKG_ADDON_ID/bin
    cp -PR $SZAPS2_DIR/tzap-t2 $ADDON_BUILD/$PKG_ADDON_ID/bin

}
