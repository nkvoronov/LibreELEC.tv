#!/bin/sh

cd ..

PROJECT=Generic ARCH=x86_64 ./scripts/create_addon pvr.hts
PROJECT=Generic ARCH=x86_64 ./scripts/create_addon pvr.iptvsimple
PROJECT=Generic ARCH=x86_64 ./scripts/create_addon visualization.projectm
PROJECT=Generic ARCH=x86_64 ./scripts/create_addon audioencoder.flac
PROJECT=Generic ARCH=x86_64 ./scripts/create_addon audioencoder.lame
PROJECT=Generic ARCH=x86_64 ./scripts/create_addon audioencoder.vorbis
PROJECT=Generic ARCH=x86_64 ./scripts/create_addon audioencoder.wav
PROJECT=Generic ARCH=x86_64 ./scripts/create_addon vfs.rar
PROJECT=Generic ARCH=x86_64 ./scripts/create_addon vfs.libarchive
PROJECT=Generic ARCH=x86_64 ./scripts/create_addon vfs.sftp
PROJECT=Generic ARCH=x86_64 ./scripts/create_addon imagedecoder.raw
PROJECT=Generic ARCH=x86_64 ./scripts/create_addon inputstream.rtmp
