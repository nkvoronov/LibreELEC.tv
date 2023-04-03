# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="system-tools"
PKG_VERSION="1.0"
PKG_REV="0"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://libreelec.tv"
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="virtual"
PKG_SHORTDESC="A bundle of system tools and programs"
PKG_LONGDESC="This bundle currently includes 7-zip, autossh, bottom, diffutils, dstat, dtach, efibootmgr, encfs, evtest, fdupes, file, getscancodes, hddtemp, hd-idle, hid_mapper, htop, i2c-tools, inotify-tools, jq, libgpiod, lm_sensors, lshw, mc, mmc-utils, mtpfs, nmon, patch, pv, screen, smartmontools, stress-ng, unrar, usb-modeswitch and vim."

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="System Tools"
PKG_ADDON_TYPE="xbmc.python.script"

ENABLE_AUTOSSH="yes"
ENABLE_DIFFUTILS="yes"
ENABLE_DSTAT="yes"
ENABLE_DTACH="yes"
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
ENABLE_MTPFS="yes"
ENABLE_NMON="yes"
ENABLE_P7ZIP="yes"
ENABLE_PATCH="yes"
ENABLE_PV="yes"
ENABLE_SCREEN="yes"
ENABLE_SMARTMONTOOLS="yes"
ENABLE_STRACE_NG="yes"
ENABLE_UNRAR="yes"
ENABLE_USB_MODESWITCH="no"
ENABLE_VIM="yes"

if [ "${ENABLE_AUTOSSH}" = "yes" ]; then
  PKG_DEPENDS_TARGET+=" autossh"
fi

if [ "${ENABLE_DIFFUTILS}" = "yes" ]; then
  PKG_DEPENDS_TARGET+=" diffutils"
fi

if [ "${ENABLE_DSTAT}" = "yes" ]; then
  PKG_DEPENDS_TARGET+=" dstat"
fi

if [ "${ENABLE_DTACH}" = "yes" ]; then
  PKG_DEPENDS_TARGET+=" dtach"
fi

if [ "${ENABLE_ENCFS}" = "yes" ]; then
  PKG_DEPENDS_TARGET+=" encfs"
fi

if [ "${ENABLE_EVTEST}" = "yes" ]; then
  PKG_DEPENDS_TARGET+=" evtest"
fi

if [ "${ENABLE_FDUPES}" = "yes" ]; then
  PKG_DEPENDS_TARGET+=" fdupes"
fi

if [ "${ENABLE_FILE}" = "yes" ]; then
  PKG_DEPENDS_TARGET+=" file"
fi

if [ "${ENABLE_GETSCANCODES}" = "yes" ]; then
  PKG_DEPENDS_TARGET+=" getscancodes"
fi

if [ "${ENABLE_HDDTEMP}" = "yes" ]; then
  PKG_DEPENDS_TARGET+=" hddtemp"
fi

if [ "${ENABLE_HD_IDLE}" = "yes" ]; then
  PKG_DEPENDS_TARGET+=" hd-idle"
fi

if [ "${ENABLE_HID_MAPPER}" = "yes" ]; then
  PKG_DEPENDS_TARGET+=" hid_mapper"
fi

if [ "${ENABLE_HTOP}" = "yes" ]; then
  PKG_DEPENDS_TARGET+=" htop"
fi

if [ "${ENABLE_I2C_TOOLS}" = "yes" ]; then
  PKG_DEPENDS_TARGET+=" i2c-tools"
fi

if [ "${ENABLE_INOTIFY_TOOLS}" = "yes" ]; then
  PKG_DEPENDS_TARGET+=" inotify-tools"
fi

if [ "${ENABLE_JQ}" = "yes" ]; then
  PKG_DEPENDS_TARGET+=" jq"
fi

if [ "${ENABLE_LM_SENSORS}" = "yes" ]; then
  PKG_DEPENDS_TARGET+=" lm_sensors"
fi

if [ "${ENABLE_LSHW}" = "yes" ]; then
  PKG_DEPENDS_TARGET+=" lshw"
fi

if [ "${ENABLE_MC}" = "yes" ]; then
  PKG_DEPENDS_TARGET+=" mc"
fi

if [ "${ENABLE_MTPFS}" = "yes" ]; then
  PKG_DEPENDS_TARGET+=" mtpfs"
fi

if [ "${ENABLE_NMON}" = "yes" ]; then
  PKG_DEPENDS_TARGET+=" nmon"
fi

if [ "${ENABLE_P7ZIP}" = "yes" ]; then
  PKG_DEPENDS_TARGET+=" p7zip"
fi

if [ "${ENABLE_PATCH}" = "yes" ]; then
  PKG_DEPENDS_TARGET+=" patch"
fi

if [ "${ENABLE_PV}" = "yes" ]; then
  PKG_DEPENDS_TARGET+=" pv"
fi

if [ "${ENABLE_SCREEN}" = "yes" ]; then
  PKG_DEPENDS_TARGET+=" screen"
fi

if [ "${ENABLE_SMARTMONTOOLS}" = "yes" ]; then
  PKG_DEPENDS_TARGET+=" smartmontools"
fi

if [ "${ENABLE_STRACE_NG}" = "yes" ]; then
  PKG_DEPENDS_TARGET+=" stress-ng"
fi

if [ "${ENABLE_UNRAR}" = "yes" ]; then
  PKG_DEPENDS_TARGET+=" unrar"
fi

if [ "${ENABLE_USB_MODESWITCH}" = "yes" ]; then
  PKG_DEPENDS_TARGET+=" usb-modeswitch"
fi

if [ "${ENABLE_VIM}" = "yes" ]; then
  PKG_DEPENDS_TARGET+=" vim"
fi

addon() {
  mkdir -p ${ADDON_BUILD}/${PKG_ADDON_ID}/{bin,lib}
  # autossh
  if [ "${ENABLE_AUTOSSH}" = "yes" ]; then
    cp -P $(get_install_dir autossh)/usr/bin/autossh ${ADDON_BUILD}/${PKG_ADDON_ID}/bin
  fi
  # diffutils
  if [ "${ENABLE_DIFFUTILS}" = "yes" ]; then
    cp -P $(get_install_dir diffutils)/usr/bin/{cmp,diff,diff3,sdiff} ${ADDON_BUILD}/${PKG_ADDON_ID}/bin
  fi
  # dstat
  if [ "${ENABLE_DSTAT}" = "yes" ]; then
    cp -P $(get_install_dir dstat)/usr/bin/dstat ${ADDON_BUILD}/${PKG_ADDON_ID}/bin
  fi
  # dtach
  if [ "${ENABLE_DTACH}" = "yes" ]; then
    cp -P $(get_install_dir dtach)/usr/bin/dtach ${ADDON_BUILD}/${PKG_ADDON_ID}/bin
  fi
  # encfs
  if [ "${ENABLE_ENCFS}" = "yes" ]; then
    cp -P $(get_install_dir encfs)/usr/bin/{encfs,encfsctl} ${ADDON_BUILD}/${PKG_ADDON_ID}/bin
  fi
  # evtest
  if [ "${ENABLE_EVTEST}" = "yes" ]; then
    cp -P $(get_install_dir evtest)/usr/bin/evtest ${ADDON_BUILD}/${PKG_ADDON_ID}/bin
  fi
  # fdupes
  if [ "${ENABLE_FDUPES}" = "yes" ]; then
    cp -P $(get_install_dir fdupes)/usr/bin/fdupes ${ADDON_BUILD}/${PKG_ADDON_ID}/bin
  fi
  # file
  if [ "${ENABLE_FILE}" = "yes" ]; then
    cp -P $(get_install_dir file)/usr/bin/file ${ADDON_BUILD}/${PKG_ADDON_ID}/bin
    mkdir -p ${ADDON_BUILD}/${PKG_ADDON_ID}/data
    cp -P $(get_install_dir file)/usr/share/misc/magic.mgc ${ADDON_BUILD}/${PKG_ADDON_ID}/data
  fi
  # getscancodes
  if [ "${ENABLE_GETSCANCODES}" = "yes" ]; then
    cp -P $(get_install_dir getscancodes)/usr/bin/getscancodes ${ADDON_BUILD}/${PKG_ADDON_ID}/bin
  fi
  # hddtemp
  if [ "${ENABLE_HDDTEMP}" = "yes" ]; then
    cp -P $(get_install_dir hddtemp)/usr/sbin/hddtemp ${ADDON_BUILD}/${PKG_ADDON_ID}/bin
    mkdir -p ${ADDON_BUILD}/${PKG_ADDON_ID}/data
    cp -P $(get_install_dir hddtemp)/usr/share/misc/hddtemp.db ${INSTALL}/date
  fi
  # hd-idle
  if [ "${ENABLE_HD_IDLE}" = "yes" ]; then
    cp -P $(get_install_dir hd-idle)/usr/sbin/hd-idle ${ADDON_BUILD}/${PKG_ADDON_ID}/bin
  fi
  # hid_mapper
  if [ "${ENABLE_HID_MAPPER}" = "yes" ]; then
    cp -P $(get_install_dir hid_mapper)/usr/bin/hid_mapper ${ADDON_BUILD}/${PKG_ADDON_ID}/bin
  fi
  # htop
  if [ "${ENABLE_HTOP}" = "yes" ]; then
    cp -P $(get_install_dir htop)/usr/bin/htop ${ADDON_BUILD}/${PKG_ADDON_ID}/bin
  fi
  # i2c-tools
  if [ "${ENABLE_I2C_TOOLS}" = "yes" ]; then
    cp -P $(get_install_dir i2c-tools)/usr/sbin/{i2cdetect,i2cdump,i2cget,i2cset} $INSTALL/usr/bin
    cp -P $(get_install_dir i2c-tools)/usr/lib/${PKG_PYTHON_VERSION}/site-packages/smbus.so ${ADDON_BUILD}/${PKG_ADDON_ID}/lib
    cp -P $(get_install_dir i2c-tools)/usr/lib/libi2c.so.0.1.1 ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/libi2c.so
    cp -P $(get_install_dir i2c-tools)/usr/lib/libi2c.so.0.1.1 ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/libi2c.so.0
    cp -P $(get_install_dir i2c-tools)/usr/lib/libi2c.so.0.1.1 ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/libi2c.so.0.1.1
  fi
  # inotify-tools
  if [ "${ENABLE_INOTIFY_TOOLS}" = "yes" ]; then
    cp -P $(get_install_dir inotify-tools)/usr/bin/{inotifywait,inotifywatch} ${ADDON_BUILD}/${PKG_ADDON_ID}/bin
  fi
  # jq
  if [ "${ENABLE_JQ}" = "yes" ]; then
    cp -P $(get_install_dir jq)/usr/bin/jq ${ADDON_BUILD}/${PKG_ADDON_ID}/bin
    cp -P $(get_install_dir oniguruma)/usr/lib/{libonig.so,libonig.so.5,libonig.so.5.2.0} ${ADDON_BUILD}/${PKG_ADDON_ID}/lib
  fi
  # lm_sensors
  if [ "${ENABLE_LM_SENSORS}" = "yes" ]; then
    cp -P $(get_install_dir lm_sensors)/usr/bin/sensors ${ADDON_BUILD}/${PKG_ADDON_ID}/bin
  fi
  # lshw
  if [ "${ENABLE_LSHW}" = "yes" ]; then
    cp -P $(get_install_dir lshw)/usr/sbin/lshw ${ADDON_BUILD}/${PKG_ADDON_ID}/bin
  fi
  # mc
  if [ "${ENABLE_MC}" = "yes" ]; then
    cp -a $(get_install_dir mc)/usr/bin/* ${ADDON_BUILD}/${PKG_ADDON_ID}/bin/
    cp -PR  $(get_install_dir mc)/usr/lib/* ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/
    cp -PR  $(get_install_dir mc)/etc/* ${ADDON_BUILD}/${PKG_ADDON_ID}/data/
    mkdir -p ${ADDON_BUILD}/${PKG_ADDON_ID}/share/
      cp -PR  $(get_install_dir mc)/usr/share/* ${ADDON_BUILD}/${PKG_ADDON_ID}/share/
  fi
  # mtpfs
  if [ "${ENABLE_MTPFS}" = "yes" ]; then
    cp -P $(get_install_dir mtpfs)/usr/bin/mtpfs ${ADDON_BUILD}/${PKG_ADDON_ID}/bin/
  fi
  # nmon
  if [ "${ENABLE_NMON}" = "yes" ]; then
    cp -P $(get_install_dir nmon)/usr/bin/nmon ${ADDON_BUILD}/${PKG_ADDON_ID}/bin/
  fi
  # p7zip
  if [ "${ENABLE_P7ZIP}" = "yes" ]; then
    mkdir -p ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/p7zip
    cp -P $(get_install_dir p7zip)/usr/bin/{7z,7za,7z.so} ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/p7zip
    cp -PR $(get_install_dir p7zip)/usr/bin/Codecs ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/p7zip
  fi
  # patch
  if [ "${ENABLE_PATCH}" = "yes" ]; then
    cp -P $(get_install_dir patch)/usr/bin/patch ${ADDON_BUILD}/${PKG_ADDON_ID}/bin
  fi
  # pv
  if [ "${ENABLE_PV}" = "yes" ]; then
    cp -P $(get_install_dir pv)/usr/bin/pv ${ADDON_BUILD}/${PKG_ADDON_ID}/bin
  fi
  # screen
  if [ "${ENABLE_SCREEN}" = "yes" ]; then
    cp -P $(get_install_dir screen)/usr/bin/screen-4.8.0 ${ADDON_BUILD}/${PKG_ADDON_ID}/bin/screen
  fi
  # smartmontools
  if [ "${ENABLE_SMARTMONTOOLS}" = "yes" ]; then
    cp -P $(get_install_dir smartmontools)/usr/sbin/smartctl ${ADDON_BUILD}/${PKG_ADDON_ID}/bin
  fi
  # strace-ng
  if [ "${ENABLE_STRACE_NG}" = "yes" ]; then
    cp -P $(get_install_dir stress-ng)/usr/bin/stress-ng ${ADDON_BUILD}/${PKG_ADDON_ID}/bin
  fi
  # unrar
  if [ "${ENABLE_UNRAR}" = "yes" ]; then
    cp -P $(get_install_dir unrar)/usr/bin/unrar ${ADDON_BUILD}/${PKG_ADDON_ID}/bin
  fi
  # usb-modeswitch
  if [ "${ENABLE_USB_MODESWITCH}" = "yes" ]; then
    cp -P $(get_install_dir usb-modeswitch)/usr/sbin/usb_modeswitch ${ADDON_BUILD}/${PKG_ADDON_ID}/bin
  fi
  # vim
  if [ "${ENABLE_VIM}" = "yes" ]; then
    cp -P $(get_install_dir vim)/usr/bin/vim ${ADDON_BUILD}/${PKG_ADDON_ID}/bin
  fi
}
