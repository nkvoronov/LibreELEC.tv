# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)

PKG_NAME="crazycat-media-build"
PKG_VERSION="f77791e"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/crazycat69/linux_media"
PKG_URL="https://bitbucket.org/CrazyCat/media_build.git"
PKG_DEPENDS_TARGET="toolchain linux crazycat-firmware"
PKG_BUILD_DEPENDS_TARGET="toolchain linux"
PKG_NEED_UNPACK="$LINUX_DEPENDS"
PKG_LONGDESC="DVB drivers that replace the version shipped with the kernel"
PKG_IS_KERNEL_PKG="yes"
PKG_TOOLCHAIN="manual"

pre_make_target() {
  export KERNEL_VER=$(get_module_dir)
  export LDFLAGS=""
}

make_target() {
  # for git version
  make download
  make untar
  # get config
#  make allyesconfig

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
  mkdir -p $INSTALL/$(get_full_module_dir)/crazycat
    find $PKG_BUILD/v4l/ -name \*.ko -exec cp {} $INSTALL/$(get_full_module_dir)/crazycat \;
}
