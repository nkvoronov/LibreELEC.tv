# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)

PKG_NAME="tools-system"
PKG_VERSION="1.0"
PKG_LICENSE="GPL"
PKG_SITE=""
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="This bundle currently includes autossh, diffutils, dstat, dtach, efibootmgr, encfs, evtest, fdupes, file, getscancodes, hddtemp, hd-idle, hid_mapper, htop, i2c-tools, inotify-tools, jq, lm_sensors, lshw, mc, mrxvt, mtpfs, nmon, p7zip, patch, pv, screen, smartmontools, strace, stress-ng, unrar, usb-modeswitch and vim."
PKG_TOOLCHAIN="manual"

ENABLE_AUTOSSH="yes"
ENABLE_DIFFUTILS="yes"
ENABLE_DSTAT="yes"
ENABLE_DTACH="yes"
ENABLE_EFIBOOTMGR="yes"
ENABLE_ENCFS="yes"
ENABLE_EVTEST="yes"
ENABLE_FDUPES="yes"
ENABLE_FILE="yes"
ENABLE_GETSCANCODES="yes"
ENABLE_HDDTEMP="yes"
ENABLE_HD_IDLE="yes"
ENABLE_HID_MAPPER="yes"
ENABLE_HTOP="yes"
ENABLE_I2C_TOOLS="yes"
ENABLE_INOTIFY_TOOLS="yes"
ENABLE_JQ="yes"
ENABLE_LM_SENSORS="yes"
ENABLE_LSHW="yes"
ENABLE_MC="yes"
ENABLE_MRXVT="yes"
ENABLE_MTPFS="yes"
ENABLE_NMON="yes"
ENABLE_P7ZIP="yes"
ENABLE_PATCH="yes"
ENABLE_PV="yes"
ENABLE_SCREEN="yes"
ENABLE_SMARTMONTOOLS="yes"
ENABLE_STRACE="yes"
ENABLE_STRACE_NG="yes"
ENABLE_UNRAR="yes"
ENABLE_USB_MODESWITCH="yes"
ENABLE_VIM="yes"

if [ "$ENABLE_AUTOSSH" = "yes" ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET autossh"
fi

if [ "$ENABLE_DIFFUTILS" = "yes" ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET diffutils"
fi

if [ "$ENABLE_DSTAT" = "yes" ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET dstat"
fi

if [ "$ENABLE_DTACH" = "yes" ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET dtach"
fi

if [ "$ENABLE_EFIBOOTMGR" = "yes" ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET efibootmgr"
fi

if [ "$ENABLE_ENCFS" = "yes" ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET encfs"
fi

if [ "$ENABLE_EVTEST" = "yes" ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET evtest"
fi

if [ "$ENABLE_FDUPES" = "yes" ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET fdupes"
fi

if [ "$ENABLE_FILE" = "yes" ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET file"
fi

if [ "$ENABLE_GETSCANCODES" = "yes" ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET getscancodes"
fi

if [ "$ENABLE_HDDTEMP" = "yes" ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET hddtemp"
fi

if [ "$ENABLE_HD_IDLE" = "yes" ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET hd-idle"
fi

if [ "$ENABLE_HID_MAPPER" = "yes" ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET hid_mapper"
fi

if [ "$ENABLE_HTOP" = "yes" ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET htop"
fi

if [ "$ENABLE_I2C_TOOLS" = "yes" ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET i2c-tools"
fi

if [ "$ENABLE_INOTIFY_TOOLS" = "yes" ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET inotify-tools"
fi

if [ "$ENABLE_JQ" = "yes" ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET jq"
fi

if [ "$ENABLE_LM_SENSORS" = "yes" ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET lm_sensors"
fi

if [ "$ENABLE_LSHW" = "yes" ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET lshw"
fi

if [ "$ENABLE_MC" = "yes" ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET mc"
fi

if [ "$ENABLE_MRXVT" = "yes" ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET mrxvt"
fi

if [ "$ENABLE_MTPFS" = "yes" ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET mtpfs"
fi

if [ "$ENABLE_NMON" = "yes" ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET nmon"
fi

if [ "$ENABLE_P7ZIP" = "yes" ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET p7zip"
fi

if [ "$ENABLE_PATCH" = "yes" ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET patch"
fi

if [ "$ENABLE_PV" = "yes" ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET pv"
fi

if [ "$ENABLE_SCREEN" = "yes" ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET screen"
fi

if [ "$ENABLE_SMARTMONTOOLS" = "yes" ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET smartmontools"
fi

if [ "$ENABLE_STRACE" = "yes" ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET strace"
fi

if [ "$ENABLE_STRACE_NG" = "yes" ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET stress-ng"
fi

if [ "$ENABLE_UNRAR" = "yes" ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET unrar"
fi

if [ "$ENABLE_USB_MODESWITCH" = "yes" ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET usb-modeswitch"
fi

if [ "$ENABLE_VIM" = "yes" ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET vim"
fi

post_install() {
  mkdir -p $INSTALL/
  mkdir -p $INSTALL/usr/bin/
  mkdir -p $INSTALL/usr/lib/
  # autossh
  if [ "$ENABLE_AUTOSSH" = "yes" ]; then
    cp -P $(get_build_dir autossh)/.$TARGET_NAME/autossh $INSTALL/usr/bin
  fi
  # diffutils
  if [ "$ENABLE_DIFFUTILS" = "yes" ]; then
    cp -P $(get_build_dir diffutils)/.$TARGET_NAME/src/cmp $INSTALL/usr/bin
    cp -P $(get_build_dir diffutils)/.$TARGET_NAME/src/diff $INSTALL/usr/bin
    cp -P $(get_build_dir diffutils)/.$TARGET_NAME/src/diff3 $INSTALL/usr/bin
    cp -P $(get_build_dir diffutils)/.$TARGET_NAME/src/sdiff $INSTALL/usr/bin
  fi
  # dstat
  if [ "$ENABLE_DSTAT" = "yes" ]; then
    cp -P $(get_build_dir dstat)/dstat $INSTALL/usr/bin
  fi
  # dtach
  if [ "$ENABLE_DTACH" = "yes" ]; then
    cp -P $(get_build_dir dtach)/.$TARGET_NAME/dtach $INSTALL/usr/bin
  fi
  # efibootmgr
  if [ "$ENABLE_EFIBOOTMGR" = "yes" ]; then
    cp -P $(get_build_dir efibootmgr)/src/efibootmgr $INSTALL/usr/bin 2>/dev/null || :
  fi
  # encfs
  if [ "$ENABLE_ENCFS" = "yes" ]; then
    cp -P $(get_build_dir encfs)/.$TARGET_NAME/encfs $INSTALL/usr/bin
    cp -P $(get_build_dir encfs)/.$TARGET_NAME/encfsctl $INSTALL/usr/bin
  fi
  # evtest
  if [ "$ENABLE_EVTEST" = "yes" ]; then
    cp -P $(get_build_dir evtest)/.$TARGET_NAME/evtest $INSTALL/usr/bin
  fi
  # fdupes
  if [ "$ENABLE_FDUPES" = "yes" ]; then
    cp -P $(get_build_dir fdupes)/fdupes $INSTALL/usr/bin
  fi
  # file
  if [ "$ENABLE_FILE" = "yes" ]; then
    cp -P $(get_build_dir file)/.$TARGET_NAME/src/file $INSTALL/usr/bin
    mkdir -p $INSTALL/usr/data/
    cp -P $(get_build_dir file)/.$TARGET_NAME/magic/magic.mgc $INSTALL/usr/data
  fi
  # getscancodes
  if [ "$ENABLE_GETSCANCODES" = "yes" ]; then
    cp -P $(get_build_dir getscancodes)/getscancodes $INSTALL/usr/bin
  fi
  # hddtemp
  if [ "$ENABLE_HDDTEMP" = "yes" ]; then
    cp -P $(get_build_dir hddtemp)/.$TARGET_NAME/src/hddtemp $INSTALL/usr/bin
    mkdir -p $INSTALL/etc
    cp -P $(get_build_dir hddtemp)/hddtemp.db $INSTALL/etc
  fi
  # hd-idle
  if [ "$ENABLE_HD_IDLE" = "yes" ]; then
    cp -P $(get_build_dir hd-idle)/hd-idle $INSTALL/usr/bin
  fi
  # hid_mapper
  if [ "$ENABLE_HID_MAPPER" = "yes" ]; then
    cp -P $(get_build_dir hid_mapper)/hid_mapper $INSTALL/usr/bin
  fi
  # htop
  if [ "$ENABLE_HTOP" = "yes" ]; then
    cp -P $(get_build_dir htop)/.install_pkg/usr/bin/htop $INSTALL/usr/bin
  fi
  # i2c-tools
  if [ "$ENABLE_I2C_TOOLS" = "yes" ]; then
    cp -P $(get_build_dir i2c-tools)/tools/i2cdetect $INSTALL/usr/bin
    cp -P $(get_build_dir i2c-tools)/tools/i2cdump $INSTALL/usr/bin
    cp -P $(get_build_dir i2c-tools)/tools/i2cget $INSTALL/usr/bin
    cp -P $(get_build_dir i2c-tools)/tools/i2cset $INSTALL/usr/bin
    cp -P $(get_build_dir i2c-tools)/py-smbus/build/lib.linux-*/smbus.so $INSTALL/usr/lib
  fi
  # inotify-tools
  if [ "$ENABLE_INOTIFY_TOOLS" = "yes" ]; then
    cp -P $(get_build_dir inotify-tools)/.$TARGET_NAME/src/inotifywait $INSTALL/usr/bin
    cp -P $(get_build_dir inotify-tools)/.$TARGET_NAME/src/inotifywatch $INSTALL/usr/bin
  fi
  # jq
  if [ "$ENABLE_JQ" = "yes" ]; then
    cp -P $(get_build_dir jq)/.$TARGET_NAME/jq $INSTALL/usr/bin
    cp -P $(get_build_dir oniguruma)/.install_pkg/usr/lib/libonig.so $INSTALL/usr/lib
  fi
  # lm_sensors
  if [ "$ENABLE_LM_SENSORS" = "yes" ]; then
    cp -P $(get_build_dir lm_sensors)/prog/sensors/sensors $INSTALL/usr/bin 2>/dev/null || :
  fi
  # lshw
  if [ "$ENABLE_LSHW" = "yes" ]; then
    cp -P $(get_build_dir lshw)/src/lshw $INSTALL/usr/bin
  fi
  # mc
  if [ "$ENABLE_MC" = "yes" ]; then
    cp -PR  $(get_build_dir mc)/.install_pkg/* $INSTALL
    mkdir -p $INSTALL/usr/share/mc/bin
    ln -s /usr/libexec/mc/mc-wrapper.csh $INSTALL/usr/share/mc/bin/mc-wrapper.csh
    ln -s /usr/libexec/mc/mc-wrapper.sh $INSTALL/usr/share/mc/bin/mc-wrapper.sh
    ln -s /usr/libexec/mc/mc.csh $INSTALL/usr/share/mc/bin/mc.csh
    ln -s /usr/libexec/mc/mc.sh $INSTALL/usr/share/mc/bin/mc.sh
    mkdir -p $INSTALL/usr/share/locale
    for fgmo in `ls $(get_build_dir mc)/po/*.gmo`;do
      fname=`basename $fgmo .gmo`
      mkdir -p $INSTALL/usr/share/locale/$fname
      mkdir -p $INSTALL/usr/share/locale/$fname/LC_MESSAGES
      cp -p $fgmo $INSTALL/usr/share/locale/$fname/LC_MESSAGES/mc.mo
    done
  fi
  # mrxvt
  if [ "$ENABLE_MRXVT" = "yes" ]; then
    cp -P $(get_build_dir mrxvt)/.$TARGET_NAME/src/mrxvt $INSTALL/usr/bin 2>/dev/null || :
  fi
  # mtpfs
  if [ "$ENABLE_MTPFS" = "yes" ]; then
    cp -P $(get_build_dir mtpfs)/.$TARGET_NAME/mtpfs $INSTALL/usr/bin/
  fi
  # nmon
  if [ "$ENABLE_NMON" = "yes" ]; then
    cp -P $(get_build_dir nmon)/nmon $INSTALL/usr/bin/
  fi
  # p7zip
  if [ "$ENABLE_P7ZIP" = "yes" ]; then
    cp -P $(get_build_dir p7zip)/bin/7z.so $INSTALL/usr/bin
    cp -PR $(get_build_dir p7zip)/bin/Codecs $INSTALL/usr/bin
    cp -P $(get_build_dir p7zip)/bin/7z $INSTALL/usr/bin
    cp -P $(get_build_dir p7zip)/bin/7za $INSTALL/usr/bin
  fi
  # patch
  if [ "$ENABLE_PATCH" = "yes" ]; then
    cp -P $(get_build_dir patch)/.$TARGET_NAME/src/patch $INSTALL/usr/bin
  fi
  # pv
  if [ "$ENABLE_PV" = "yes" ]; then
    cp -P $(get_build_dir pv)/.$TARGET_NAME/pv $INSTALL/usr/bin
  fi
  # screen
  if [ "$ENABLE_SCREEN" = "yes" ]; then
    cp -P $(get_build_dir screen)/screen $INSTALL/usr/bin
  fi
  # smartmontools
  if [ "$ENABLE_SMARTMONTOOLS" = "yes" ]; then
    cp -P $(get_build_dir smartmontools)/.$TARGET_NAME/smartctl $INSTALL/usr/bin
  fi
  # strace
  if [ "$ENABLE_STRACE" = "yes" ]; then
    cp -P $(get_build_dir strace)/.$TARGET_NAME/strace $INSTALL/usr/bin
  fi
  # strace-ng
  if [ "$ENABLE_STRACE_NG" = "yes" ]; then
    cp -P $(get_build_dir stress-ng)/.install_pkg/usr/bin/stress-ng $INSTALL/usr/bin
  fi
  # unrar
  if [ "$ENABLE_UNRAR" = "yes" ]; then
    cp -P $(get_build_dir unrar)/unrar $INSTALL/usr/bin
  fi
  # usb-modeswitch
  if [ "$ENABLE_USB_MODESWITCH" = "yes" ]; then
    cp -P $(get_build_dir usb-modeswitch)/usb_modeswitch $INSTALL/usr/bin
  fi
  # vim
  if [ "$ENABLE_VIM" = "yes" ]; then
    cp -P $(get_build_dir vim)/.install_pkg/usr/bin/vim $INSTALL/usr/bin
  fi
}