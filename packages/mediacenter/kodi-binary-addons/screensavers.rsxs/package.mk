# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="screensavers.rsxs"
PKG_VERSION="7cb648507440d87948dec10d5bfdab3b722d37fe"
PKG_SHA256="22ff3f0ca9679c59ce1a90b98d918dd10a8012b789729b2e44c04d4ce8c86ad8"
PKG_REV="3"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.kodi.tv"
PKG_URL="https://github.com/xbmc/screensavers.rsxs/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain kodi-platform libXt libXmu"
PKG_SECTION=""
PKG_SHORTDESC="screensavers.rsxs"
PKG_LONGDESC="screensavers.rsxs"

PKG_IS_ADDON="yes"
PKG_ADDON_TYPE="xbmc.ui.screensaver"

if [ "$OPENGL" = "no" ] ; then
  exit 0
fi

addon() {
  for _ADDON in $PKG_BUILD/.install_pkg/usr/share/$MEDIACENTER/addons/* ; do
    _ADDON_ID=$(basename $_ADDON)

    install_binary_addon $_ADDON_ID

    MULTI_ADDONS="$MULTI_ADDONS $_ADDON_ID"
  done

  # export MULTI_ADDONS so create_addon knows multiple addons
  # were installed in $ADDON_BUILD/
  export MULTI_ADDONS="$MULTI_ADDONS"
}
