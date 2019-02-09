# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="poppler"
PKG_VERSION="0.73.0"
PKG_SHA256="e44b5543903128884ba4538c2a97d3bcc8889e97ffacc4636112101f0238db03"
PKG_REV="4"
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

POPPLER_PREFIX="/storage/.kodi/addons/tools.poppler"

PKG_CMAKE_OPTS_TARGET="-DCMAKE_BUILD_TYPE=Release \
                       -DCMAKE_INSTALL_PREFIX:PATH=$POPPLER_PREFIX \
                       -DENABLE_UNSTABLE_API_ABI_HEADERS=ON \
                       -DENABLE_QT5=OFF \
                       -DENABLE_GTK_DOC=OFF"

addon() {
  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/data

    cp -p $PKG_BUILD/.install_pkg$POPPLER_PREFIX/bin/pdfdetach $ADDON_BUILD/$PKG_ADDON_ID/data/pdfdetach.bin
    cp -p $PKG_BUILD/.install_pkg$POPPLER_PREFIX/bin/pdffonts $ADDON_BUILD/$PKG_ADDON_ID/data/pdffonts.bin
    cp -p $PKG_BUILD/.install_pkg$POPPLER_PREFIX/bin/pdfimages $ADDON_BUILD/$PKG_ADDON_ID/data/pdfimages.bin
    cp -p $PKG_BUILD/.install_pkg$POPPLER_PREFIX/bin/pdfinfo $ADDON_BUILD/$PKG_ADDON_ID/data/pdfinfo.bin
    cp -p $PKG_BUILD/.install_pkg$POPPLER_PREFIX/bin/pdfseparate $ADDON_BUILD/$PKG_ADDON_ID/data/pdfseparate.bin
    cp -p $PKG_BUILD/.install_pkg$POPPLER_PREFIX/bin/pdfsig $ADDON_BUILD/$PKG_ADDON_ID/data/pdfsig.bin
    cp -p $PKG_BUILD/.install_pkg$POPPLER_PREFIX/bin/pdftocairo $ADDON_BUILD/$PKG_ADDON_ID/data/pdftocairo.bin
    cp -p $PKG_BUILD/.install_pkg$POPPLER_PREFIX/bin/pdftohtml $ADDON_BUILD/$PKG_ADDON_ID/data/pdftohtml.bin
    cp -p $PKG_BUILD/.install_pkg$POPPLER_PREFIX/bin/pdftoppm $ADDON_BUILD/$PKG_ADDON_ID/data/pdftoppm.bin
    cp -p $PKG_BUILD/.install_pkg$POPPLER_PREFIX/bin/pdftops $ADDON_BUILD/$PKG_ADDON_ID/data/pdftops.bin
    cp -p $PKG_BUILD/.install_pkg$POPPLER_PREFIX/bin/pdftotext $ADDON_BUILD/$PKG_ADDON_ID/data/pdftotext.bin
    cp -p $PKG_BUILD/.install_pkg$POPPLER_PREFIX/bin/pdfunite $ADDON_BUILD/$PKG_ADDON_ID/data/pdfunite.bin

    cp -p $(get_build_dir openjpeg2)/.install_pkg/usr/bin/opj_compress $ADDON_BUILD/$PKG_ADDON_ID/data/opj_compress.bin
    cp -p $(get_build_dir openjpeg2)/.install_pkg/usr/bin/opj_decompress $ADDON_BUILD/$PKG_ADDON_ID/data/opj_decompress.bin
    cp -p $(get_build_dir openjpeg2)/.install_pkg/usr/bin/opj_dump $ADDON_BUILD/$PKG_ADDON_ID/data/opj_dump.bin

    cp -p $(get_build_dir lcms2)/.install_pkg/usr/bin/jpgicc $ADDON_BUILD/$PKG_ADDON_ID/data/jpgicc.bin
    cp -p $(get_build_dir lcms2)/.install_pkg/usr/bin/linkicc $ADDON_BUILD/$PKG_ADDON_ID/data/linkicc.bin
    cp -p $(get_build_dir lcms2)/.install_pkg/usr/bin/psicc $ADDON_BUILD/$PKG_ADDON_ID/data/psicc.bin
    cp -p $(get_build_dir lcms2)/.install_pkg/usr/bin/tificc $ADDON_BUILD/$PKG_ADDON_ID/data/tificc.bin
    cp -p $(get_build_dir lcms2)/.install_pkg/usr/bin/transicc $ADDON_BUILD/$PKG_ADDON_ID/data/transicc.bin

  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/lib
    cp -P $PKG_BUILD/.install_pkg$POPPLER_PREFIX/lib/libpoppler.so.84.0.0 $ADDON_BUILD/$PKG_ADDON_ID/lib/libpoppler.so.84
    cp -P $PKG_BUILD/.install_pkg$POPPLER_PREFIX/lib/libpoppler-glib.so.8.12.0 $ADDON_BUILD/$PKG_ADDON_ID/lib/libpoppler-glib.so.8
    cp -P $PKG_BUILD/.install_pkg$POPPLER_PREFIX/lib/libpoppler-cpp.so.0.6.0 $ADDON_BUILD/$PKG_ADDON_ID/lib/libpoppler-cpp.so.0
    cp -P $(get_build_dir openjpeg2)/.install_pkg/usr/lib/libopenjp2.so.2.3.0 $ADDON_BUILD/$PKG_ADDON_ID/lib/libopenjp2.so.7
    cp -P $(get_build_dir lcms2)/.install_pkg/usr/lib/liblcms2.so.2.0.8 $ADDON_BUILD/$PKG_ADDON_ID/lib/liblcms2.so.2
    cp -P $(get_build_dir tiff)/.install_pkg/usr/lib/libtiff.so.5.4.0 $ADDON_BUILD/$PKG_ADDON_ID/lib/libtiff.so.5
    cp -P $(get_build_dir tiff)/.install_pkg/usr/lib/libtiffxx.so.5.4.0 $ADDON_BUILD/$PKG_ADDON_ID/lib/libtiffxx.so.5

  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/share/poppler
    cp -PR $(get_build_dir poppler-data)/cidToUnicode $ADDON_BUILD/$PKG_ADDON_ID/share/poppler
    cp -PR $(get_build_dir poppler-data)/nameToUnicode $ADDON_BUILD/$PKG_ADDON_ID/share/poppler
    cp -PR $(get_build_dir poppler-data)/unicodeMap $ADDON_BUILD/$PKG_ADDON_ID/share/poppler
    cp -PR $(get_build_dir poppler-data)/cMap $ADDON_BUILD/$PKG_ADDON_ID/share/poppler
}
