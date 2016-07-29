################################################################################
#      This file is part of OpenELEC - http://www.openelec.tv
#      Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
#
#  OpenELEC is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 2 of the License, or
#  (at your option) any later version.
#
#  OpenELEC is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with OpenELEC.  If not, see <http://www.gnu.org/licenses/>.
################################################################################

PKG_NAME="lua"
PKG_VERSION="5.3.1"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="MIT"
PKG_SITE="http://www.lua.org/"
PKG_URL="$DISTRO_CUSTOM_SRC/$PKG_NAME/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain readline"
PKG_PRIORITY="optional"
PKG_SECTION="custom/lang"
PKG_SHORTDESC="lua: A lightweight, extensible programming language"
PKG_LONGDESC="Lua is a powerful light-weight programming language designed for extending applications. Lua is also frequently used as a general-purpose, stand-alone language."

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

make_target() {
  #This command changes Lua search path to match the install paths.
  sed -i '/#define LUA_ROOT/s:/usr/local/:/usr/:' src/luaconf.h &&
  make INSTALL_TOP=/usr \
       TO_LIB="liblua.so liblua.so.5.3 liblua.so.5.3.1" \
       CC="$CC" \
       AR="$AR rcu" \
       RANLIB="$RANLIB" \
       CFLAGS="$CFLAGS -fPIC -DPIC" \
       LDFLAGS="$LDFLAGS -fPIC -DPIC" \
       linux
}

makeinstall_target() {
  : # nop
}

post_makeinstall_target() {
  mkdir -p $ROOT/$TOOLCHAIN/bin
    cp -P $ROOT/$PKG_BUILD/src/lua $ROOT/$TOOLCHAIN/bin
    cp -P $ROOT/$PKG_BUILD/src/luac $ROOT/$TOOLCHAIN/bin

  mkdir -p $SYSROOT_PREFIX/usr/lib
    cp -P $ROOT/$PKG_BUILD/src/liblua.a $SYSROOT_PREFIX/usr/lib
    cp -P $ROOT/$PKG_BUILD/src/liblua.so $SYSROOT_PREFIX/usr/lib
    cp -P $ROOT/$PKG_BUILD/src/liblua.so.* $SYSROOT_PREFIX/usr/lib

  mkdir -p $SYSROOT_PREFIX/usr/lib/pkgconfig
    cat > $SYSROOT_PREFIX/usr/lib/pkgconfig/lua5.3.pc << "EOF"
V=5.3
R=5.3.1

prefix=/usr
INSTALL_BIN=${prefix}/bin
INSTALL_INC=${prefix}/include
INSTALL_LIB=${prefix}/lib
INSTALL_MAN=${prefix}/man/man1
INSTALL_LMOD=${prefix}/share/lua/${V}
INSTALL_CMOD=${prefix}/lib/lua/${V}
exec_prefix=${prefix}
libdir=${exec_prefix}/lib
includedir=${prefix}/include

Name: Lua
Description: An Extensible Extension Language
Version: ${R}
Requires: 
Libs: -L${libdir} -llua -lm
Cflags: -I${includedir}
EOF

  mkdir -p $SYSROOT_PREFIX/usr/include
    cp -P $ROOT/$PKG_BUILD/src/lua.h $SYSROOT_PREFIX/usr/include
    cp -P $ROOT/$PKG_BUILD/src/luaconf.h $SYSROOT_PREFIX/usr/include
    cp -P $ROOT/$PKG_BUILD/src/lualib.h $SYSROOT_PREFIX/usr/include
    cp -P $ROOT/$PKG_BUILD/src/lauxlib.h $SYSROOT_PREFIX/usr/include
    cp -P $ROOT/$PKG_BUILD/src/lua.hpp $SYSROOT_PREFIX/usr/include
}

post_install() {
  mkdir -p $INSTALL/usr/bin
    cp -P $ROOT/$PKG_BUILD/src/lua $INSTALL/usr/bin
    cp -P $ROOT/$PKG_BUILD/src/luac $INSTALL/usr/bin

  mkdir -p $INSTALL/usr/lib
    cp -P $ROOT/$PKG_BUILD/src/liblua.so $INSTALL/usr/lib
    cp -P $ROOT/$PKG_BUILD/src/liblua.so.* $INSTALL/usr/lib
}