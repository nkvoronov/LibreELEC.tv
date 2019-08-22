# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="pvr.iptvsimple"
PKG_VERSION="4ae8cc43e64c52fbe057011080db0c33f76d0a41"
PKG_SHA256="5801e7b4c92260e52404de93057d1c39ba8a4fbf8ff042a4d87ee12a95c95a34"
PKG_REV="5"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.kodi.tv"
PKG_URL="https://github.com/kodi-pvr/pvr.iptvsimple/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain kodi-platform rapidxml zlib"
PKG_SECTION=""
PKG_SHORTDESC="pvr.iptvsimple"
PKG_LONGDESC="pvr.iptvsimple"

PKG_IS_ADDON="yes"
PKG_ADDON_TYPE="xbmc.pvrclient"

PKG_CMAKE_OPTS_TARGET="-DRAPIDXML_INCLUDE_DIRS=$(get_build_dir rapidxml)"
