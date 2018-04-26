#!/bin/sh

cd ..

#PROJECT=Generic ARCH=x86_64 ./scripts/create_addon vdr24
PROJECT=Generic ARCH=x86_64 ./scripts/create_addon docker
PROJECT=Generic ARCH=x86_64 ./scripts/create_addon acestream31
PROJECT=Generic ARCH=x86_64 ./scripts/create_addon mono
PROJECT=Generic ARCH=x86_64 ./scripts/create_addon emby
PROJECT=Generic ARCH=x86_64 ./scripts/create_addon ffmpeg-tools
PROJECT=Generic ARCH=x86_64 ./scripts/create_addon vlc3

