# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="poppler"
PKG_VERSION="0.73.0"
PKG_SHA256="e44b5543903128884ba4538c2a97d3bcc8889e97ffacc4636112101f0238db03"
PKG_REV="1"
PKG_LICENSE="GPL"
PKG_SITE="https://poppler.freedesktop.org/"
PKG_URL="https://poppler.freedesktop.org/${PKG_NAME}-${PKG_VERSION}.tar.xz"
PKG_DEPENDS_TARGET="toolchain poppler-data fontconfig libjpeg-turbo openjpeg2 Python3"
PKG_SECTION="tools"
PKG_SHORTDESC="Poppler is a PDF rendering library based on the xpdf-3.0 code base."
PKG_LONGDESC="Poppler is a PDF rendering library based on the xpdf-3.0 code base."

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="poppler"
PKG_ADDON_TYPE="xbmc.python.script"

PKG_CMAKE_OPTS_TARGET="-DCMAKE_BUILD_TYPE=Release \
                       -DENABLE_UNSTABLE_API_ABI_HEADERS=ON \
                       -DENABLE_QT5=OFF \
                       -DENABLE_GTK_DOC=OFF"

addon() {
  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/binary
    cp -PR $PKG_BUILD/.install_pkg/usr/bin/* $ADDON_BUILD/$PKG_ADDON_ID/binary
    cp -PR $(get_build_dir openjpeg2)/.install_pkg/usr/bin/* $ADDON_BUILD/$PKG_ADDON_ID/binary
    cp -PR $(get_build_dir lcms2)/.install_pkg/usr/bin/* $ADDON_BUILD/$PKG_ADDON_ID/binary

  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/lib
    cp -P $PKG_BUILD/.install_pkg/usr/lib/libpoppler.so.84.0.0 $ADDON_BUILD/$PKG_ADDON_ID/lib/libpoppler.so.84
    cp -P $PKG_BUILD/.install_pkg/usr/lib/libpoppler-glib.so.8.12.0 $ADDON_BUILD/$PKG_ADDON_ID/lib/libpoppler-glib.so.8
    cp -P $PKG_BUILD/.install_pkg/usr/lib/libpoppler-cpp.so.0.6.0 $ADDON_BUILD/$PKG_ADDON_ID/lib/libpoppler-cpp.so.0
    cp -P $(get_build_dir openjpeg2)/.install_pkg/usr/lib/libopenjp2.so.2.3.0 $ADDON_BUILD/$PKG_ADDON_ID/lib/libopenjp2.so.7
    cp -P $(get_build_dir lcms2)/.install_pkg/usr/lib/liblcms2.so.2.0.8 $ADDON_BUILD/$PKG_ADDON_ID/lib/liblcms2.so.2
    cp -P $(get_build_dir tiff)/.install_pkg/usr/lib/libtiff.so.5.4.0 $ADDON_BUILD/$PKG_ADDON_ID/lib/libtiff.so.5
    cp -P $(get_build_dir tiff)/.install_pkg/usr/lib/libtiffxx.so.5.4.0 $ADDON_BUILD/$PKG_ADDON_ID/lib/libtiffxx.so.5

  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/share
    cp -PR $(get_build_dir poppler-data)/cidToUnicode $ADDON_BUILD/$PKG_ADDON_ID/share
    cp -PR $(get_build_dir poppler-data)/nameToUnicode $ADDON_BUILD/$PKG_ADDON_ID/share
    cp -PR $(get_build_dir poppler-data)/unicodeMap $ADDON_BUILD/$PKG_ADDON_ID/share
    cp -PR $(get_build_dir poppler-data)/cMap $ADDON_BUILD/$PKG_ADDON_ID/share
}
