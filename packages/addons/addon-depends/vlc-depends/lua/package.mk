# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="lua"
PKG_VERSION="5.4.4"
PKG_SHA256="164c7849653b80ae67bec4b7473b884bf5cc8d2dca05653475ec2ed27b9ebf61"
PKG_LICENSE="MIT"
PKG_SITE="http://www.lua.org/"
PKG_URL="http://www.lua.org/ftp/${PKG_NAME}-${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain readline"
PKG_LONGDESC="Lua is a powerful light-weight programming language designed for extending applications. Lua is also frequently used as a general-purpose, stand-alone language."

_MAJORVER=${PKG_VERSION%.*}

make_target() {
  make CC="${CC}" \
       AR="${AR} rcu" \
       RANLIB="${RANLIB}" \
       CFLAGS="${CFLAGS} -fPIC" \
       LDFLAGS="${LDFLAGS}" \
       linux-readline
}

makeinstall_target() {
  rm -f ${SYSROOT_PREFIX}/usr/share/man/man1/lua*
  make \
  TO_LIB="liblua.a liblua.so liblua.so.${_MAJORVER} liblua.so.${PKG_VERSION}" \
  INSTALL_DATA='cp -d' \
  INSTALL_TOP=${SYSROOT_PREFIX}/usr \
  INSTALL_MAN=${SYSROOT_PREFIX}/usr/share/man/man1 \
  install

  ln -sf ${SYSROOT_PREFIX}/usr/bin/lua ${SYSROOT_PREFIX}/usr/bin/lua${_MAJORVER}
  ln -sf ${SYSROOT_PREFIX}/usr/bin/luac ${SYSROOT_PREFIX}/usr/bin/luac${_MAJORVER}

  mkdir -p ${SYSROOT_PREFIX}/usr/lib/pkgconfig
    cp -P ${PKG_DIR}/config/lua.pc ${SYSROOT_PREFIX}/usr/lib/pkgconfig/lua${_MAJORVER}.pc
  ln -sf ${SYSROOT_PREFIX}/usr/lib/pkgconfig/lua${_MAJORVER}.pc ${SYSROOT_PREFIX}/usr/lib/pkgconfig/lua.pc
}

post_install() {
  mkdir -p ${INSTALL}/usr/bin
    cp -P ${PKG_BUILD}/src/lua ${INSTALL}/usr/bin
    cp -P ${PKG_BUILD}/src/luac ${INSTALL}/usr/bin
  ln -sf /usr/bin/lua ${INSTALL}/usr/bin/lua${_MAJORVER}
  ln -sf /usr/bin/luac ${INSTALL}/usr/bin/luac${_MAJORVER}

  mkdir -p ${INSTALL}/usr/lib
    cp -P ${PKG_BUILD}/src/liblua.so ${INSTALL}/usr/lib
    cp -P ${PKG_BUILD}/src/liblua.so.* ${INSTALL}/usr/lib
}