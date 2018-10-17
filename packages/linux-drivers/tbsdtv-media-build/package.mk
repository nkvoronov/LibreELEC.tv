# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)

PKG_NAME="tbsdtv-media-build"
PKG_VERSION="4735369fca22122cbc4dffd16c36026747563b0b"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/tbsdtv/linux_media/wiki"
PKG_URL="https://github.com/tbsdtv/media_build.git"
PKG_DEPENDS_TARGET="toolchain linux tbsdtv-firmware"
PKG_BUILD_DEPENDS_TARGET="toolchain linux tbsdtv-firmware"
PKG_NEED_UNPACK="$LINUX_DEPENDS"
PKG_SECTION="driver"
PKG_SHORTDESC="DVB drivers that replace the version shipped with the kernel"
PKG_LONGDESC="DVB drivers that replace the version shipped with the kernel"
PKG_IS_KERNEL_PKG="yes"
PKG_TOOLCHAIN="manual"

post_unpack() {
  cd $PKG_BUILD
  git clone --depth=1 https://github.com/tbsdtv/linux_media.git -b latest ./media
  make dir DIR=./media
  # make allyesconfig
}

pre_make_target() {
  export KERNEL_VER=$(get_module_dir)
  export LDFLAGS=""
}

make_target() {

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
  make -j4 VER=$KERNEL_VER SRCDIR=$(kernel_path)
}

makeinstall_target() {
  mkdir -p $INSTALL/$(get_full_module_dir)/tbsdtv
    find $PKG_BUILD/v4l/ -name \*.ko -exec cp {} $INSTALL/$(get_full_module_dir)/tbsdtv \;
}