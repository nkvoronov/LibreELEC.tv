################################################################################
#      This file is part of LibreELEC - https://libreelec.tv
#      Copyright (C) 2016-present Team LibreELEC
#
#  LibreELEC is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 2 of the License, or
#  (at your option) any later version.
#
#  LibreELEC is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with LibreELEC.  If not, see <http://www.gnu.org/licenses/>.
################################################################################

PKG_NAME="system-tools"
PKG_VERSION=""
PKG_REV="107"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE=""
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="tools"
PKG_SHORTDESC="A bundle of system tools and programs"
PKG_LONGDESC="This bundle currently includes autossh, diffutils, dtach, efibootmgr, evtest, fdupes, file, getscancodes, hddtemp, hd-idle, hid_mapper, i2c-tools, inotify-tools, jq, lm_sensors, lshw, mc, mrxvt, mtpfs, nmon, p7zip, patch, pv, screen, strace, unrar and usb-modeswitch."

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="System Tools"
PKG_ADDON_TYPE="xbmc.python.script"
PKG_ADDON_PROVIDES=""

PKG_AUTORECONF="no"

ENABLE_AUTOSSH="no"
ENABLE_DIFFUTILS="no"
ENABLE_DSTAT="no"
ENABLE_DTACH="no"
ENABLE_EFIBOOTMGR="no"
ENABLE_EVTEST="yes"
ENABLE_FDUPES="no"
ENABLE_FILE="no"
ENABLE_GETSCANCODES="no"
ENABLE_HDDTEMP="yes"
ENABLE_HD_IDLE="no"
ENABLE_HID_MAPPER="no"
ENABLE_I2C_TOOLS="no"
ENABLE_INOTIFY_TOOLS="no"
ENABLE_JQ="no"
ENABLE_LM_SENSORS="yes"
ENABLE_LSHW="no"
ENABLE_MC="yes"
ENABLE_HTOP="yes"
ENABLE_MRXVT="no"
ENABLE_MTPFS="no"
ENABLE_NMON="no"
ENABLE_P7ZIP="yes"
ENABLE_PATCH="no"
ENABLE_PV="no"
ENABLE_SCREEN="no"
ENABLE_STRACE="no"
ENABLE_UNRAR="yes"
ENABLE_USB_MODESWITCH="no"
ENABLE_VIN="no"

if [ "$ENABLE_AUTOSSH" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET autossh"
fi

if [ "$ENABLE_DIFFUTILS" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET diffutils"
fi

if [ "$ENABLE_DSTAT" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET dstat"
fi

if [ "$ENABLE_DTACH" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET dtach"
fi

if [ "$ENABLE_EFIBOOTMGR" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET efibootmgr"
fi

if [ "$ENABLE_EVTEST" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET evtest"
fi

if [ "$ENABLE_FDUPES" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET fdupes"
fi

if [ "$ENABLE_FILE" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET file"
fi

if [ "$ENABLE_GETSCANCODES" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET getscancodes"
fi

if [ "$ENABLE_HDDTEMP" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET hddtemp"
fi

if [ "$ENABLE_HD_IDLE" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET hd-idle"
fi

if [ "$ENABLE_HID_MAPPER" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET hid_mapper"
fi

if [ "$ENABLE_I2C_TOOLS" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET i2c-tools"
fi

if [ "$ENABLE_INOTIFY_TOOLS" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET inotify-tools"
fi

if [ "$ENABLE_JQ" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET jq"
fi

if [ "$ENABLE_LM_SENSORS" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET lm_sensors"
fi

if [ "$ENABLE_LSHW" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET lshw"
fi

if [ "$ENABLE_MC" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET mc"
fi

if [ "$ENABLE_HTOP" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET htop"
fi

if [ "$ENABLE_MRXVT" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET mrxvt"
fi

if [ "$ENABLE_MTPFS" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET mtpfs"
fi

if [ "$ENABLE_NMON" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET nmon"
fi

if [ "$ENABLE_P7ZIP" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET p7zip"
fi

if [ "$ENABLE_PATCH" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET patch"
fi

if [ "$ENABLE_PV" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET pv"
fi

if [ "$ENABLE_SCREEN" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET screen"
fi

if [ "$ENABLE_STRACE" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET strace"
fi

if [ "$ENABLE_UNRAR" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET unrar"
fi

if [ "$ENABLE_USB_MODESWITCH" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET usb-modeswitch"
fi

if [ "$ENABLE_VIM" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET vim"
fi

make_target() {
  : # nop
}

makeinstall_target() {
  : # nop
}

addon() {
  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/lib/
  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/data/
  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/bin/
  # autossh
  if [ "$ENABLE_AUTOSSH" = yes ]; then
    cp -P $(get_build_dir autossh)/.$TARGET_NAME/autossh $ADDON_BUILD/$PKG_ADDON_ID/bin
  fi
  # diffutils
  if [ "$ENABLE_DIFFUTILS" = yes ]; then
    cp -P $(get_build_dir diffutils)/.$TARGET_NAME/src/cmp $ADDON_BUILD/$PKG_ADDON_ID/bin
    cp -P $(get_build_dir diffutils)/.$TARGET_NAME/src/diff $ADDON_BUILD/$PKG_ADDON_ID/bin
    cp -P $(get_build_dir diffutils)/.$TARGET_NAME/src/diff3 $ADDON_BUILD/$PKG_ADDON_ID/bin
    cp -P $(get_build_dir diffutils)/.$TARGET_NAME/src/sdiff $ADDON_BUILD/$PKG_ADDON_ID/bin
  fi
  # dstat
  if [ "$ENABLE_DSTAT" = yes ]; then
    cp -P $(get_build_dir dstat)/dstat $ADDON_BUILD/$PKG_ADDON_ID/bin
  fi
  # dtach
  if [ "$ENABLE_DTACH" = yes ]; then
    cp -P $(get_build_dir dtach)/.$TARGET_NAME/dtach $ADDON_BUILD/$PKG_ADDON_ID/bin
  fi
  # efibootmgr
  if [ "$ENABLE_EFIBOOTMGR" = yes ]; then
    cp -P $(get_build_dir efibootmgr)/src/efibootmgr/efibootmgr $ADDON_BUILD/$PKG_ADDON_ID/bin 2>/dev/null || :
  fi
  # evtest
  if [ "$ENABLE_EVTEST" = yes ]; then
    cp -P $(get_build_dir evtest)/.$TARGET_NAME/evtest $ADDON_BUILD/$PKG_ADDON_ID/bin
  fi
  # fdupes
  if [ "$ENABLE_FDUPES" = yes ]; then
    cp -P $(get_build_dir fdupes)/fdupes $ADDON_BUILD/$PKG_ADDON_ID/bin
  fi
  # file
  if [ "$ENABLE_FILE" = yes ]; then
    cp -P $(get_build_dir file)/.$TARGET_NAME/src/file $ADDON_BUILD/$PKG_ADDON_ID/bin
    cp -P $(get_build_dir file)/.$TARGET_NAME/magic/magic.mgc $ADDON_BUILD/$PKG_ADDON_ID/data
  fi
  # getscancodes
  if [ "$ENABLE_GETSCANCODES" = yes ]; then
    cp -P $(get_build_dir getscancodes)/getscancodes $ADDON_BUILD/$PKG_ADDON_ID/bin
  fi
  # hddtemp
  if [ "$ENABLE_HDDTEMP" = yes ]; then
    cp -P $(get_build_dir hddtemp)/.$TARGET_NAME/src/hddtemp $ADDON_BUILD/$PKG_ADDON_ID/bin
    cp -P $(get_build_dir hddtemp)/hddtemp.db $ADDON_BUILD/$PKG_ADDON_ID/data
  fi
  # hd-idle
  if [ "$ENABLE_HD_IDLE" = yes ]; then
    cp -P $(get_build_dir hd-idle)/hd-idle $ADDON_BUILD/$PKG_ADDON_ID/bin
  fi
  # hid_mapper
  if [ "$ENABLE_HID_MAPPER" = yes ]; then
    cp -P $(get_build_dir hid_mapper)/hid_mapper $ADDON_BUILD/$PKG_ADDON_ID/bin
  fi
  # i2c-tools
  if [ "$ENABLE_I2C_TOOLS" = yes ]; then
    cp -P $(get_build_dir i2c-tools)/tools/i2cdetect $ADDON_BUILD/$PKG_ADDON_ID/bin
    cp -P $(get_build_dir i2c-tools)/tools/i2cdump $ADDON_BUILD/$PKG_ADDON_ID/bin
    cp -P $(get_build_dir i2c-tools)/tools/i2cget $ADDON_BUILD/$PKG_ADDON_ID/bin
    cp -P $(get_build_dir i2c-tools)/tools/i2cset $ADDON_BUILD/$PKG_ADDON_ID/bin
    cp -P $(get_build_dir i2c-tools)/py-smbus/build/lib.linux-*/smbus.so $ADDON_BUILD/$PKG_ADDON_ID/lib
  fi
  # inotify-tools
  if [ "$ENABLE_INOTIFY_TOOLS" = yes ]; then
    cp -P $(get_build_dir inotify-tools)/.$TARGET_NAME/src/inotifywait $ADDON_BUILD/$PKG_ADDON_ID/bin
    cp -P $(get_build_dir inotify-tools)/.$TARGET_NAME/src/inotifywatch $ADDON_BUILD/$PKG_ADDON_ID/bin
  fi
  # jq
  if [ "$ENABLE_JQ" = yes ]; then
    cp -P $(get_build_dir jq)/.$TARGET_NAME/jq $ADDON_BUILD/$PKG_ADDON_ID/bin
  fi
  # lm_sensors
  if [ "$ENABLE_LM_SENSORS" = yes ]; then
    cp -P $(get_build_dir lm_sensors)/prog/sensors/sensors $ADDON_BUILD/$PKG_ADDON_ID/bin 2>/dev/null || :
  fi
  # lshw
  if [ "$ENABLE_LSHW" = yes ]; then
    cp -P $(get_build_dir lshw)/src/lshw $ADDON_BUILD/$PKG_ADDON_ID/bin
  fi
  # mc
  if [ "$ENABLE_MC" = yes ]; then
    cp -Pa $(get_build_dir mc)/.install_pkg/usr/bin/* $ADDON_BUILD/$PKG_ADDON_ID/bin/
    cp -PR  $(get_build_dir mc)/.install_pkg/* $ADDON_BUILD/$PKG_ADDON_ID
  fi
  # htop
  if [ "$ENABLE_HTOP" = yes ]; then
    cp -P $(get_build_dir htop)/.install_pkg/usr/bin/htop $ADDON_BUILD/$PKG_ADDON_ID/bin
  fi
  # mrxvt
  if [ "$ENABLE_MRXVT" = yes ]; then
    cp -P $(get_build_dir mrxvt)/.$TARGET_NAME/src/mrxvt $ADDON_BUILD/$PKG_ADDON_ID/bin 2>/dev/null || :
  fi
  # mtpfs
  if [ "$ENABLE_MTPFS" = yes ]; then
    cp -P $(get_build_dir mtpfs)/.$TARGET_NAME/mtpfs $ADDON_BUILD/$PKG_ADDON_ID/bin/
  fi
  # nmon
  if [ "$ENABLE_NMON" = yes ]; then
    cp -P $(get_build_dir nmon)/nmon $ADDON_BUILD/$PKG_ADDON_ID/bin/
  fi
  # p7zip
  if [ "$ENABLE_P7ZIP" = yes ]; then
    cp -P $(get_build_dir p7zip)/bin/7z.so $ADDON_BUILD/$PKG_ADDON_ID/bin
    cp -PR $(get_build_dir p7zip)/bin/Codecs $ADDON_BUILD/$PKG_ADDON_ID/bin
    cp -P $(get_build_dir p7zip)/bin/7z $ADDON_BUILD/$PKG_ADDON_ID/bin
    cp -P $(get_build_dir p7zip)/bin/7za $ADDON_BUILD/$PKG_ADDON_ID/bin
  fi
  # patch
  if [ "$ENABLE_PATCH" = yes ]; then
    cp -P $(get_build_dir patch)/.$TARGET_NAME/src/patch $ADDON_BUILD/$PKG_ADDON_ID/bin
  fi
  # pv
  if [ "$ENABLE_PV" = yes ]; then
    cp -P $(get_build_dir pv)/.$TARGET_NAME/pv $ADDON_BUILD/$PKG_ADDON_ID/bin
  fi
  # screen
  if [ "$ENABLE_SCREEN" = yes ]; then
    cp -P $(get_build_dir screen)/screen $ADDON_BUILD/$PKG_ADDON_ID/bin
  fi
  # strace
  if [ "$ENABLE_STRACE" = yes ]; then
    cp -P $(get_build_dir strace)/.$TARGET_NAME/strace $ADDON_BUILD/$PKG_ADDON_ID/bin
  fi
  # unrar
  if [ "$ENABLE_UNRAR" = yes ]; then
    cp -P $(get_build_dir unrar)/unrar $ADDON_BUILD/$PKG_ADDON_ID/bin
  fi
  # usb-modeswitch
  if [ "$ENABLE_USB_MODESWITCH" = yes ]; then
    cp -P $(get_build_dir usb-modeswitch)/usb_modeswitch $ADDON_BUILD/$PKG_ADDON_ID/bin
  fi
  # vim
  if [ "$ENABLE_VIM" = yes ]; then
    cp -P $(get_build_dir vim)/.install_pkg/usr/bin/vim $ADDON_BUILD/$PKG_ADDON_ID/bin
  fi

  debug_strip $ADDON_BUILD/$PKG_ADDON_ID/bin
}
