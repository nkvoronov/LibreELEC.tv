#!/bin/bash

#Infos fuer den SkinDesigner

DBUS="/usr/bin/vdr-dbus-send /Plugins/skindesigner plugin.SVDRPCommand string:SCTK"
OUTPUTFLDR=/tmp/skindesigner
mkdir -p $OUTPUTFLDR

#swap usage
#SWAPUSAGE=$(free | grep "Swap:" | awk '{ print ($2-$4)*100/$2 }'  | awk -F'.' '{ print $1 }' )
#[ $SWAPUSAGE -gt 100 ] && SWAPUSAGE=100
#$DBUS string:"ctSwap = ${SWAPUSAGE}"

#cpu temp
CPUTEMP=$(sensors -A coretemp-isa-0000 | grep "Core 0" | awk '{print $3}' | tr -d "+"  | awk -F'.' '{ print $1 }')
[ $CPUTEMP -gt 80 ] && CPUTEMP=80
echo "${CPUTEMP}°C" > ${OUTPUTFLDR}/cpu

#gpu temp
GPUTEMP=$(nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader  | awk -F'.' '{ print $1 }')
[ $GPUTEMP -gt 80 ] && GPUTEMP=80
echo "${GPUTEMP}°C" > ${OUTPUTFLDR}/gpu
