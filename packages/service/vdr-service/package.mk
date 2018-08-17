# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="vdr-service"
PKG_VERSION="2.4.0"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.openelec.tv"
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain vdr script.vdrfront.run"
PKG_SECTION="service"
PKG_SHORTDESC="vdr: A powerful DVB TV application"
PKG_LONGDESC="This project describes how to build your own digital satellite receiver and video disk recorder. It is based mainly on the DVB-S digital satellite receiver card, which used to be available from Fujitsu Siemens and the driver software developed by the LinuxTV project."

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
ENABLE_VDR_PLUGIN_MENUORG="yes"
ENABLE_VDR_PLUGIN_PIN="yes"
ENABLE_VDR_PLUGIN_RESTFULAPI="yes"
ENABLE_VDR_PLUGIN_ROBOTV="yes"
ENABLE_VDR_PLUGIN_SATIP="yes"
ENABLE_VDR_PLUGIN_SKINDESIGNER="yes"
ENABLE_VDR_PLUGIN_SKINFLAT="yes"
ENABLE_VDR_PLUGIN_SKINFLATPLUS="yes"
ENABLE_VDR_PLUGIN_SKINNOPACITY="yes"
ENABLE_VDR_PLUGIN_SLEEPTIMER="yes"
ENABLE_VDR_PLUGIN_SOFTHDDEVICE="yes"
ENABLE_VDR_PLUGIN_STREAMDEV="yes"
ENABLE_VDR_PLUGIN_SYSTEMINFO="yes"
ENABLE_VDR_PLUGIN_TEXT2SKIN="yes"
ENABLE_VDR_PLUGIN_TVGUIDENG="yes"
ENABLE_VDR_PLUGIN_TVSCRAPER="yes"
ENABLE_VDR_PLUGIN_VNSISERVER="yes"
ENABLE_VDR_PLUGIN_WEATHERFORECAST="yes"
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

post_install() {

  VDR_DIR=$(get_build_dir vdr)
  VDR_PKG=$(get_pkg_directory vdr)

  #dirs
  mkdir -p $INSTALL/usr/config/vdr/plugins
  mkdir -p $INSTALL/usr/config/vdr/themes
  mkdir -p $INSTALL/usr/share/locale
  mkdir -p $INSTALL/usr/lib
  mkdir -p $INSTALL/usr/lib/vdr

  #bin
  mkdir -p $INSTALL/usr/bin
    cp -P $VDR_DIR/vdr $INSTALL/usr/bin/vdr.bin
    cp -P $VDR_DIR/svdrpsend $INSTALL/usr/bin/svdrpsend
    cp -P $PKG_DIR/scripts/* $INSTALL/usr/bin

  #config
  mkdir -p $INSTALL/usr/config/vdr
    cp -PR $VDR_DIR/*.conf $INSTALL/usr/config/vdr
    echo '0.0.0.0/0' >> $INSTALL/usr/config/vdr/svdrphosts.conf
    cp -PR $VDR_PKG/themes/* $INSTALL/usr/config/vdr/themes
    cp -PR $PKG_DIR/config/*.conf* $INSTALL/usr/config/vdr

  #locale
  cp -PR $VDR_DIR/locale/* $INSTALL/usr/share/locale

  #plugin channellists
  if [ "$ENABLE_VDR_PLUGIN_CHANNELLISTS" = yes ]; then

    VDR_PLUGIN_CHANNELLISTS_DIR=$(get_build_dir vdr-plugin-channellists)

    #config
    mkdir -p $INSTALL/usr/config/vdr/plugins/channellists/scripts
      cp -PR $VDR_PLUGIN_CHANNELLISTS_DIR/scripts/* $INSTALL/usr/config/vdr/plugins/channellists/scripts

    #libs
    cp -PR $VDR_PLUGIN_CHANNELLISTS_DIR/libvdr*.so.* $INSTALL/usr/lib/vdr

    #locale
    cp -PR $VDR_PLUGIN_CHANNELLISTS_DIR/locale/* $INSTALL/usr/share/locale
  fi

  #plugin ddci2
  if [ "$ENABLE_VDR_PLUGIN_DDCI2" = yes ]; then

    VDR_PLUGIN_DDCI2_DIR=$(get_build_dir vdr-plugin-ddci2)

    #libs
    cp -PR $VDR_PLUGIN_DDCI2_DIR/libvdr*.so.* $INSTALL/usr/lib/vdr
  fi

  #plugin dummydevice
  if [ "$ENABLE_VDR_PLUGIN_DUMMYDEVICE" = yes ]; then

    VDR_PLUGIN_DUMMYDEVICE_DIR=$(get_build_dir vdr-plugin-dummydevice)

    #libs
    cp -PR $VDR_PLUGIN_DUMMYDEVICE_DIR/libvdr*.so.* $INSTALL/usr/lib/vdr
  fi

  #plugin dvbapi
  if [ "$ENABLE_VDR_PLUGIN_DVBAPI" = yes ]; then

    VDR_PLUGIN_DVBAPI_DIR=$(get_build_dir vdr-plugin-dvbapi)

    #libs
    cp -PR $VDR_PLUGIN_DVBAPI_DIR/libvdr*.so.* $INSTALL/usr/lib/vdr

    #locale
    cp -PR $VDR_PLUGIN_DVBAPI_DIR/locale/* $INSTALL/usr/share/locale
  fi

  #plugin dynamite
  if [ "$ENABLE_VDR_PLUGIN_DYNAMITE" = yes ]; then

    VDR_PLUGIN_DYNAMITE_DIR=$(get_build_dir vdr-plugin-dynamite)

    #libs
    cp -PR $VDR_PLUGIN_DYNAMITE_DIR/libvdr*.so.* $INSTALL/usr/lib/vdr

    #locale
    cp -PR $VDR_PLUGIN_DYNAMITE_DIR/locale/* $INSTALL/usr/share/locale
  fi

  #plugin epgfixer
  if [ "$ENABLE_VDR_PLUGIN_EPGFIXER" = yes ]; then

    VDR_PLUGIN_EPGFIXER_DIR=$(get_build_dir vdr-plugin-epgfixer)

    #libs
    cp -PR $VDR_PLUGIN_EPGFIXER_DIR/libvdr*.so.* $INSTALL/usr/lib/vdr

    #config
    mkdir -p $INSTALL/usr/config/vdr/plugins/epgfixer
      cp -PR $VDR_PLUGIN_EPGFIXER_DIR/epgfixer/* $INSTALL/usr/config/vdr/plugins/epgfixer

    #locale
    cp -PR $VDR_PLUGIN_EPGFIXER_DIR/locale/* $INSTALL/usr/share/locale
  fi

  #plugin epgsearch
  if [ "$ENABLE_VDR_PLUGIN_EPGSEARCH" = yes ]; then

    VDR_PLUGIN_EPGSEARCH_DIR=$(get_build_dir vdr-plugin-epgsearch)

    #libs
    cp -PR $VDR_PLUGIN_EPGSEARCH_DIR/libvdr*.so.* $INSTALL/usr/lib/vdr

    #config
    mkdir -p $INSTALL/usr/config/vdr/plugins/epgsearch
      cp -PR $VDR_PLUGIN_EPGSEARCH_DIR/conf/* $INSTALL/usr/config/vdr/plugins/epgsearch

    #locale
    cp -PR $VDR_PLUGIN_EPGSEARCH_DIR/locale/* $INSTALL/usr/share/locale
  fi

  #plugin favorites
  if [ "$ENABLE_VDR_PLUGIN_FAVORITES" = yes ]; then

    VDR_PLUGIN_FAVORITES_DIR=$(get_build_dir vdr-plugin-favorites)

    #libs
    cp -PR $VDR_PLUGIN_FAVORITES_DIR/libvdr*.so.* $INSTALL/usr/lib/vdr

    #locale
    cp -PR $VDR_PLUGIN_FAVORITES_DIR/locale/* $INSTALL/usr/share/locale
  fi

  #plugin femon
  if [ "$ENABLE_VDR_PLUGIN_FEMON" = yes ]; then

    VDR_PLUGIN_FEMON_DIR=$(get_build_dir vdr-plugin-femon)

    #libs
    cp -PR $VDR_PLUGIN_FEMON_DIR/libvdr*.so.* $INSTALL/usr/lib/vdr

    #locale
    cp -PR $VDR_PLUGIN_FEMON_DIR/locale/* $INSTALL/usr/share/locale
  fi

  #plugin filebrowser
  if [ "$ENABLE_VDR_PLUGIN_FILEBROWSER" = yes ]; then

    VDR_PLUGIN_FILEBROWSER_DIR=$(get_build_dir vdr-plugin-filebrowser)

    #libs
    cp -PR $VDR_PLUGIN_FILEBROWSER_DIR/libvdr*.so.* $INSTALL/usr/lib/vdr

    #config
    mkdir -p $INSTALL/usr/config/vdr/plugins/filebrowser
      cp -PR $VDR_PLUGIN_FILEBROWSER_DIR/examples/filebrowser/* $INSTALL/usr/config/vdr/plugins/filebrowser
      cp -PR $PKG_DIR/config/plugins/filebrowser/* $INSTALL/usr/config/vdr/plugins/filebrowser
    mkdir -p $INSTALL/usr/config/vdr/plugins/filebrowser/scripts
      cp -PR $VDR_PLUGIN_FILEBROWSER_DIR/examples/scripts/* $INSTALL/usr/config/vdr/plugins/filebrowser/scripts

    #locale
    cp -PR $VDR_PLUGIN_FILEBROWSER_DIR/locale/* $INSTALL/usr/share/locale
  fi

  #plugin imonlcd
  if [ "$ENABLE_VDR_PLUGIN_IMONLCD" = yes ]; then

    VDR_PLUGIN_IMONLCD_DIR=$(get_build_dir vdr-plugin-imonlcd)

    #libs
    cp -PR $VDR_PLUGIN_IMONLCD_DIR/libvdr*.so.* $INSTALL/usr/lib/vdr

    #locale
    cp -PR $VDR_PLUGIN_IMONLCD_DIR/locale/* $INSTALL/usr/share/locale
  fi

  #plugin iptv
  if [ "$ENABLE_VDR_PLUGIN_IPTV" = yes ]; then

    VDR_PLUGIN_IPTV_DIR=$(get_build_dir vdr-plugin-iptv)

    #libs
    cp -PR $VDR_PLUGIN_IPTV_DIR/libvdr*.so.* $INSTALL/usr/lib/vdr

    #config
    mkdir -p $INSTALL/usr/config/vdr/plugins/iptv/scripts
      cp -PR $VDR_PLUGIN_IPTV_DIR/iptv/* $INSTALL/usr/config/vdr/plugins/iptv/scripts
      cp -PR $PKG_DIR/config/plugins/iptv/* $INSTALL/usr/config/vdr/plugins/iptv

    #locale
    cp -PR $VDR_PLUGIN_IPTV_DIR/locale/* $INSTALL/usr/share/locale
  fi

  #plugin lcdproc
  if [ "$ENABLE_VDR_PLUGIN_LCDPROC" = yes ]; then

    VDR_PLUGIN_LCDPROC_DIR=$(get_build_dir vdr-plugin-lcdproc)

    #libs
    cp -PR $VDR_PLUGIN_LCDPROC_DIR/libvdr*.so.* $INSTALL/usr/lib/vdr

    #locale
    cp -PR $VDR_PLUGIN_LCDPROC_DIR/locale/* $INSTALL/usr/share/locale
  fi

  #plugin live
  if [ "$ENABLE_VDR_PLUGIN_LIVE" = yes ]; then

    VDR_PLUGIN_LIVE_DIR=$(get_build_dir vdr-plugin-live)

    #libs
    cp -PR $VDR_PLUGIN_LIVE_DIR/libvdr*.so.* $INSTALL/usr/lib/vdr

    #config
    mkdir -p $INSTALL/usr/config/vdr/plugins/live
      cp -PR $VDR_PLUGIN_LIVE_DIR/live/* $INSTALL/usr/config/vdr/plugins/live
      cp -PR $PKG_DIR/config/plugins/live/* $INSTALL/usr/config/vdr/plugins/live

    #locale
    cp -PR $VDR_PLUGIN_LIVE_DIR/locale/* $INSTALL/usr/share/locale
  fi

  #plugin menuorg
  if [ "$ENABLE_VDR_PLUGIN_MENUORG" = yes ]; then

    VDR_PLUGIN_MENUORG_DIR=$(get_build_dir vdr-plugin-menuorg)

    #libs
    cp -PR $VDR_PLUGIN_MENUORG_DIR/libvdr*.so.* $INSTALL/usr/lib/vdr

    #config
    mkdir -p $INSTALL/usr/config/vdr/plugins/menuorg
      cp -PR $VDR_PLUGIN_MENUORG_DIR/menuorg.* $INSTALL/usr/config/vdr/plugins/menuorg
      cp -PR $PKG_DIR/config/plugins/menuorg.xml $INSTALL/usr/config/vdr/plugins

    #locale
    cp -PR $VDR_PLUGIN_MENUORG_DIR/locale/* $INSTALL/usr/share/locale
  fi

  #plugin pin
  if [ "$ENABLE_VDR_PLUGIN_PIN" = yes ]; then

    VDR_PLUGIN_PIN_DIR=$(get_build_dir vdr-plugin-pin)

    #libs
    cp -PR $VDR_PLUGIN_PIN_DIR/libvdr*.so.* $INSTALL/usr/lib/vdr

    #locale
    cp -PR $VDR_PLUGIN_PIN_DIR/locale/* $INSTALL/usr/share/locale
  fi

  #plugin restfulapi
  if [ "$ENABLE_VDR_PLUGIN_RESTFULAPI" = yes ]; then

    VDR_PLUGIN_RESTFULAPI_DIR=$(get_build_dir vdr-plugin-restfulapi)

    #libs
    cp -PR $VDR_PLUGIN_RESTFULAPI_DIR/libvdr*.so.* $INSTALL/usr/lib/vdr

    #config
    mkdir -p $INSTALL/usr/config/vdr/plugins/restfulapi
    mkdir -p $INSTALL/usr/config/vdr/plugins/restfulapi/webapp
      cp -PR $VDR_PLUGIN_RESTFULAPI_DIR/web/* $INSTALL/usr/config/vdr/plugins/restfulapi
      cp -PR $VDR_PLUGIN_RESTFULAPI_DIR/API.html $INSTALL/usr/config/vdr/plugins/restfulapi

    #locale
    cp -PR $VDR_PLUGIN_RESTFULAPI_DIR/locale/* $INSTALL/usr/share/locale
  fi

  #plugin robotv
  if [ "$ENABLE_VDR_PLUGIN_ROBOTV" = yes ]; then

    VDR_PLUGIN_ROBOTV_DIR=$(get_build_dir vdr-plugin-robotv)

    #libs
    cp -PR $VDR_PLUGIN_ROBOTV_DIR/libvdr*.so.* $INSTALL/usr/lib/vdr

    #config
    mkdir -p $INSTALL/usr/config/vdr/plugins/robotv
      cp -PR $VDR_PLUGIN_ROBOTV_DIR/config/* $INSTALL/usr/config/vdr/plugins/robotv
  fi

  #plugin satip
  if [ "$ENABLE_VDR_PLUGIN_SATIP" = yes ]; then

    VDR_PLUGIN_SATIP_DIR=$(get_build_dir vdr-plugin-satip)

    #libs
    cp -PR $VDR_PLUGIN_SATIP_DIR/libvdr*.so.* $INSTALL/usr/lib/vdr

    #locale
    cp -PR $VDR_PLUGIN_SATIP_DIR/locale/* $INSTALL/usr/share/locale
  fi

  #plugin skindesigner
  if [ "$ENABLE_VDR_PLUGIN_SKINDESIGNER" = yes ]; then

    VDR_PLUGIN_SKINDESINGER_DIR=$(get_build_dir vdr-plugin-skindesigner)

    #libs
    cp -PR $VDR_PLUGIN_SKINDESINGER_DIR/libvdr*.so.* $INSTALL/usr/lib/vdr
    cp -P $VDR_PLUGIN_SKINDESINGER_DIR/libskindesignerapi/libskindesignerapi.so.0.1.2 $INSTALL/usr/lib/libskindesignerapi.so.0

    #config
    mkdir -p $INSTALL/usr/share/fontconfig/conf.avail
      cp -P $VDR_PLUGIN_SKINDESINGER_DIR/installs/99-skindesigner.conf $INSTALL/usr/share/fontconfig/conf.avail
    mkdir -p $INSTALL/usr/share/fonts/TTF
      cp -PR $VDR_PLUGIN_SKINDESINGER_DIR/installs/TTF/* $INSTALL/usr/share/fonts/TTF
    mkfontdir $INSTALL/usr/share/fonts/TTF
    mkfontscale $INSTALL/usr/share/fonts/TTF
    mkdir -p $INSTALL/usr/config/vdr/themes
      cp -PR $VDR_PLUGIN_SKINDESINGER_DIR/themes/* $INSTALL/usr/config/vdr/themes
    mkdir -p $INSTALL/usr/config/vdr/plugins/skindesigner
      cp -PR $VDR_PLUGIN_SKINDESINGER_DIR/dtd $INSTALL/usr/config/vdr/plugins/skindesigner
      cp -PR $VDR_PLUGIN_SKINDESINGER_DIR/skins $INSTALL/usr/config/vdr/plugins/skindesigner
      cp -PR $VDR_PLUGIN_SKINDESINGER_DIR/scripts $INSTALL/usr/config/vdr/plugins/skindesigner

    #locale
    cp -PR $VDR_PLUGIN_SKINDESINGER_DIR/locale/* $INSTALL/usr/share/locale
  fi

  #plugin skinflat
  if [ "$ENABLE_VDR_PLUGIN_SKINFLAT" = yes ]; then

    VDR_PLUGIN_SKINFLAT_DIR=$(get_build_dir vdr-plugin-skinflat)

    #libs
    cp -PR $VDR_PLUGIN_SKINFLAT_DIR/libvdr*.so.* $INSTALL/usr/lib/vdr

    #config
    mkdir -p $INSTALL/usr/config/vdr/themes
      cp -PR $VDR_PLUGIN_SKINFLAT_DIR/themes/* $INSTALL/usr/config/vdr/themes
    mkdir -p $INSTALL/usr/config/vdr/plugins/skinflat
      cp -PR $VDR_PLUGIN_SKINFLAT_DIR/icons $INSTALL/usr/config/vdr/plugins/skinflat

    #locale
    cp -PR $VDR_PLUGIN_SKINFLAT_DIR/locale/* $INSTALL/usr/share/locale
  fi

  #plugin skinflatplus
  if [ "$ENABLE_VDR_PLUGIN_SKINFLATPLUS" = yes ]; then

    VDR_PLUGIN_SKINFLATPLUS_DIR=$(get_build_dir vdr-plugin-skinflatplus)

    #libs
    cp -PR $VDR_PLUGIN_SKINFLATPLUS_DIR/libvdr*.so.* $INSTALL/usr/lib/vdr

    #config
    mkdir -p $INSTALL/usr/config/vdr/themes
      cp -PR $VDR_PLUGIN_SKINFLATPLUS_DIR/themes/* $INSTALL/usr/config/vdr/themes
    mkdir -p $INSTALL/usr/config/vdr/plugins/skinflatplus
      cp -PR $VDR_PLUGIN_SKINFLATPLUS_DIR/icons $INSTALL/usr/config/vdr/plugins/skinflatplus
      cp -PR $VDR_PLUGIN_SKINFLATPLUS_DIR/decors $INSTALL/usr/config/vdr/plugins/skinflatplus
      cp -PR $VDR_PLUGIN_SKINFLATPLUS_DIR/configs $INSTALL/usr/config/vdr/plugins/skinflatplus
      cp -PR $VDR_PLUGIN_SKINFLATPLUS_DIR/widgets $INSTALL/usr/config/vdr/plugins/skinflatplus

    #locale
    cp -PR $VDR_PLUGIN_SKINFLATPLUS_DIR/locale/* $INSTALL/usr/share/locale
  fi

  #plugin skinnopacity
  if [ "$ENABLE_VDR_PLUGIN_SKINNOPACITY" = yes ]; then

    VDR_PLUGIN_SKINNOPACITY_DIR=$(get_build_dir vdr-plugin-skinnopacity)

    #libs
    cp -PR $VDR_PLUGIN_SKINNOPACITY_DIR/libvdr*.so.* $INSTALL/usr/lib/vdr

    #config
    mkdir -p $INSTALL/usr/config/vdr/themes
      cp -PR $VDR_PLUGIN_SKINNOPACITY_DIR/themes/* $INSTALL/usr/config/vdr/themes
    mkdir -p $INSTALL/usr/config/vdr/plugins/skinnopacity/themeconfigs
      cp -PR $VDR_PLUGIN_SKINNOPACITY_DIR/conf/*.conf $INSTALL/usr/config/vdr/plugins/skinnopacity/themeconfigs
    mkdir -p $INSTALL/usr/config/vdr/plugins/skinnopacity
      cp -PR $VDR_PLUGIN_SKINNOPACITY_DIR/icons $INSTALL/usr/config/vdr/plugins/skinnopacity

    #locale
    cp -PR $VDR_PLUGIN_SKINNOPACITY_DIR/locale/* $INSTALL/usr/share/locale
  fi

  #plugin sleeptimer
  if [ "$ENABLE_VDR_PLUGIN_SLEEPTIMER" = yes ]; then

    VDR_PLUGIN_SLEEPTIMER_DIR=$(get_build_dir vdr-plugin-sleeptimer)

    #libs
    cp -PR $VDR_PLUGIN_SLEEPTIMER_DIR/libvdr*.so.* $INSTALL/usr/lib/vdr

    #locale
    cp -PR $VDR_PLUGIN_SLEEPTIMER_DIR/locale/* $INSTALL/usr/share/locale
  fi

  #plugin softhddevice
  if [ "$ENABLE_VDR_PLUGIN_SOFTHDDEVICE" = yes ]; then

    VDR_PLUGIN_SOFTHDDEVICE_DIR=$(get_build_dir vdr-plugin-softhddevice)

    #libs
    cp -PR $VDR_PLUGIN_SOFTHDDEVICE_DIR/libvdr*.so.* $INSTALL/usr/lib/vdr

    #locale
    cp -PR $VDR_PLUGIN_SOFTHDDEVICE_DIR/locale/* $INSTALL/usr/share/locale
  fi

  #plugin streamdev
  if [ "$ENABLE_VDR_PLUGIN_STREAMDEV" = yes ]; then

    VDR_PLUGIN_STREAMDEV_DIR=$(get_build_dir vdr-plugin-streamdev)

    #libs
    cp -PR $VDR_PLUGIN_STREAMDEV_DIR/server/libvdr*.so.* $INSTALL/usr/lib/vdr
    cp -PR $VDR_PLUGIN_STREAMDEV_DIR/client/libvdr*.so.* $INSTALL/usr/lib/vdr

    #config
    mkdir -p $INSTALL/usr/config/vdr/plugins/streamdev-server
      cp -PR $VDR_PLUGIN_STREAMDEV_DIR/streamdev-server/streamdevhosts.conf $INSTALL/usr/config/vdr/plugins/streamdev-server
      cp -PR $PKG_DIR/config/plugins/streamdev-server/* $INSTALL/usr/config/vdr/plugins/streamdev-server

    #locale
    for fmo in `ls $VDR_PLUGIN_STREAMDEV_DIR/server/po/*.mo`;do
      fname=`basename $fmo .mo`
      mkdir -p $INSTALL/usr/share/locale/$fname
      mkdir -p $INSTALL/usr/share/locale/$fname/LC_MESSAGES
        cp -p $fmo $INSTALL/usr/share/locale/$fname/LC_MESSAGES/vdr-streamdev-server.mo
    done
    for fmo in `ls $VDR_PLUGIN_STREAMDEV_DIR/client/po/*.mo`;do
      fname=`basename $fmo .mo`
      mkdir -p $INSTALL/usr/share/locale/$fname
      mkdir -p $INSTALL/usr/share/locale/$fname/LC_MESSAGES
        cp -p $fmo $INSTALL/usr/share/locale/$fname/LC_MESSAGES/vdr-streamdev-client.mo
    done
  fi

  #plugin systeminfo
  if [ "$ENABLE_VDR_PLUGIN_SYSTEMINFO" = yes ]; then

    VDR_PLUGIN_SYSTEMINFO_DIR=$(get_build_dir vdr-plugin-systeminfo)

    #libs
    cp -PR $VDR_PLUGIN_SYSTEMINFO_DIR/libvdr*.so.* $INSTALL/usr/lib/vdr

    #config
    mkdir -p $INSTALL/usr/config/vdr/plugins/systeminfo
      cp -PR $VDR_PLUGIN_SYSTEMINFO_DIR/scripts/* $INSTALL/usr/config/vdr/plugins/systeminfo
      cp -PR $PKG_DIR/config/plugins/systeminfo/* $INSTALL/usr/config/vdr/plugins/systeminfo

    #locale
    cp -PR $VDR_PLUGIN_SYSTEMINFO_DIR/locale/* $INSTALL/usr/share/locale
  fi

  #plugin text2skin
  if [ "$ENABLE_VDR_PLUGIN_TEXT2SKIN" = yes ]; then

    VDR_PLUGIN_TEXT2SKIN_DIR=$(get_build_dir vdr-plugin-text2skin)
    VDR_PLUGIN_TEXT2SKIN_PKG=$(get_pkg_directory vdr-plugin-text2skin)

    #libs
    cp -PR $VDR_PLUGIN_TEXT2SKIN_DIR/libvdr*.so.* $INSTALL/usr/lib/vdr

    #config
    mkdir -p $INSTALL/usr/config/vdr/themes
      cp -PR $VDR_PLUGIN_TEXT2SKIN_PKG/themes/* $INSTALL/usr/config/vdr/themes
    mkdir -p $INSTALL/usr/config/vdr/plugins/text2skin
      cp -PR $VDR_PLUGIN_TEXT2SKIN_PKG/skins/* $INSTALL/usr/config/vdr/plugins/text2skin

    #locale
    cp -PR $VDR_PLUGIN_TEXT2SKIN_DIR/locale/* $INSTALL/usr/share/locale
  fi

  #plugin tvguideng
  if [ "$ENABLE_VDR_PLUGIN_TVGUIDENG" = yes -a "$ENABLE_VDR_PLUGIN_SKINDESIGNER" = yes ]; then

    VDR_PLUGIN_TVGUIDENG_DIR=$(get_build_dir vdr-plugin-tvguideng)

    #libs
    cp -PR $VDR_PLUGIN_TVGUIDENG_DIR/libvdr*.so.* $INSTALL/usr/lib/vdr

    #config
    mkdir -p $INSTALL/usr/config/vdr/plugins/tvguideng/templates
      cp -PR $VDR_PLUGIN_TVGUIDENG_DIR/templates/* $INSTALL/usr/config/vdr/plugins/tvguideng/templates

    #locale
    cp -PR $VDR_PLUGIN_TVGUIDENG_DIR/locale/* $INSTALL/usr/share/locale
  fi

  #plugin tvscraper
  if [ "$ENABLE_VDR_PLUGIN_TVSCRAPER" = yes ]; then

    VDR_PLUGIN_TVSCRAPER_DIR=$(get_build_dir vdr-plugin-tvscraper)

    #libs
    cp -PR $VDR_PLUGIN_TVSCRAPER_DIR/libvdr*.so.* $INSTALL/usr/lib/vdr

    #config
    mkdir -p $INSTALL/usr/config/vdr/plugins/tvscraper
      cp -PR $VDR_PLUGIN_TVSCRAPER_DIR/conf/* $INSTALL/usr/config/vdr/plugins/tvscraper

    #locale
    cp -PR $VDR_PLUGIN_TVSCRAPER_DIR/locale/* $INSTALL/usr/share/locale
  fi

  #plugin vnsiserver
  if [ "$ENABLE_VDR_PLUGIN_VNSISERVER" = yes ]; then

    VDR_PLUGIN_VNSISERVER_DIR=$(get_build_dir vdr-plugin-vnsiserver)

    #libs
    cp -PR $VDR_PLUGIN_VNSISERVER_DIR/libvdr*.so.* $INSTALL/usr/lib/vdr

    #config
    mkdir -p $INSTALL/usr/config/vdr/plugins/vnsiserver
      cp -PR $VDR_PLUGIN_VNSISERVER_DIR/vnsiserver/allowed_hosts.conf $INSTALL/usr/config/vdr/plugins/vnsiserver

    #locale
    cp -PR $VDR_PLUGIN_VNSISERVER_DIR/locale/* $INSTALL/usr/share/locale
  fi

  #plugin weatherforecast
  if [ "$ENABLE_VDR_PLUGIN_WEATHERFORECAST" = yes -a "$ENABLE_VDR_PLUGIN_SKINDESIGNER" = yes ]; then

    VDR_PLUGIN_WEATHERFORECAST_DIR=$(get_build_dir vdr-plugin-weatherforecast)

    #libs
    cp -PR $VDR_PLUGIN_WEATHERFORECAST_DIR/libvdr*.so.* $INSTALL/usr/lib/vdr

    #config
    mkdir -p $INSTALL/usr/config/vdr/plugins/weatherforecast
      cp -PR $VDR_PLUGIN_WEATHERFORECAST_DIR/templates $INSTALL/usr/config/vdr/plugins/weatherforecast

    #locale
    cp -PR $VDR_PLUGIN_WEATHERFORECAST_DIR/locale/* $INSTALL/usr/share/locale
  fi

  #plugin wirbelscan and wirbelscancontrol
  if [ "$ENABLE_VDR_PLUGIN_WIRBELSCAN" = yes ]; then

    VDR_PLUGIN_WIRBELSCAN_DIR=$(get_build_dir vdr-plugin-wirbelscan)
    VDR_PLUGIN_WIRBELSCANCONTROL_DIR=$(get_build_dir vdr-plugin-wirbelscancontrol)

    #libs
    cp -PR $VDR_PLUGIN_WIRBELSCAN_DIR/libvdr*.so.* $INSTALL/usr/lib/vdr
    cp -PR $VDR_PLUGIN_WIRBELSCANCONTROL_DIR/libvdr*.so.* $INSTALL/usr/lib/vdr

    #locale
    cp -PR $VDR_PLUGIN_WIRBELSCAN_DIR/locale/* $INSTALL/usr/share/locale
    cp -PR $VDR_PLUGIN_WIRBELSCANCONTROL_DIR/locale/* $INSTALL/usr/share/locale
  fi

  #plugin xineliboutput
  if [ "$ENABLE_VDR_PLUGIN_XINELIBOUTPUT" = yes ]; then

    VDR_PLUGIN_XINEOUTPUT_DIR=$(get_build_dir vdr-plugin-xineliboutput)
    XINE_VERSION="2.6"

    #bin
    cp -P $VDR_PLUGIN_XINEOUTPUT_DIR/vdr-fbfe $INSTALL/usr/bin
    cp -P $VDR_PLUGIN_XINEOUTPUT_DIR/vdr-sxfe $INSTALL/usr/bin

    #libs
    cp -PR $VDR_PLUGIN_XINEOUTPUT_DIR/libvdr*.so.* $INSTALL/usr/lib/vdr
    cp -PR $VDR_PLUGIN_XINEOUTPUT_DIR/libxineliboutput*.so.* $INSTALL/usr/lib/vdr
    mkdir -p $INSTALL/usr/lib/xine/plugins/$XINE_VERSION
      cp -PR $VDR_PLUGIN_XINEOUTPUT_DIR/xineplug_inp_xvdr.so $INSTALL/usr/lib/xine/plugins/$XINE_VERSION
    mkdir -p $INSTALL/usr/lib/xine/plugins/$XINE_VERSION/post
      cp -PR $VDR_PLUGIN_XINEOUTPUT_DIR/xineplug_post_*.so $INSTALL/usr/lib/xine/plugins/$XINE_VERSION/post

    #config
    mkdir -p $INSTALL/usr/config/vdr/plugins/xineliboutput
      cp -PR $VDR_PLUGIN_XINEOUTPUT_DIR/examples/* $INSTALL/usr/config/vdr/plugins/xineliboutput
      cp -PR $VDR_PLUGIN_XINEOUTPUT_DIR/*.mpg $INSTALL/usr/config/vdr/plugins/xineliboutput

    #locale
    cp -PR $VDR_PLUGIN_XINEOUTPUT_DIR/locale/* $INSTALL/usr/share/locale
  fi

  #plugin xmltv2vdr
  if [ "$ENABLE_VDR_PLUGIN_XMLTV2VDR" = yes ]; then

    VDR_PLUGIN_XMLTV2VDR_DIR=$(get_build_dir vdr-plugin-xmltv2vdr)

    #bin
    cp -P $VDR_PLUGIN_XMLTV2VDR_DIR/dist/epgdata2xmltv/epgdata2xmltv $INSTALL/usr/bin

    #libs
    cp -PR $VDR_PLUGIN_XMLTV2VDR_DIR/libvdr*.so.* $INSTALL/usr/lib/vdr

    #config
    mkdir -p $INSTALL/usr/config/vdr/epgsources
      cp $VDR_PLUGIN_XMLTV2VDR_DIR/dist/epgdata2xmltv/epgdata2xmltv.dist $INSTALL/usr/config/vdr/epgsources/epgdata2xmltv

    #locale
    cp -PR $VDR_PLUGIN_XMLTV2VDR_DIR/locale/* $INSTALL/usr/share/locale
  fi

  enable_service vdr.service
}