# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

# Downloadlocation:
# http://www.broadcom.com/support/802.11/linux_sta.php

PKG_NAME="bcm_sta"
PKG_VERSION="6.30.223.271"
PKG_SHA256="959bcd1e965d294304a4e290cb8e47b7c74b9763094eff4d0b8e6cfb68a6895b"
PKG_ARCH="x86_64"
PKG_LICENSE="nonfree"
PKG_SITE="http://www.broadcom.com/"
PKG_URL="$DISTRO_SRC/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="toolchain linux"
PKG_NEED_UNPACK="$LINUX_DEPENDS"
PKG_SECTION="driver"
PKG_SHORTDESC="bcm_sta: Broadcom's BCM4311-, BCM4312-, BCM4313-, BCM4321-, BCM4322-, BCM43224-, and BCM43225-based WLAN driver"
PKG_LONGDESC="These packages contain Broadcom's IEEE 802.11a/b/g/n hybrid Linux® device driver for use with Broadcom's BCM4311-, BCM4312-, BCM4313-, BCM4321-, BCM4322-, BCM43224-, and BCM43225-based hardware. There are different tars for 32-bit and 64-bit x86 CPU architectures. Make sure that you download the appropriate tar because the hybrid binary file must be of the appropriate architecture type. The hybrid binary file is agnostic to the specific version of the Linux kernel because it is designed to perform all interactions with the operating system through operating-system-specific files and an operating system abstraction layer file. All Linux operating-system-specific code is provided in source form, making it possible to retarget to different kernel versions and fix operating system related issues."
PKG_TOOLCHAIN="manual"
PKG_IS_KERNEL_PKG="yes"

make_target() {
  cd x86-64
    KBUILD_NOPEDANTIC=1 kernel_make V=1 CC=$CC -C $(kernel_path) M=`pwd` BINARCH=$TARGET_KERNEL_ARCH
}

makeinstall_target() {
  mkdir -p $INSTALL/$(get_full_module_dir)/bcm_sta
    cp *.ko $INSTALL/$(get_full_module_dir)/$PKG_NAME
}
