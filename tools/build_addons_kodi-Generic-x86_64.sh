#!/bin/sh

cd ..

PROJECT=Generic ARCH=x86_64 ./scripts/create_addon pvr.hts
PROJECT=Generic ARCH=x86_64 ./scripts/create_addon pvr.iptvsimple
PROJECT=Generic ARCH=x86_64 ./scripts/create_addon pvr.vdr.vnsi
PROJECT=Generic ARCH=x86_64 ./scripts/create_addon visualization.projectm
PROJECT=Generic ARCH=x86_64 ./scripts/create_addon audioencoder.flac
PROJECT=Generic ARCH=x86_64 ./scripts/create_addon audioencoder.lame
PROJECT=Generic ARCH=x86_64 ./scripts/create_addon audioencoder.vorbis
PROJECT=Generic ARCH=x86_64 ./scripts/create_addon audioencoder.wav