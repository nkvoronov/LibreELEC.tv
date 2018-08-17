#!/bin/sh
#
# externremux.sh

### GENERAL CONFIG START
###
# Pick one of DSL/WLAN
QUALITY="DSL"
###
### GENERAL CONFIG END

case "$REMUX_VPID" in
''|0|1) CONTENTTYPE='audio/mpeg';;
*) CONTENTTYPE='video/mpeg';;
esac

QUALITY=${REMUX_PARAM_QUALITY:-$QUALITY}
case "$QUALITY" in
DSL|dsl) VBR=640K; ABR=64K; VSIZE=hd480;;
WLAN|wlan) VBR=3072K; ABR=128K; VSIZE=hd720;;
*) error "Unknown quality '$QUALITY'";;
esac
ABR=${REMUX_PARAM_ABR:-$ABR}
VBR=${REMUX_PARAM_VBR:-$VBR}
VSIZE=${REMUX_PARAM_VSIZE:-$VSIZE}

FPS=${REMUX_PARAM_FPS:-$FPS}

if [ "$SERVER_PROTOCOL" = HTTP ]; then
echo -ne "Content-type: ${CONTENTTYPE}\r\n"
echo -ne '\r\n'
# abort after headers
[ "$REQUEST_METHOD" = HEAD ] && exit 0
fi

#ffmpeg -f mpegts -i - \
#-filter:v yadif -filter:v scale=${VSIZE} \
#-c:v mpegts -maxrate ${VBR} -bufsize 1024K \
#-c:a libmp3lame -b:a ${ABR} -ar 44100 -ac 2 -async 50 \
#${FPS:+-r $FPS} \
#-f mpegts pipe:1

ffmpeg -f mpegts -i - \
-vcodec copy -acodec copy \
-f mpegts pipe:1