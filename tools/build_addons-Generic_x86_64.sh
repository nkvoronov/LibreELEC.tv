#!/bin/sh

cd ..

PROJECT=Generic ARCH=x86_64 ./scripts/create_addon oscam12
PROJECT=Generic ARCH=x86_64 ./scripts/create_addon transmission2
PROJECT=Generic ARCH=x86_64 ./scripts/create_addon tvheadend43
PROJECT=Generic ARCH=x86_64 ./scripts/create_addon vdr24
PROJECT=Generic ARCH=x86_64 ./scripts/create_addon lcdd
PROJECT=Generic ARCH=x86_64 ./scripts/create_addon acestream31
PROJECT=Generic ARCH=x86_64 ./scripts/create_addon system-tools
PROJECT=Generic ARCH=x86_64 ./scripts/create_addon dvb-tools
PROJECT=Generic ARCH=x86_64 ./scripts/create_addon dockers
PROJECT=Generic ARCH=x86_64 ./scripts/create_addon embyu
PROJECT=Generic ARCH=x86_64 ./scripts/create_addon vlc3



