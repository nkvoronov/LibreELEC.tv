# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="vdr24"
PKG_VERSION="2.4.0"
PKG_REV="159"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.openelec.tv"
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain vdr"
PKG_SECTION="service"
PKG_SHORTDESC="vdr: A powerful DVB TV application"
PKG_LONGDESC="This project describes how to build your own digital satellite receiver and video disk recorder. It is based mainly on the DVB-S digital satellite receiver card, which used to be available from Fujitsu Siemens and the driver software developed by the LinuxTV project."
PKG_TOOLCHAIN="manual"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="VDR"
PKG_ADDON_TYPE="xbmc.service"

ENABLE_VDR_PLUGIN_CHANNELLISTS="yes"
ENABLE_VDR_PLUGIN_DDCI2="yes"
ENABLE_VDR_PLUGIN_DUMMYDEVICE="yes"
ENABLE_VDR_PLUGIN_DVBAPI="yes"
ENABLE_VDR_PLUGIN_DYNAMITE="yes"
ENABLE_VDR_PLUGIN_EPGFIXER="yes"
ENABLE_VDR_PLUGIN_EPGSEARCH="yes"
ENABLE_VDR_PLUGIN_FAVORITES="yes"
ENABLE_VDR_PLUGIN_FEMON="yes"
ENABLE_VDR_PLUGIN_FILEBROWSER="yes"
ENABLE_VDR_PLUGIN_IMONLCD="yes"
ENABLE_VDR_PLUGIN_IPTV="yes"
ENABLE_VDR_PLUGIN_LCDPROC="yes"
ENABLE_VDR_PLUGIN_LIVE="yes"
ENABLE_VDR_PLUGIN_MENUORG="no"
ENABLE_VDR_PLUGIN_PIN="yes"
ENABLE_VDR_PLUGIN_RESTFULAPI="yes"
ENABLE_VDR_PLUGIN_ROBOTV="yes"
ENABLE_VDR_PLUGIN_SATIP="yes"
ENABLE_VDR_PLUGIN_SKINDESIGNER="no"
ENABLE_VDR_PLUGIN_SKINFLAT="yes"
ENABLE_VDR_PLUGIN_SKINFLATPLUS="yes"
ENABLE_VDR_PLUGIN_SKINNOPACITY="yes"
ENABLE_VDR_PLUGIN_SLEEPTIMER="yes"
ENABLE_VDR_PLUGIN_SOFTHDDEVICE="no"
ENABLE_VDR_PLUGIN_STREAMDEV="yes"
ENABLE_VDR_PLUGIN_SYSTEMINFO="yes"
ENABLE_VDR_PLUGIN_TEXT2SKIN="yes"
ENABLE_VDR_PLUGIN_TVGUIDENG="yes"
ENABLE_VDR_PLUGIN_TVSCRAPER="yes"
ENABLE_VDR_PLUGIN_VNSISERVER="yes"
ENABLE_VDR_PLUGIN_WEATHERFORECAST="no"
ENABLE_VDR_PLUGIN_WIRBELSCAN="yes"
ENABLE_VDR_PLUGIN_XINELIBOUTPUT="yes"
ENABLE_VDR_PLUGIN_XMLTV2VDR="yes"

if [ "$ENABLE_VDR_PLUGIN_CHANNELLISTS" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET vdr-plugin-channellists"
fi

if [ "$ENABLE_VDR_PLUGIN_DDCI2" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET vdr-plugin-ddci2"
fi

if [ "$ENABLE_VDR_PLUGIN_DUMMYDEVICE" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET vdr-plugin-dummydevice"
fi

if [ "$ENABLE_VDR_PLUGIN_DVBAPI" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET vdr-plugin-dvbapi"
fi

if [ "$ENABLE_VDR_PLUGIN_DYNAMITE" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET vdr-plugin-dynamite"
fi

if [ "$ENABLE_VDR_PLUGIN_EPGFIXER" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET vdr-plugin-epgfixer"
fi

if [ "$ENABLE_VDR_PLUGIN_EPGSEARCH" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET vdr-plugin-epgsearch"
fi

if [ "$ENABLE_VDR_PLUGIN_FAVORITES" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET vdr-plugin-favorites"
fi

if [ "$ENABLE_VDR_PLUGIN_FEMON" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET vdr-plugin-femon"
fi

if [ "$ENABLE_VDR_PLUGIN_FILEBROWSER" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET vdr-plugin-filebrowser"
fi

if [ "$ENABLE_VDR_PLUGIN_IMONLCD" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET vdr-plugin-imonlcd"
fi

if [ "$ENABLE_VDR_PLUGIN_IPTV" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET vdr-plugin-iptv"
fi

if [ "$ENABLE_VDR_PLUGIN_LCDPROC" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET vdr-plugin-lcdproc"
fi

if [ "$ENABLE_VDR_PLUGIN_LIVE" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET vdr-plugin-live"
fi

if [ "$ENABLE_VDR_PLUGIN_MENUORG" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET vdr-plugin-menuorg"
fi

if [ "$ENABLE_VDR_PLUGIN_PIN" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET vdr-plugin-pin"
fi

if [ "$ENABLE_VDR_PLUGIN_RESTFULAPI" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET vdr-plugin-restfulapi"
fi

if [ "$ENABLE_VDR_PLUGIN_ROBOTV" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET vdr-plugin-robotv"
fi

if [ "$ENABLE_VDR_PLUGIN_SATIP" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET vdr-plugin-satip"
fi

if [ "$ENABLE_VDR_PLUGIN_SKINDESIGNER" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET vdr-plugin-skindesigner"
fi

if [ "$ENABLE_VDR_PLUGIN_SKINFLAT" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET vdr-plugin-skinflat"
fi

if [ "$ENABLE_VDR_PLUGIN_SKINFLATPLUS" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET vdr-plugin-skinflatplus"
fi

if [ "$ENABLE_VDR_PLUGIN_SKINNOPACITY" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET vdr-plugin-skinnopacity"
fi

if [ "$ENABLE_VDR_PLUGIN_SLEEPTIMER" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET vdr-plugin-sleeptimer"
fi

if [ "$ENABLE_VDR_PLUGIN_SOFTHDDEVICE" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET vdr-plugin-softhddevice"
fi

if [ "$ENABLE_VDR_PLUGIN_STREAMDEV" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET vdr-plugin-streamdev"
fi

if [ "$ENABLE_VDR_PLUGIN_SYSTEMINFO" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET vdr-plugin-systeminfo"
fi

if [ "$ENABLE_VDR_PLUGIN_TEXT2SKIN" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET vdr-plugin-text2skin"
fi

if [ "$ENABLE_VDR_PLUGIN_TVGUIDENG" = yes -a "$ENABLE_VDR_PLUGIN_SKINDESIGNER" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET vdr-plugin-tvguideng"
fi

if [ "$ENABLE_VDR_PLUGIN_TVSCRAPER" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET vdr-plugin-tvscraper"
fi

if [ "$ENABLE_VDR_PLUGIN_VNSISERVER" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET vdr-plugin-vnsiserver"
fi

if [ "$ENABLE_VDR_PLUGIN_WEATHERFORECAST" = yes -a "$ENABLE_VDR_PLUGIN_SKINDESIGNER" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET vdr-plugin-weatherforecast"
fi

if [ "$ENABLE_VDR_PLUGIN_WIRBELSCAN" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET vdr-plugin-wirbelscan vdr-plugin-wirbelscancontrol"
fi

if [ "$ENABLE_VDR_PLUGIN_XINELIBOUTPUT" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET vdr-plugin-xineliboutput"
fi

if [ "$ENABLE_VDR_PLUGIN_XMLTV2VDR" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET vdr-plugin-xmltv2vdr"
fi

make_target() {
  : # nothing to do here
}

makeinstall_target() {
  : # nothing to do here
}

addon() {

  VDR_DIR=$(get_build_dir vdr)
  VDR_PKG=$(get_pkg_directory vdr)

  #dirs
  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/config/plugins
  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/config/themes
  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/share/locale
  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/lib
  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/lib/vdr

  #bin
  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/bin
    cp -P $VDR_DIR/vdr $ADDON_BUILD/$PKG_ADDON_ID/bin/vdr.bin
    cp -P $VDR_DIR/svdrpsend $ADDON_BUILD/$PKG_ADDON_ID/bin/svdrpsend

  #config
  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/config
    cp -PR $VDR_DIR/*.conf $ADDON_BUILD/$PKG_ADDON_ID/config
    echo '0.0.0.0/0' >> $ADDON_BUILD/$PKG_ADDON_ID/config/svdrphosts.conf
    cp -PR $VDR_PKG/themes/* $ADDON_BUILD/$PKG_ADDON_ID/config/themes
    cp -PR $PKG_DIR/config/*.conf* $ADDON_BUILD/$PKG_ADDON_ID/config

  #locale
  cp -PR $VDR_DIR/locale/* $ADDON_BUILD/$PKG_ADDON_ID/share/locale

  #plugin channellists
  if [ "$ENABLE_VDR_PLUGIN_CHANNELLISTS" = yes ]; then

    VDR_PLUGIN_CHANNELLISTS_DIR=$(get_build_dir vdr-plugin-channellists)

    #config
    mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/config/plugins/channellists/scripts
      cp -PR $VDR_PLUGIN_CHANNELLISTS_DIR/scripts/* $ADDON_BUILD/$PKG_ADDON_ID/config/plugins/channellists/scripts

    #libs
    cp -PR $VDR_PLUGIN_CHANNELLISTS_DIR/libvdr*.so.* $ADDON_BUILD/$PKG_ADDON_ID/lib/vdr

    #locale
    cp -PR $VDR_PLUGIN_CHANNELLISTS_DIR/locale/* $ADDON_BUILD/$PKG_ADDON_ID/share/locale
  fi

  #plugin ddci2
  if [ "$ENABLE_VDR_PLUGIN_DDCI2" = yes ]; then

    VDR_PLUGIN_DDCI2_DIR=$(get_build_dir vdr-plugin-ddci2)

    #libs
    cp -PR $VDR_PLUGIN_DDCI2_DIR/libvdr*.so.* $ADDON_BUILD/$PKG_ADDON_ID/lib/vdr
  fi

  #plugin dummydevice
  if [ "$ENABLE_VDR_PLUGIN_DUMMYDEVICE" = yes ]; then

    VDR_PLUGIN_DUMMYDEVICE_DIR=$(get_build_dir vdr-plugin-dummydevice)

    #libs
    cp -PR $VDR_PLUGIN_DUMMYDEVICE_DIR/libvdr*.so.* $ADDON_BUILD/$PKG_ADDON_ID/lib/vdr
  fi

  #plugin dvbapi
  if [ "$ENABLE_VDR_PLUGIN_DVBAPI" = yes ]; then

    VDR_PLUGIN_DVBAPI_DIR=$(get_build_dir vdr-plugin-dvbapi)

    #libs
    cp -PR $VDR_PLUGIN_DVBAPI_DIR/libvdr*.so.* $ADDON_BUILD/$PKG_ADDON_ID/lib/vdr

    #locale
    cp -PR $VDR_PLUGIN_DVBAPI_DIR/locale/* $ADDON_BUILD/$PKG_ADDON_ID/share/locale
  fi

  #plugin dynamite
  if [ "$ENABLE_VDR_PLUGIN_DYNAMITE" = yes ]; then

    VDR_PLUGIN_DYNAMITE_DIR=$(get_build_dir vdr-plugin-dynamite)

    #libs
    cp -PR $VDR_PLUGIN_DYNAMITE_DIR/libvdr*.so.* $ADDON_BUILD/$PKG_ADDON_ID/lib/vdr

    #locale
    cp -PR $VDR_PLUGIN_DYNAMITE_DIR/locale/* $ADDON_BUILD/$PKG_ADDON_ID/share/locale
  fi

  #libs dep fo plugins
  if [ "$ENABLE_VDR_PLUGIN_EPGFIXER" = yes -o "$ENABLE_VDR_PLUGIN_LIVE" = yes ]; then

    PCRE_DIR=$(get_build_dir pcre)

    mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/lib
      cp -P $PCRE_DIR/.install_pkg/usr/lib/libpcrecpp.so.0.0.1 $ADDON_BUILD/$PKG_ADDON_ID/lib/libprcecpp.so.0
  fi

  #plugin epgfixer
  if [ "$ENABLE_VDR_PLUGIN_EPGFIXER" = yes ]; then

    VDR_PLUGIN_EPGFIXER_DIR=$(get_build_dir vdr-plugin-epgfixer)

    #libs
    cp -PR $VDR_PLUGIN_EPGFIXER_DIR/libvdr*.so.* $ADDON_BUILD/$PKG_ADDON_ID/lib/vdr

    #config
    mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/config/plugins/epgfixer
      cp -PR $VDR_PLUGIN_EPGFIXER_DIR/epgfixer/* $ADDON_BUILD/$PKG_ADDON_ID/config/plugins/epgfixer

    #locale
    cp -PR $VDR_PLUGIN_EPGFIXER_DIR/locale/* $ADDON_BUILD/$PKG_ADDON_ID/share/locale
  fi

  #plugin epgsearch
  if [ "$ENABLE_VDR_PLUGIN_EPGSEARCH" = yes ]; then

    VDR_PLUGIN_EPGSEARCH_DIR=$(get_build_dir vdr-plugin-epgsearch)

    #libs
    cp -PR $VDR_PLUGIN_EPGSEARCH_DIR/libvdr*.so.* $ADDON_BUILD/$PKG_ADDON_ID/lib/vdr

    #config
    mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/config/plugins/epgsearch
      cp -PR $VDR_PLUGIN_EPGSEARCH_DIR/conf/* $ADDON_BUILD/$PKG_ADDON_ID/config/plugins/epgsearch

    #locale
    cp -PR $VDR_PLUGIN_EPGSEARCH_DIR/locale/* $ADDON_BUILD/$PKG_ADDON_ID/share/locale
  fi

  #plugin favorites
  if [ "$ENABLE_VDR_PLUGIN_FAVORITES" = yes ]; then

    VDR_PLUGIN_FAVORITES_DIR=$(get_build_dir vdr-plugin-favorites)

    #libs
    cp -PR $VDR_PLUGIN_FAVORITES_DIR/libvdr*.so.* $ADDON_BUILD/$PKG_ADDON_ID/lib/vdr

    #locale
    cp -PR $VDR_PLUGIN_FAVORITES_DIR/locale/* $ADDON_BUILD/$PKG_ADDON_ID/share/locale
  fi

  #plugin femon
  if [ "$ENABLE_VDR_PLUGIN_FEMON" = yes ]; then

    VDR_PLUGIN_FEMON_DIR=$(get_build_dir vdr-plugin-femon)

    #libs
    cp -PR $VDR_PLUGIN_FEMON_DIR/libvdr*.so.* $ADDON_BUILD/$PKG_ADDON_ID/lib/vdr

    #locale
    cp -PR $VDR_PLUGIN_FEMON_DIR/locale/* $ADDON_BUILD/$PKG_ADDON_ID/share/locale
  fi

  #plugin filebrowser
  if [ "$ENABLE_VDR_PLUGIN_FILEBROWSER" = yes ]; then

    VDR_PLUGIN_FILEBROWSER_DIR=$(get_build_dir vdr-plugin-filebrowser)

    #libs
    cp -PR $VDR_PLUGIN_FILEBROWSER_DIR/libvdr*.so.* $ADDON_BUILD/$PKG_ADDON_ID/lib/vdr

    #config
    mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/config/plugins/filebrowser
      cp -PR $VDR_PLUGIN_FILEBROWSER_DIR/examples/filebrowser/* $ADDON_BUILD/$PKG_ADDON_ID/config/plugins/filebrowser
      cp -PR $PKG_DIR/config/plugins/filebrowser/* $ADDON_BUILD/$PKG_ADDON_ID/config/plugins/filebrowser
    mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/config/plugins/filebrowser/scripts
      cp -PR $VDR_PLUGIN_FILEBROWSER_DIR/examples/scripts/* $ADDON_BUILD/$PKG_ADDON_ID/config/plugins/filebrowser/scripts

    #locale
    cp -PR $VDR_PLUGIN_FILEBROWSER_DIR/locale/* $ADDON_BUILD/$PKG_ADDON_ID/share/locale
  fi

  #plugin imonlcd
  if [ "$ENABLE_VDR_PLUGIN_IMONLCD" = yes ]; then

    VDR_PLUGIN_IMONLCD_DIR=$(get_build_dir vdr-plugin-imonlcd)

    #libs
    cp -PR $VDR_PLUGIN_IMONLCD_DIR/libvdr*.so.* $ADDON_BUILD/$PKG_ADDON_ID/lib/vdr

    #locale
    cp -PR $VDR_PLUGIN_IMONLCD_DIR/locale/* $ADDON_BUILD/$PKG_ADDON_ID/share/locale
  fi

  #plugin iptv
  if [ "$ENABLE_VDR_PLUGIN_IPTV" = yes ]; then

    VDR_PLUGIN_IPTV_DIR=$(get_build_dir vdr-plugin-iptv)

    #libs
    cp -PR $VDR_PLUGIN_IPTV_DIR/libvdr*.so.* $ADDON_BUILD/$PKG_ADDON_ID/lib/vdr

    #config
    mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/config/plugins/iptv/scripts
      cp -PR $VDR_PLUGIN_IPTV_DIR/iptv/* $ADDON_BUILD/$PKG_ADDON_ID/config/plugins/iptv/scripts
      cp -PR $PKG_DIR/config/plugins/iptv/* $ADDON_BUILD/$PKG_ADDON_ID/config/plugins/iptv

    #locale
    cp -PR $VDR_PLUGIN_IPTV_DIR/locale/* $ADDON_BUILD/$PKG_ADDON_ID/share/locale
  fi

  #plugin lcdproc
  if [ "$ENABLE_VDR_PLUGIN_LCDPROC" = yes ]; then

    VDR_PLUGIN_LCDPROC_DIR=$(get_build_dir vdr-plugin-lcdproc)

    #libs
    cp -PR $VDR_PLUGIN_LCDPROC_DIR/libvdr*.so.* $ADDON_BUILD/$PKG_ADDON_ID/lib/vdr

    #locale
    cp -PR $VDR_PLUGIN_LCDPROC_DIR/locale/* $ADDON_BUILD/$PKG_ADDON_ID/share/locale
  fi

  #libs dep fo plugins
  if [ "$ENABLE_VDR_PLUGIN_LIVE" = yes -o "$ENABLE_VDR_PLUGIN_RESTFULAPI" = yes ]; then

    CXXTOOLS_DIR=$(get_build_dir cxxtools)

    mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/lib
      cp -P $CXXTOOLS_DIR/.install_pkg/usr/lib/libcxxtools.so.9.0.0 $ADDON_BUILD/$PKG_ADDON_ID/lib/libcxxtools.so.9
  fi

  #plugin live
  if [ "$ENABLE_VDR_PLUGIN_LIVE" = yes ]; then

    VDR_PLUGIN_LIVE_DIR=$(get_build_dir vdr-plugin-live)

    #libs
    cp -PR $VDR_PLUGIN_LIVE_DIR/libvdr*.so.* $ADDON_BUILD/$PKG_ADDON_ID/lib/vdr

    #config
    mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/config/plugins/live
      cp -PR $VDR_PLUGIN_LIVE_DIR/live/* $ADDON_BUILD/$PKG_ADDON_ID/config/plugins/live
      cp -PR $PKG_DIR/config/plugins/live/* $ADDON_BUILD/$PKG_ADDON_ID/config/plugins/live

    #locale
    cp -PR $VDR_PLUGIN_LIVE_DIR/locale/* $ADDON_BUILD/$PKG_ADDON_ID/share/locale

    #libs dep
    TNTNET_DIR=$(get_build_dir tntnet)
    mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/lib
      cp -P $TNTNET_DIR/.install_pkg/usr/lib/libtntnet.so.12.0.0 $ADDON_BUILD/$PKG_ADDON_ID/lib/libtntnet.so.12
  fi

  #plugin menuorg
  if [ "$ENABLE_VDR_PLUGIN_MENUORG" = yes ]; then

    VDR_PLUGIN_MENUORG_DIR=$(get_build_dir vdr-plugin-menuorg)

    #libs
    cp -PR $VDR_PLUGIN_MENUORG_DIR/libvdr*.so.* $ADDON_BUILD/$PKG_ADDON_ID/lib/vdr

    #config
    mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/config/plugins/menuorg
      cp -PR $VDR_PLUGIN_MENUORG_DIR/menuorg.* $ADDON_BUILD/$PKG_ADDON_ID/config/plugins/menuorg
      cp -PR $PKG_DIR/config/plugins/menuorg.xml $ADDON_BUILD/$PKG_ADDON_ID/config/plugins

    #locale
    cp -PR $VDR_PLUGIN_MENUORG_DIR/locale/* $ADDON_BUILD/$PKG_ADDON_ID/share/locale

    #libs dep
    GLIBMM_DIR=$(get_build_dir glibmm)
    LIBXMLPP_DIR=$(get_build_dir libxml++)
    LIBSIGPP_DIR=$(get_build_dir libsigc++)
    mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/lib
      cp -P $GLIBMM_DIR/.install_pkg/usr/lib/libgiomm-2.4.so.1.3.0 $ADDON_BUILD/$PKG_ADDON_ID/lib/libgiomm-2.4.so.1
      cp -P $GLIBMM_DIR/.install_pkg/usr/lib/libglibmm-2.4.so.1.3.0 $ADDON_BUILD/$PKG_ADDON_ID/lib/libglibmm-2.4.so.1
      cp -P $GLIBMM_DIR/.install_pkg/usr/lib/libglibmm_generate_extra_defs-2.4.so.1.3.0 $ADDON_BUILD/$PKG_ADDON_ID/lib/libglibmm_generate_extra_defs-2.4.so.1
      cp -P $LIBSIGPP_DIR/.install_pkg/usr/lib/libsigc-2.0.so.0.0.0 $ADDON_BUILD/$PKG_ADDON_ID/lib/libsigc-2.0.so.0
      cp -P $LIBXMLPP_DIR/.install_pkg/usr/lib/libxml++-2.6.so.2.0.7 $ADDON_BUILD/$PKG_ADDON_ID/lib/libxml++-2.6.so.2
  fi

  #plugin pin
  if [ "$ENABLE_VDR_PLUGIN_PIN" = yes ]; then

    VDR_PLUGIN_PIN_DIR=$(get_build_dir vdr-plugin-pin)

    #libs
    cp -PR $VDR_PLUGIN_PIN_DIR/libvdr*.so.* $ADDON_BUILD/$PKG_ADDON_ID/lib/vdr

    #locale
    cp -PR $VDR_PLUGIN_PIN_DIR/locale/* $ADDON_BUILD/$PKG_ADDON_ID/share/locale
  fi

  #libs dep fo plugins
  if [ "$ENABLE_VDR_PLUGIN_RESTFULAPI" = yes -o "$ENABLE_VDR_PLUGIN_SKINFLAT" = yes -o "$ENABLE_VDR_PLUGIN_SKINFLATPLUS" = yes -o "$ENABLE_VDR_PLUGIN_SKINNOPACITY" = yes -o "$ENABLE_VDR_PLUGIN_TEXT2SKIN" = yes -o "$ENABLE_VDR_PLUGIN_TVGUIDENG" = yes ]; then

    IM_DIR=$(get_build_dir ImageMagick)

    mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/lib
      cp -P $IM_DIR/.install_pkg/usr/lib/libMagick++-6.Q16.so.8.0.0 $ADDON_BUILD/$PKG_ADDON_ID/lib/libMagick++-6.Q16.so.8
      cp -P $IM_DIR/.install_pkg/usr/lib/libMagickCore-6.Q16.so.6.0.0 $ADDON_BUILD/$PKG_ADDON_ID/lib/libMagickCore-6.Q16.so.6
      cp -P $IM_DIR/.install_pkg/usr/lib/libMagickWand-6.Q16.so.6.0.0 $ADDON_BUILD/$PKG_ADDON_ID/lib/libMagickWand-6.Q16.so.6
  fi

  #plugin restfulapi
  if [ "$ENABLE_VDR_PLUGIN_RESTFULAPI" = yes ]; then

    VDR_PLUGIN_RESTFULAPI_DIR=$(get_build_dir vdr-plugin-restfulapi)

    #libs
    cp -PR $VDR_PLUGIN_RESTFULAPI_DIR/libvdr*.so.* $ADDON_BUILD/$PKG_ADDON_ID/lib/vdr

    #config
    mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/config/plugins/restfulapi
    mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/config/plugins/restfulapi/webapp
      cp -PR $VDR_PLUGIN_RESTFULAPI_DIR/web/* $ADDON_BUILD/$PKG_ADDON_ID/config/plugins/restfulapi
      cp -PR $VDR_PLUGIN_RESTFULAPI_DIR/API.html $ADDON_BUILD/$PKG_ADDON_ID/config/plugins/restfulapi

    #locale
    cp -PR $VDR_PLUGIN_RESTFULAPI_DIR/locale/* $ADDON_BUILD/$PKG_ADDON_ID/share/locale
  fi

  #plugin robotv
  if [ "$ENABLE_VDR_PLUGIN_ROBOTV" = yes ]; then

    VDR_PLUGIN_ROBOTV_DIR=$(get_build_dir vdr-plugin-robotv)

    #libs
    cp -PR $VDR_PLUGIN_ROBOTV_DIR/libvdr*.so.* $ADDON_BUILD/$PKG_ADDON_ID/lib/vdr

    #config
    mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/config/plugins/robotv
      cp -PR $VDR_PLUGIN_ROBOTV_DIR/config/* $ADDON_BUILD/$PKG_ADDON_ID/config/plugins/robotv
  fi

  #plugin satip
  if [ "$ENABLE_VDR_PLUGIN_SATIP" = yes ]; then

    VDR_PLUGIN_SATIP_DIR=$(get_build_dir vdr-plugin-satip)

    #libs
    cp -PR $VDR_PLUGIN_SATIP_DIR/libvdr*.so.* $ADDON_BUILD/$PKG_ADDON_ID/lib/vdr

    #locale
    cp -PR $VDR_PLUGIN_SATIP_DIR/locale/* $ADDON_BUILD/$PKG_ADDON_ID/share/locale
  fi

  #plugin skindesigner
  if [ "$ENABLE_VDR_PLUGIN_SKINDESIGNER" = yes ]; then

    VDR_PLUGIN_SKINDESINGER_DIR=$(get_build_dir vdr-plugin-skindesigner)

    #libs
    cp -PR $VDR_PLUGIN_SKINDESINGER_DIR/libvdr*.so.* $ADDON_BUILD/$PKG_ADDON_ID/lib/vdr
    cp -P $VDR_PLUGIN_SKINDESINGER_DIR/libskindesignerapi/libskindesignerapi.so.0.1.2 $ADDON_BUILD/$PKG_ADDON_ID/lib/libskindesignerapi.so.0

    #config
    mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/share/fontconfig/conf.avail
      cp -P $VDR_PLUGIN_SKINDESINGER_DIR/installs/99-skindesigner.conf $ADDON_BUILD/$PKG_ADDON_ID/share/fontconfig/conf.avail
    mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/share/fonts/TTF
      cp -PR $VDR_PLUGIN_SKINDESINGER_DIR/installs/TTF/* $ADDON_BUILD/$PKG_ADDON_ID/share/fonts/TTF
    mkfontdir $ADDON_BUILD/$PKG_ADDON_ID/share/fonts/TTF
    mkfontscale $ADDON_BUILD/$PKG_ADDON_ID/share/fonts/TTF
    mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/config/themes
      cp -PR $VDR_PLUGIN_SKINDESINGER_DIR/themes/* $ADDON_BUILD/$PKG_ADDON_ID/config/themes
    mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/config/plugins/skindesigner
      cp -PR $VDR_PLUGIN_SKINDESINGER_DIR/dtd $ADDON_BUILD/$PKG_ADDON_ID/config/plugins/skindesigner
      cp -PR $VDR_PLUGIN_SKINDESINGER_DIR/skins $ADDON_BUILD/$PKG_ADDON_ID/config/plugins/skindesigner
      cp -PR $VDR_PLUGIN_SKINDESINGER_DIR/scripts $ADDON_BUILD/$PKG_ADDON_ID/config/plugins/skindesigner

    #locale
    cp -PR $VDR_PLUGIN_SKINDESINGER_DIR/locale/* $ADDON_BUILD/$PKG_ADDON_ID/share/locale

    #libs dep
    LIBXFT_DIR=$(get_build_dir libXft)
    CAIRO_DIR=$(get_build_dir cairo)
    PANGO_DIR=$(get_build_dir pango)
    HARFBUZZ_DIR=$(get_build_dir harfbuzz)
    GDK_PIXBUF_DIR=$(get_build_dir gdk-pixbuf)
    LIBCROCO_DIR=$(get_build_dir libcroco)
    LIBRSVG_DIR=$(get_build_dir librsvg)
    mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/lib
      cp -P $LIBXFT_DIR/.install_pkg/usr/lib/libXft.so.2.3.2 $ADDON_BUILD/$PKG_ADDON_ID/lib/libXft.so.2
      cp -P $HARFBUZZ_DIR/.install_pkg/usr/lib/libharfbuzz.so.0.10800.1 $ADDON_BUILD/$PKG_ADDON_ID/lib/libharfbuzz.so.0
      cp -P $HARFBUZZ_DIR/.install_pkg/usr/lib/libharfbuzz-icu.so.0.10800.1 $ADDON_BUILD/$PKG_ADDON_ID/lib/libharfbuzz-icu.so.0
      cp -P $LIBCROCO_DIR/.install_pkg/usr/lib/libcroco-0.6.so.3.0.1 $ADDON_BUILD/$PKG_ADDON_ID/lib/libcroco-0.6.so.3
      cp -PR $GDK_PIXBUF_DIR/.install_pkg/usr/lib/gdk-pixbuf-2.0 $ADDON_BUILD/$PKG_ADDON_ID/lib
      cp -P $GDK_PIXBUF_DIR/.install_pkg/usr/lib/libgdk_pixbuf-2.0.so.0.3600.12 $ADDON_BUILD/$PKG_ADDON_ID/lib/libgdk_pixbuf-2.0.so.0
      cp -P $CAIRO_DIR/.install_pkg/usr/lib/libcairo.so.2.11400.10 $ADDON_BUILD/$PKG_ADDON_ID/lib/libcairo.so.2
      cp -P $CAIRO_DIR/.install_pkg/usr/lib/libcairo-script-interpreter.so.2.11400.10 $ADDON_BUILD/$PKG_ADDON_ID/lib/libcairo-script-interpreter.so.2
      cp -P $PANGO_DIR/.install_pkg/usr/lib/libpango-1.0.so.0.4200.1 $ADDON_BUILD/$PKG_ADDON_ID/lib/libpango-1.0.so.0
      cp -P $PANGO_DIR/.install_pkg/usr/lib/libpangoft2-1.0.so.0.4200.1 $ADDON_BUILD/$PKG_ADDON_ID/lib/libpangoft2-1.0.so.0
      cp -P $PANGO_DIR/.install_pkg/usr/lib/libpangoxft-1.0.so.0.4200.1 $ADDON_BUILD/$PKG_ADDON_ID/lib/libpangoxft-1.0.so.0
      cp -P $PANGO_DIR/.install_pkg/usr/lib/libpangocairo-1.0.so.0.4200.1 $ADDON_BUILD/$PKG_ADDON_ID/lib/libpangocairo-1.0.so.0
      cp -PR $LIBRSVG_DIR/.install_pkg/usr/lib/gdk-pixbuf-2.0 $ADDON_BUILD/$PKG_ADDON_ID/lib
      cp -P $LIBRSVG_DIR/.install_pkg/usr/lib/librsvg-2.so.2.40.9 $ADDON_BUILD/$PKG_ADDON_ID/lib/librsvg-2.so.2
  fi

  #plugin skinflat
  if [ "$ENABLE_VDR_PLUGIN_SKINFLAT" = yes ]; then

    VDR_PLUGIN_SKINFLAT_DIR=$(get_build_dir vdr-plugin-skinflat)

    #libs
    cp -PR $VDR_PLUGIN_SKINFLAT_DIR/libvdr*.so.* $ADDON_BUILD/$PKG_ADDON_ID/lib/vdr

    #config
    mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/config/themes
      cp -PR $VDR_PLUGIN_SKINFLAT_DIR/themes/* $ADDON_BUILD/$PKG_ADDON_ID/config/themes
    mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/config/plugins/skinflat
      cp -PR $VDR_PLUGIN_SKINFLAT_DIR/icons $ADDON_BUILD/$PKG_ADDON_ID/config/plugins/skinflat

    #locale
    cp -PR $VDR_PLUGIN_SKINFLAT_DIR/locale/* $ADDON_BUILD/$PKG_ADDON_ID/share/locale
  fi

  #plugin skinflatplus
  if [ "$ENABLE_VDR_PLUGIN_SKINFLATPLUS" = yes ]; then

    VDR_PLUGIN_SKINFLATPLUS_DIR=$(get_build_dir vdr-plugin-skinflatplus)

    #libs
    cp -PR $VDR_PLUGIN_SKINFLATPLUS_DIR/libvdr*.so.* $ADDON_BUILD/$PKG_ADDON_ID/lib/vdr

    #config
    mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/config/themes
      cp -PR $VDR_PLUGIN_SKINFLATPLUS_DIR/themes/* $ADDON_BUILD/$PKG_ADDON_ID/config/themes
    mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/config/plugins/skinflatplus
      cp -PR $VDR_PLUGIN_SKINFLATPLUS_DIR/icons $ADDON_BUILD/$PKG_ADDON_ID/config/plugins/skinflatplus
      cp -PR $VDR_PLUGIN_SKINFLATPLUS_DIR/decors $ADDON_BUILD/$PKG_ADDON_ID/config/plugins/skinflatplus
      cp -PR $VDR_PLUGIN_SKINFLATPLUS_DIR/configs $ADDON_BUILD/$PKG_ADDON_ID/config/plugins/skinflatplus
      cp -PR $VDR_PLUGIN_SKINFLATPLUS_DIR/widgets $ADDON_BUILD/$PKG_ADDON_ID/config/plugins/skinflatplus

    #locale
    cp -PR $VDR_PLUGIN_SKINFLATPLUS_DIR/locale/* $ADDON_BUILD/$PKG_ADDON_ID/share/locale
  fi

  #plugin skinnopacity
  if [ "$ENABLE_VDR_PLUGIN_SKINNOPACITY" = yes ]; then

    VDR_PLUGIN_SKINNOPACITY_DIR=$(get_build_dir vdr-plugin-skinnopacity)

    #libs
    cp -PR $VDR_PLUGIN_SKINNOPACITY_DIR/libvdr*.so.* $ADDON_BUILD/$PKG_ADDON_ID/lib/vdr

    #config
    mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/config/themes
      cp -PR $VDR_PLUGIN_SKINNOPACITY_DIR/themes/* $ADDON_BUILD/$PKG_ADDON_ID/config/themes
    mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/config/plugins/skinnopacity/themeconfigs
      cp -PR $VDR_PLUGIN_SKINNOPACITY_DIR/conf/*.conf $ADDON_BUILD/$PKG_ADDON_ID/config/plugins/skinnopacity/themeconfigs
    mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/config/plugins/skinnopacity
      cp -PR $VDR_PLUGIN_SKINNOPACITY_DIR/icons $ADDON_BUILD/$PKG_ADDON_ID/config/plugins/skinnopacity

    #locale
    cp -PR $VDR_PLUGIN_SKINNOPACITY_DIR/locale/* $ADDON_BUILD/$PKG_ADDON_ID/share/locale
  fi

  #plugin sleeptimer
  if [ "$ENABLE_VDR_PLUGIN_SLEEPTIMER" = yes ]; then

    VDR_PLUGIN_SLEEPTIMER_DIR=$(get_build_dir vdr-plugin-sleeptimer)

    #libs
    cp -PR $VDR_PLUGIN_SLEEPTIMER_DIR/libvdr*.so.* $ADDON_BUILD/$PKG_ADDON_ID/lib/vdr

    #locale
    cp -PR $VDR_PLUGIN_SLEEPTIMER_DIR/locale/* $ADDON_BUILD/$PKG_ADDON_ID/share/locale
  fi

  #plugin softhddevice
  if [ "$ENABLE_VDR_PLUGIN_SOFTHDDEVICE" = yes ]; then

    VDR_PLUGIN_SOFTHDDEVICE_DIR=$(get_build_dir vdr-plugin-softhddevice)

    #libs
    cp -PR $VDR_PLUGIN_SOFTHDDEVICE_DIR/libvdr*.so.* $ADDON_BUILD/$PKG_ADDON_ID/lib/vdr

    #locale
    cp -PR $VDR_PLUGIN_SOFTHDDEVICE_DIR/locale/* $ADDON_BUILD/$PKG_ADDON_ID/share/locale

    #libs dep
    LIBXCB_DIR=$(get_build_dir libxcb)
    LIBXCBUTIL_DIR=$(get_build_dir xcb-util)
    LIBXCBUTILIMAGE_DIR=$(get_build_dir xcb-util-image)
    LIBXCBUTILKEYSYMS_DIR=$(get_build_dir xcb-util-keysyms)
    LIBXCBUTILRENDERUTIL_DIR=$(get_build_dir xcb-util-renderutil)
    LIBXCBUTILWM_DIR=$(get_build_dir xcb-util-wm)
    mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/lib
      cp -P $LIBXCB_DIR/.install_pkg/usr/lib/libxcb.so.1.1.0 $ADDON_BUILD/$PKG_ADDON_ID/lib/libxcb.so.1
      cp -P $LIBXCB_DIR/.install_pkg/usr/lib/libxcb-composite.so.0.0.0 $ADDON_BUILD/$PKG_ADDON_ID/lib/libxcb-composite.so.0
      cp -P $LIBXCB_DIR/.install_pkg/usr/lib/libxcb-damage.so.0.0.0 $ADDON_BUILD/$PKG_ADDON_ID/lib/libxcb-damage.so.0
      cp -P $LIBXCB_DIR/.install_pkg/usr/lib/libxcb-dpms.so.0.0.0 $ADDON_BUILD/$PKG_ADDON_ID/lib/libxcb-dpms.so.0
      cp -P $LIBXCB_DIR/.install_pkg/usr/lib/libxcb-dri2.so.0.0.0 $ADDON_BUILD/$PKG_ADDON_ID/lib/libxcb-dri2.so.0
      cp -P $LIBXCB_DIR/.install_pkg/usr/lib/libxcb-dri3.so.0.0.0 $ADDON_BUILD/$PKG_ADDON_ID/lib/libxcb-dri3.so.0
      cp -P $LIBXCBUTILWM_DIR/.install_pkg/usr/lib/libxcb-ewmh.so.2.0.0 $ADDON_BUILD/$PKG_ADDON_ID/lib/libxcb-ewmh.so.2
      cp -P $LIBXCB_DIR/.install_pkg/usr/lib/libxcb-glx.so.0.0.0 $ADDON_BUILD/$PKG_ADDON_ID/lib/libxcb-glx.so.0
      cp -P $LIBXCBUTILWM_DIR/.install_pkg/usr/lib/libxcb-icccm.so.4.0.0 $ADDON_BUILD/$PKG_ADDON_ID/lib/libxcb-icccm.so.4
      cp -P $LIBXCBUTILIMAGE_DIR/.install_pkg/usr/lib/libxcb-image.so.0.0.0 $ADDON_BUILD/$PKG_ADDON_ID/lib/libxcb-image.so.0
      cp -P $LIBXCBUTILKEYSYMS_DIR/.install_pkg/usr/lib/libxcb-keysyms.so.1.0.0 $ADDON_BUILD/$PKG_ADDON_ID/lib/libxcb-keysyms.so.1
      cp -P $LIBXCB_DIR/.install_pkg/usr/lib/libxcb-present.so.0.0.0 $ADDON_BUILD/$PKG_ADDON_ID/lib/libxcb-present.so.0
      cp -P $LIBXCB_DIR/.install_pkg/usr/lib/libxcb-randr.so.0.1.0 $ADDON_BUILD/$PKG_ADDON_ID/lib/libxcb-randr.so.0
      cp -P $LIBXCB_DIR/.install_pkg/usr/lib/libxcb-record.so.0.0.0 $ADDON_BUILD/$PKG_ADDON_ID/lib/libxcb-record.so.0
      cp -P $LIBXCB_DIR/.install_pkg/usr/lib/libxcb-render.so.0.0.0 $ADDON_BUILD/$PKG_ADDON_ID/lib/libxcb-render.so.0
      cp -P $LIBXCBUTILRENDERUTIL_DIR/.install_pkg/usr/lib/libxcb-render-util.so.0.0.0 $ADDON_BUILD/$PKG_ADDON_ID/lib/libxcb-render-util.so.0
      cp -P $LIBXCB_DIR/.install_pkg/usr/lib/libxcb-res.so.0.0.0 $ADDON_BUILD/$PKG_ADDON_ID/lib/libxcb-res.so.0
      cp -P $LIBXCB_DIR/.install_pkg/usr/lib/libxcb-screensaver.so.0.0.0 $ADDON_BUILD/$PKG_ADDON_ID/lib/libxcb-screensaver.so.0
      cp -P $LIBXCB_DIR/.install_pkg/usr/lib/libxcb-shape.so.0.0.0 $ADDON_BUILD/$PKG_ADDON_ID/lib/libxcb-shape.so.0
      cp -P $LIBXCB_DIR/.install_pkg/usr/lib/libxcb-shm.so.0.0.0 $ADDON_BUILD/$PKG_ADDON_ID/lib/libxcb-shm.so.0
      cp -P $LIBXCB_DIR/.install_pkg/usr/lib/libxcb-sync.so.1.0.0 $ADDON_BUILD/$PKG_ADDON_ID/lib/libxcb-sync.so.1
      cp -P $LIBXCBUTIL_DIR/.install_pkg/usr/lib/libxcb-util.so.1.0.0 $ADDON_BUILD/$PKG_ADDON_ID/lib/libxcb-util.so.1
      cp -P $LIBXCB_DIR/.install_pkg/usr/lib/libxcb-xf86dri.so.0.0.0 $ADDON_BUILD/$PKG_ADDON_ID/lib/libxcb-xf86dri.so.0
      cp -P $LIBXCB_DIR/.install_pkg/usr/lib/libxcb-xfixes.so.0.0.0 $ADDON_BUILD/$PKG_ADDON_ID/lib/libxcb-xfixes.so.0
      cp -P $LIBXCB_DIR/.install_pkg/usr/lib/libxcb-xinerama.so.0.0.0 $ADDON_BUILD/$PKG_ADDON_ID/lib/libxcb-xinerama.so.0
      cp -P $LIBXCB_DIR/.install_pkg/usr/lib/libxcb-xkb.so.1.0.0 $ADDON_BUILD/$PKG_ADDON_ID/lib/libxcb-xkb.so.1
      cp -P $LIBXCB_DIR/.install_pkg/usr/lib/libxcb-xtest.so.0.0.0 $ADDON_BUILD/$PKG_ADDON_ID/lib/libxcb-xtest.so.0
      cp -P $LIBXCB_DIR/.install_pkg/usr/lib/libxcb-xv.so.0.0.0 $ADDON_BUILD/$PKG_ADDON_ID/lib/libxcb-xv.so.0
      cp -P $LIBXCB_DIR/.install_pkg/usr/lib/libxcb-xvmc.so.0.0.0 $ADDON_BUILD/$PKG_ADDON_ID/lib/libxcb-xvmc.so.0
  fi

  #plugin streamdev
  if [ "$ENABLE_VDR_PLUGIN_STREAMDEV" = yes ]; then

    VDR_PLUGIN_STREAMDEV_DIR=$(get_build_dir vdr-plugin-streamdev)

    #libs
    cp -PR $VDR_PLUGIN_STREAMDEV_DIR/server/libvdr*.so.* $ADDON_BUILD/$PKG_ADDON_ID/lib/vdr
    cp -PR $VDR_PLUGIN_STREAMDEV_DIR/client/libvdr*.so.* $ADDON_BUILD/$PKG_ADDON_ID/lib/vdr

    #config
    mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/config/plugins/streamdev-server
      cp -PR $VDR_PLUGIN_STREAMDEV_DIR/streamdev-server/streamdevhosts.conf $ADDON_BUILD/$PKG_ADDON_ID/config/plugins/streamdev-server
      cp -PR $PKG_DIR/config/plugins/streamdev-server/* $ADDON_BUILD/$PKG_ADDON_ID/config/plugins/streamdev-server

    #locale
    for fmo in `ls $VDR_PLUGIN_STREAMDEV_DIR/server/po/*.mo`;do
      fname=`basename $fmo .mo`
      mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/share/locale/$fname
      mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/share/locale/$fname/LC_MESSAGES
        cp -p $fmo $ADDON_BUILD/$PKG_ADDON_ID/share/locale/$fname/LC_MESSAGES/vdr-streamdev-server.mo
    done
    for fmo in `ls $VDR_PLUGIN_STREAMDEV_DIR/client/po/*.mo`;do
      fname=`basename $fmo .mo`
      mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/share/locale/$fname
      mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/share/locale/$fname/LC_MESSAGES
        cp -p $fmo $ADDON_BUILD/$PKG_ADDON_ID/share/locale/$fname/LC_MESSAGES/vdr-streamdev-client.mo
    done
  fi

  #plugin systeminfo
  if [ "$ENABLE_VDR_PLUGIN_SYSTEMINFO" = yes ]; then

    VDR_PLUGIN_SYSTEMINFO_DIR=$(get_build_dir vdr-plugin-systeminfo)

    #libs
    cp -PR $VDR_PLUGIN_SYSTEMINFO_DIR/libvdr*.so.* $ADDON_BUILD/$PKG_ADDON_ID/lib/vdr

    #config
    mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/config/plugins/systeminfo
      cp -PR $VDR_PLUGIN_SYSTEMINFO_DIR/scripts/* $ADDON_BUILD/$PKG_ADDON_ID/config/plugins/systeminfo
      cp -PR $PKG_DIR/config/plugins/systeminfo/* $ADDON_BUILD/$PKG_ADDON_ID/config/plugins/systeminfo

    #locale
    cp -PR $VDR_PLUGIN_SYSTEMINFO_DIR/locale/* $ADDON_BUILD/$PKG_ADDON_ID/share/locale
  fi

  #plugin text2skin
  if [ "$ENABLE_VDR_PLUGIN_TEXT2SKIN" = yes ]; then

    VDR_PLUGIN_TEXT2SKIN_DIR=$(get_build_dir vdr-plugin-text2skin)
    VDR_PLUGIN_TEXT2SKIN_PKG=$(get_pkg_directory vdr-plugin-text2skin)

    #libs
    cp -PR $VDR_PLUGIN_TEXT2SKIN_DIR/libvdr*.so.* $ADDON_BUILD/$PKG_ADDON_ID/lib/vdr

    #config
    mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/config/themes
      cp -PR $VDR_PLUGIN_TEXT2SKIN_PKG/themes/* $ADDON_BUILD/$PKG_ADDON_ID/config/themes
    mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/config/plugins/text2skin
      cp -PR $VDR_PLUGIN_TEXT2SKIN_PKG/skins/* $ADDON_BUILD/$PKG_ADDON_ID/config/plugins/text2skin

    #locale
    cp -PR $VDR_PLUGIN_TEXT2SKIN_DIR/locale/* $ADDON_BUILD/$PKG_ADDON_ID/share/locale
  fi

  #plugin tvguideng
  if [ "$ENABLE_VDR_PLUGIN_TVGUIDENG" = yes -a "$ENABLE_VDR_PLUGIN_SKINDESIGNER" = yes ]; then

    VDR_PLUGIN_TVGUIDENG_DIR=$(get_build_dir vdr-plugin-tvguideng)

    #libs
    cp -PR $VDR_PLUGIN_TVGUIDENG_DIR/libvdr*.so.* $ADDON_BUILD/$PKG_ADDON_ID/lib/vdr

    #config
    mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/config/plugins/tvguideng/templates
      cp -PR $VDR_PLUGIN_TVGUIDENG_DIR/templates/* $ADDON_BUILD/$PKG_ADDON_ID/config/plugins/tvguideng/templates

    #locale
    cp -PR $VDR_PLUGIN_TVGUIDENG_DIR/locale/* $ADDON_BUILD/$PKG_ADDON_ID/share/locale
  fi

  #plugin tvscraper
  if [ "$ENABLE_VDR_PLUGIN_TVSCRAPER" = yes ]; then

    VDR_PLUGIN_TVSCRAPER_DIR=$(get_build_dir vdr-plugin-tvscraper)

    #libs
    cp -PR $VDR_PLUGIN_TVSCRAPER_DIR/libvdr*.so.* $ADDON_BUILD/$PKG_ADDON_ID/lib/vdr

    #config
    mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/config/plugins/tvscraper
      cp -PR $VDR_PLUGIN_TVSCRAPER_DIR/conf/* $ADDON_BUILD/$PKG_ADDON_ID/config/plugins/tvscraper

    #locale
    cp -PR $VDR_PLUGIN_TVSCRAPER_DIR/locale/* $ADDON_BUILD/$PKG_ADDON_ID/share/locale
  fi

  #plugin vnsiserver
  if [ "$ENABLE_VDR_PLUGIN_VNSISERVER" = yes ]; then

    VDR_PLUGIN_VNSISERVER_DIR=$(get_build_dir vdr-plugin-vnsiserver)

    #libs
    cp -PR $VDR_PLUGIN_VNSISERVER_DIR/libvdr*.so.* $ADDON_BUILD/$PKG_ADDON_ID/lib/vdr

    #config
    mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/config/plugins/vnsiserver
      cp -PR $VDR_PLUGIN_VNSISERVER_DIR/vnsiserver/allowed_hosts.conf $ADDON_BUILD/$PKG_ADDON_ID/config/plugins/vnsiserver

    #locale
    cp -PR $VDR_PLUGIN_VNSISERVER_DIR/locale/* $ADDON_BUILD/$PKG_ADDON_ID/share/locale
  fi

  #plugin weatherforecast
  if [ "$ENABLE_VDR_PLUGIN_WEATHERFORECAST" = yes -a "$ENABLE_VDR_PLUGIN_SKINDESIGNER" = yes ]; then

    VDR_PLUGIN_WEATHERFORECAST_DIR=$(get_build_dir vdr-plugin-weatherforecast)

    #libs
    cp -PR $VDR_PLUGIN_WEATHERFORECAST_DIR/libvdr*.so.* $ADDON_BUILD/$PKG_ADDON_ID/lib/vdr

    #config
    mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/config/plugins/weatherforecast
      cp -PR $VDR_PLUGIN_WEATHERFORECAST_DIR/templates $ADDON_BUILD/$PKG_ADDON_ID/config/plugins/weatherforecast

    #locale
    cp -PR $VDR_PLUGIN_WEATHERFORECAST_DIR/locale/* $ADDON_BUILD/$PKG_ADDON_ID/share/locale
  fi

  #plugin wirbelscan and wirbelscancontrol
  if [ "$ENABLE_VDR_PLUGIN_WIRBELSCAN" = yes ]; then

    VDR_PLUGIN_WIRBELSCAN_DIR=$(get_build_dir vdr-plugin-wirbelscan)
    VDR_PLUGIN_WIRBELSCANCONTROL_DIR=$(get_build_dir vdr-plugin-wirbelscancontrol)

    #libs
    cp -PR $VDR_PLUGIN_WIRBELSCAN_DIR/libvdr*.so.* $ADDON_BUILD/$PKG_ADDON_ID/lib/vdr
    cp -PR $VDR_PLUGIN_WIRBELSCANCONTROL_DIR/libvdr*.so.* $ADDON_BUILD/$PKG_ADDON_ID/lib/vdr

    #locale
    cp -PR $VDR_PLUGIN_WIRBELSCAN_DIR/locale/* $ADDON_BUILD/$PKG_ADDON_ID/share/locale
    cp -PR $VDR_PLUGIN_WIRBELSCANCONTROL_DIR/locale/* $ADDON_BUILD/$PKG_ADDON_ID/share/locale
  fi

  #plugin xineliboutput
  if [ "$ENABLE_VDR_PLUGIN_XINELIBOUTPUT" = yes ]; then

    VDR_PLUGIN_XINEOUTPUT_DIR=$(get_build_dir vdr-plugin-xineliboutput)
    XINE_VERSION="2.6"

    #bin
    cp -P $VDR_PLUGIN_XINEOUTPUT_DIR/vdr-fbfe $ADDON_BUILD/$PKG_ADDON_ID/bin
    cp -P $VDR_PLUGIN_XINEOUTPUT_DIR/vdr-sxfe $ADDON_BUILD/$PKG_ADDON_ID/bin

    #libs
    cp -PR $VDR_PLUGIN_XINEOUTPUT_DIR/libvdr*.so.* $ADDON_BUILD/$PKG_ADDON_ID/lib/vdr
    cp -PR $VDR_PLUGIN_XINEOUTPUT_DIR/libxineliboutput*.so.* $ADDON_BUILD/$PKG_ADDON_ID/lib/vdr
    mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/lib/xine/plugins/$XINE_VERSION
      cp -PR $VDR_PLUGIN_XINEOUTPUT_DIR/xineplug_inp_xvdr.so $ADDON_BUILD/$PKG_ADDON_ID/lib/xine/plugins/$XINE_VERSION
    mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/lib/xine/plugins/$XINE_VERSION/post
      cp -PR $VDR_PLUGIN_XINEOUTPUT_DIR/xineplug_post_*.so $ADDON_BUILD/$PKG_ADDON_ID/lib/xine/plugins/$XINE_VERSION/post

    #config
    mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/config/plugins/xineliboutput
      cp -PR $VDR_PLUGIN_XINEOUTPUT_DIR/examples/* $ADDON_BUILD/$PKG_ADDON_ID/config/plugins/xineliboutput
      cp -PR $VDR_PLUGIN_XINEOUTPUT_DIR/*.mpg $ADDON_BUILD/$PKG_ADDON_ID/config/plugins/xineliboutput

    #locale
    cp -PR $VDR_PLUGIN_XINEOUTPUT_DIR/locale/* $ADDON_BUILD/$PKG_ADDON_ID/share/locale

    #libs dep
    XINELIB_DIR=$(get_build_dir xine-lib)
    mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/lib
      cp -PR $XINELIB_DIR/.install_pkg/usr/lib/xine $ADDON_BUILD/$PKG_ADDON_ID/lib
      cp -P $XINELIB_DIR/.install_pkg/usr/lib/libxine.so.2.6.1 $ADDON_BUILD/$PKG_ADDON_ID/lib/libxine.so.2
  fi

  #plugin xmltv2vdr
  if [ "$ENABLE_VDR_PLUGIN_XMLTV2VDR" = yes ]; then

    VDR_PLUGIN_XMLTV2VDR_DIR=$(get_build_dir vdr-plugin-xmltv2vdr)

    #bin
    cp -P $VDR_PLUGIN_XMLTV2VDR_DIR/dist/epgdata2xmltv/epgdata2xmltv $ADDON_BUILD/$PKG_ADDON_ID/bin

    #libs
    cp -PR $VDR_PLUGIN_XMLTV2VDR_DIR/libvdr*.so.* $ADDON_BUILD/$PKG_ADDON_ID/lib/vdr

    #config
    mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/config/epgsources
      cp $VDR_PLUGIN_XMLTV2VDR_DIR/dist/epgdata2xmltv/epgdata2xmltv.dist $ADDON_BUILD/$PKG_ADDON_ID/config/epgsources/epgdata2xmltv

    #locale
    cp -PR $VDR_PLUGIN_XMLTV2VDR_DIR/locale/* $ADDON_BUILD/$PKG_ADDON_ID/share/locale
  fi

}
