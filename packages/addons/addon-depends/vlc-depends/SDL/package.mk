# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="SDL"
PKG_VERSION="1.2.15"
PKG_SHA256="d6d316a793e5e348155f0dd93b979798933fb98aa1edebcc108829d6474aad00"
PKG_LICENSE="GPL"
PKG_SITE="http://www.libsdl.org/"
PKG_URL="http://www.libsdl.org/release/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_HOST="yasm:host"
PKG_DEPENDS_TARGET="toolchain yasm:host alsa-lib"
PKG_LONGDESC="Simple DirectMedia Layer is a cross-platform multimedia library designed to provide fast access to the graphics framebuffer and audio device. It is used by MPEG playback software, emulators, and many popular games, including the award winning Linux port of 'Civilization: Call To Power.' Simple DirectMedia Layer supports Linux, Win32, BeOS, MacOS, Solaris, IRIX, and FreeBSD."

PKG_CONFIGURE_OPTS_HOST="--enable-rpath \
                         --enable-libc \
                         --disable-audio \
                         --disable-events \
                         --disable-joystick \
                         --disable-cdrom \
                         --enable-threads \
                         --enable-timers \
                         --enable-file \
                         --enable-loadso \
                         --enable-cpuinfo \
                         --enable-assembly \
                         --disable-oss \
                         --disable-alsa \
                         --disable-alsatest \
                         --disable-alsa-shared \
                         --disable-esd \
                         --disable-esdtest \
                         --disable-esd-shared \
                         --disable-pulseaudio \
                         --disable-pulseaudio-shared \
                         --disable-arts \
                         --disable-arts-shared \
                         --disable-nas \
                         --disable-diskaudio \
                         --disable-dummyaudio \
                         --disable-mintaudio \
                         --disable-nasm \
                         --disable-altivec \
                         --disable-ipod \
                         --disable-video \
                         --disable-x11-shared \
                         --disable-video-x11-dgamouse \
                         --disable-video-x11-xinerama \
                         --disable-video-x11-xme \
                         --disable-video-x11-xrandr \
                         --disable-video-x11 \
                         --disable-video-x11-vm \
                         --disable-video-x11-xv \
                         --without-x \
                         --disable-video-opengl \
                         --disable-video-nanox \
                         --disable-nanox-debug \
                         --disable-nanox-share-memory \
                         --disable-nanox-direct-fb \
                         --disable-dga \
                         --disable-video-dga \
                         --disable-video-photon \
                         --disable-video-carbon \
                         --disable-video-cocoa \
                         --disable-video-fbcon \
                         --disable-video-directfb \
                         --disable-video-ps2gs \
                         --disable-video-ggi \
                         --disable-video-svga \
                         --disable-video-vgl \
                         --disable-video-wscons \
                         --disable-video-aalib \
                         --disable-video-qtopia \
                         --disable-video-picogui \
                         --disable-video-dummy \
                         --disable-osmesa-shared \
                         --disable-input-events \
                         --disable-input-tslib \
                         --disable-pth \
                         --enable-pthreads \
                         --enable-pthread-sem \
                         --disable-stdio-redirect \
                         --disable-directx \
                         --enable-sdl-dlopen \
                         --disable-atari-ldg \
                         --disable-clock_gettime"

PKG_CONFIGURE_OPTS_TARGET="--disable-rpath \
                           --enable-libc \
                           --enable-audio \
                           --enable-events \
                           --enable-joystick \
                           --enable-cdrom \
                           --enable-threads \
                           --enable-timers \
                           --enable-file \
                           --enable-loadso \
                           --enable-cpuinfo \
                           --enable-assembly \
                           --disable-oss \
                           --enable-alsa \
                           --disable-alsatest \
                           --enable-alsa-shared \
                           --with-alsa-prefix=$SYSROOT_PREFIX/usr/lib \
                           --with-alsa-inc-prefix=$SYSROOT_PREFIX/usr/include \
                           --disable-esd \
                           --disable-esdtest \
                           --disable-esd-shared \
                           --disable-arts \
                           --disable-arts-shared \
                           --disable-nas \
                           --disable-diskaudio \
                           --disable-dummyaudio \
                           --disable-mintaudio \
                           --disable-nasm \
                           --disable-altivec \
                           --disable-ipod \
                           --disable-video-nanox \
                           --disable-nanox-debug \
                           --disable-nanox-share-memory \
                           --disable-nanox-direct-fb \
                           --disable-dga \
                           --disable-video-dga \
                           --disable-video-photon \
                           --disable-video-carbon \
                           --disable-video-cocoa \
                           --disable-video-fbcon \
                           --disable-video-directfb \
                           --disable-video-ps2gs \
                           --disable-video-ggi \
                           --disable-video-svga \
                           --disable-video-vgl \
                           --disable-video-wscons \
                           --disable-video-aalib \
                           --disable-video-qtopia \
                           --disable-video-picogui \
                           --disable-video-dummy \
                           --disable-osmesa-shared \
                           --enable-input-events \
                           --disable-input-tslib \
                           --disable-pth \
                           --enable-pthreads \
                           --enable-pthread-sem \
                           --disable-stdio-redirect \
                           --disable-directx \
                           --enable-sdl-dlopen \
                           --disable-atari-ldg \
                           --disable-clock_gettime"

if [ "$DISPLAYSERVER" = "x11" ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET libX11 libXrandr"

  PKG_CONFIGURE_OPTS_TARGET="$PKG_CONFIGURE_OPTS_TARGET --enable-video --enable-x11-shared --disable-video-x11-dgamouse"
  PKG_CONFIGURE_OPTS_TARGET="$PKG_CONFIGURE_OPTS_TARGET --disable-video-x11-xinerama --disable-video-x11-xme"
  PKG_CONFIGURE_OPTS_TARGET="$PKG_CONFIGURE_OPTS_TARGET --enable-video-x11-xrandr --enable-video-x11"
  PKG_CONFIGURE_OPTS_TARGET="$PKG_CONFIGURE_OPTS_TARGET --disable-video-x11-vm --disable-video-x11-xv --with-x"
else
  PKG_CONFIGURE_OPTS_TARGET="$PKG_CONFIGURE_OPTS_TARGET --disable-video --disable-x11-shared --disable-video-x11-dgamouse"
  PKG_CONFIGURE_OPTS_TARGET="$PKG_CONFIGURE_OPTS_TARGET --disable-video-x11-xinerama --disable-video-x11-xme"
  PKG_CONFIGURE_OPTS_TARGET="$PKG_CONFIGURE_OPTS_TARGET --disable-video-x11-xrandr --disable-video-x11"
  PKG_CONFIGURE_OPTS_TARGET="$PKG_CONFIGURE_OPTS_TARGET --disable-video-x11-vm --disable-video-x11-xv --without-x"
fi

if [ ! "$OPENGL" = "no" ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET $OPENGL glu"

  PKG_CONFIGURE_OPTS_TARGET="$PKG_CONFIGURE_OPTS_TARGET --enable-video-opengl"
else
  PKG_CONFIGURE_OPTS_TARGET="$PKG_CONFIGURE_OPTS_TARGET --disable-video-opengl"
fi

if [ "$PULSEAUDIO_SUPPORT" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET pulseaudio"

  PKG_CONFIGURE_OPTS_TARGET="$PKG_CONFIGURE_OPTS_TARGET --enable-pulseaudio --enable-pulseaudio-shared"
else
  PKG_CONFIGURE_OPTS_TARGET="$PKG_CONFIGURE_OPTS_TARGET --disable-pulseaudio --disable-pulseaudio-shared"
fi

pre_configure_host() {
  ( cd $PKG_BUILD
    # Skip autoheader because there is a problem with AC_DEFINE's in the configure.in in SDL 1.2.14.
    # Added include directory 'acinclude' because SDL 1.2.14 has no Makefile.am in which to specify it.
      AUTOHEADER=true autoreconf --verbose --install --force -I $SYSROOT_PREFIX/usr/share/aclocal -I acinclude
  )
}

pre_configure_target() {
  # todo: hack
  pre_configure_host
}

post_makeinstall_target() {
  rm -rf $INSTALL/usr/bin
}
