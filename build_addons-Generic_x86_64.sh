#!/bin/sh

PROJECT=Generic ARCH=x86_64 ./scripts/create_addon vdr-addon
PROJECT=Generic ARCH=x86_64 ./scripts/create_addon tvheadend-addon
PROJECT=Generic ARCH=x86_64 ./scripts/create_addon oscam-addon
PROJECT=Generic ARCH=x86_64 ./scripts/create_addon transmission-addon
PROJECT=Generic ARCH=x86_64 ./scripts/create_addon scan-s2-addon
PROJECT=Generic ARCH=x86_64 ./scripts/create_addon szap-s2-addon
PROJECT=Generic ARCH=x86_64 ./scripts/create_addon mupen64plus-addon
PROJECT=Generic ARCH=x86_64 ./scripts/create_addon vlc-addon
PROJECT=Generic ARCH=x86_64 ./scripts/create_addon acestream-addon
PROJECT=Generic ARCH=x86_64 ./scripts/create_addon libtorrent-addon


