# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="tbs-linux-drivers-cc"
PKG_VERSION="0d45df2"
PKG_ARCH="x86_64"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/nkvoronov/tbs-linux-drivers-cc.git"
PKG_URL="https://github.com/nkvoronov/tbs-linux-drivers-cc.git"
PKG_TYPE="git"
PKG_BRANCH="v170330-patch"
PKG_DEPENDS_TARGET="toolchain linux"
PKG_NEED_UNPACK="$LINUX_DEPENDS"
PKG_PRIORITY="optional"
PKG_SECTION="driver"
PKG_SHORTDESC="Linux TBS tuner drivers"
PKG_LONGDESC="Linux TBS tuner drivers"
PKG_IS_KERNEL_PKG="yes"
PKG_TOOLCHAIN="manual"

make_target() {
  cd $BUILD/$PKG_NAME-$PKG_VERSION
  ./v4l/tbs-x86_64.sh
  LDFLAGS="" make DIR=$(kernel_path) prepare
  LDFLAGS="" make DIR=$(kernel_path)
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/modules/$(get_module_dir)/updates/tbs
  find $PKG_BUILD/v4l/ -name \*.ko -exec cp {} $INSTALL/usr/lib/modules/$(get_module_dir)/updates/tbs \;
  mkdir -p $INSTALL/usr/lib/firmware/
  cp $PKG_BUILD/v4l/firmware/*.fw $INSTALL/usr/lib/firmware/
}
