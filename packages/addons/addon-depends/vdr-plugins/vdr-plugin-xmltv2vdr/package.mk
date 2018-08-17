################################################################################
#      This file is part of OpenELEC - http://www.openelec.tv
#      Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
#
#  OpenELEC is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 2 of the License, or
#  (at your option) any later version.
#
#  OpenELEC is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with OpenELEC.  If not, see <http://www.gnu.org/licenses/>.
################################################################################

PKG_NAME="vdr-plugin-xmltv2vdr"
PKG_VERSION="ec7bd92"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://projects.vdr-developer.org/projects/plg-xmltv2vdr"
PKG_URL="https://github.com/vdr-projects/vdr-plugin-xmltv2vdr.git"
PKG_TYPE="git"
PKG_DEPENDS_TARGET="toolchain vdr sqlite curl libzip libxml2 libxslt enca pcre"
PKG_SECTION="multimedia"
PKG_SHORTDESC="Plugin for VDR to add epg info from epg sources into vdr."
PKG_LONGDESC="Plugin for VDR to add epg info from epg sources into vdr. This plugin for the Linux Video Disc Recorder VDR will add epg info  from epg sources into vdr."

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

pre_configure_target() {
  export CFLAGS="$CFLAGS -fPIC"
  export CXXFLAGS="$CXXFLAGS -fPIC -Wno-narrowing"
  export LDFLAGS="$LDFLAGS -fPIC"
  export LIBS="-L$SYSROOT_PREFIX/usr/lib/iconv -lpcre -lpcrecpp"
}

make_target() {
  VDR_DIR=$(get_build_dir vdr)
  export PKG_CONFIG_PATH=$VDR_DIR:$PKG_CONFIG_PATH
  export CPLUS_INCLUDE_PATH=$VDR_DIR/include

  make VDRDIR=$VDR_DIR \
    LIBDIR="." \
    LOCDIR="./locale" \
    all
}

post_make_target() {
  cd dist/epgdata2xmltv
  make -j1
  cd -
  $STRIP dist/epgdata2xmltv/epgdata2xmltv

  VDR_DIR=$(get_build_dir vdr)
  VDR_APIVERSION=`sed -ne '/define APIVERSION/s/^.*"\(.*\)".*$/\1/p' $VDR_DIR/config.h`
  LIB_NAME=lib${PKG_NAME/-plugin/}

  cp --remove-destination $PKG_BUILD/${LIB_NAME}.so $PKG_BUILD/${LIB_NAME}.so.${VDR_APIVERSION}
  $STRIP libvdr-*.so*
}

makeinstall_target() {
  : # installation not needed, done by create-addon script
}
