#!/bin/sh

PROJECT=Generic ARCH=x86_64 ./scripts/create_addon pvr.hts
PROJECT=Generic ARCH=x86_64 ./scripts/create_addon pvr.iptvsimple
PROJECT=Generic ARCH=x86_64 ./scripts/create_addon pvr.vdr.vnsi
PROJECT=Generic ARCH=x86_64 ./scripts/create_addon adsp.basic
PROJECT=Generic ARCH=x86_64 ./scripts/create_addon adsp.biquad.filters
PROJECT=Generic ARCH=x86_64 ./scripts/create_addon adsp.freesurround
PROJECT=Generic ARCH=x86_64 ./scripts/create_addon screensavers.rsxs
PROJECT=Generic ARCH=x86_64 ./scripts/create_addon visualization.projectm