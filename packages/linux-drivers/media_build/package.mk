################################################################################
#      This file is part of LibreELEC - https://libreelec.tv
#      Copyright (C) 2016-present Team LibreELEC
#
# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="media_build"
PKG_VERSION="835dc72"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/crazycat69/linux_media"
PKG_URL="https://bitbucket.org/CrazyCat/media_build.git"
PKG_TYPE="git"
PKG_DEPENDS_TARGET="toolchain linux media_build_firmware"
PKG_BUILD_DEPENDS_TARGET="toolchain linux"
PKG_NEED_UNPACK="$LINUX_DEPENDS"
PKG_SECTION="driver"
PKG_SHORTDESC="DVB drivers that replace the version shipped with the kernel"
PKG_LONGDESC="DVB drivers that replace the version shipped with the kernel"
PKG_IS_KERNEL_PKG="yes"
PKG_TOOLCHAIN="manual"

pre_make_target() {
  export KERNEL_VER=$(get_module_dir)
  export LDFLAGS=""
}

make_target() {
  make download
  make untar

  # copy config file
  if [ "$PROJECT" = Generic ] || [ "$PROJECT" = Virtual ]; then
    if [ -f $PKG_DIR/config/generic.config ]; then
      cp $PKG_DIR/config/generic.config v4l/.config
    fi
  else
    if [ -f $PKG_DIR/config/usb.config ]; then
      cp $PKG_DIR/config/usb.config v4l/.config
    fi
  fi

  # add menuconfig to edit .config
  make VER=$KERNEL_VER SRCDIR=$(kernel_path)
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/modules/$KERNEL_VER/updates
  find $PKG_BUILD/v4l/ -name \*.ko -exec cp {} $INSTALL/usr/lib/modules/$KERNEL_VER/updates \;
}
