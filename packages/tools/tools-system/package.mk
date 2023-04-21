# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)

PKG_NAME="tools-system"
PKG_VERSION="1.0"
PKG_LICENSE="GPL"
PKG_SITE=""
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="This bundle currently includes 7-zip, autossh, bottom, diffutils, dstat, dtach, efibootmgr, encfs, evtest, fdupes, file, getscancodes, hddtemp, hd-idle, hid_mapper, htop, i2c-tools, inotify-tools, jq, libgpiod, lm_sensors, lshw, mc, mmc-utils, mtpfs, nmon, patch, pv, screen, smartmontools, stress-ng, unrar, usb-modeswitch and vim."
PKG_TOOLCHAIN="manual"

ENABLE_7ZIP="yes"
ENABLE_AUTOSSH="yes"
ENABLE_BOTTOM="yes"
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
ENABLE_LIBGPIOD="yes"
ENABLE_LM_SENSORS="yes"
ENABLE_LSHW="yes"
ENABLE_MC="yes"
ENABLE_MMC_UTILS="yes"
ENABLE_MTPFS="yes"
ENABLE_NMON="yes"
ENABLE_PATCH="yes"
ENABLE_PV="yes"
ENABLE_SCREEN="yes"
ENABLE_SDPARM="yes"
ENABLE_SMARTMONTOOLS="yes"
ENABLE_STRACE_NG="yes"
ENABLE_UNRAR="yes"
ENABLE_USB_MODESWITCH="no"
ENABLE_VIM="yes"

if [ "${ENABLE_7ZIP}" = "yes" ]; then
  PKG_DEPENDS_TARGET+=" 7-zip"
fi

if [ "${ENABLE_AUTOSSH}" = "yes" ]; then
  PKG_DEPENDS_TARGET+=" autossh"
fi

if [ "${ENABLE_BOTTOM}" = "yes" ]; then
  PKG_DEPENDS_TARGET+=" bottom"
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

if [ "${ENABLE_LIBGPIOD}" = "yes" ]; then
  PKG_DEPENDS_TARGET+=" libgpiod"
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

if [ "${ENABLE_MMC_UTILS}" = "yes" ]; then
  PKG_DEPENDS_TARGET+=" mmc-utils"
fi

if [ "${ENABLE_MTPFS}" = "yes" ]; then
  PKG_DEPENDS_TARGET+=" mtpfs"
fi

if [ "${ENABLE_NMON}" = "yes" ]; then
  PKG_DEPENDS_TARGET+=" nmon"
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

if [ "${ENABLE_SDPARM}" = "yes" ]; then
  PKG_DEPENDS_TARGET+=" sdparm"
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

if [ "${TARGET_ARCH}" = "x86_64" ]; then
  PKG_DEPENDS_TARGET+=" efibootmgr st"
fi

post_install() {
  mkdir -p ${INSTALL}/usr/{bin,lib}

  # 7-zip
  if [ "${ENABLE_7ZIP}" = "yes" ]; then
    cp -P $(get_install_dir 7-zip)/usr/bin/7zz ${INSTALL}/usr/bin
    cp -P ${PKG_DIR}/scripts/* ${INSTALL}/usr/bin
  fi

  # autossh
  if [ "${ENABLE_AUTOSSH}" = "yes" ]; then
    cp -P $(get_install_dir autossh)/usr/bin/autossh ${INSTALL}/usr/bin
  fi

  # bottom
  if [ "${ENABLE_BOTTOM}" = "yes" ]; then
    cp -P $(get_install_dir bottom)/btm ${INSTALL}/usr/bin 2>/dev/null || :
  fi

  # diffutils
  if [ "${ENABLE_DIFFUTILS}" = "yes" ]; then
    cp -P $(get_install_dir diffutils)/usr/bin/{cmp,diff,diff3,sdiff} ${INSTALL}/usr/bin
  fi

  # dstat
  if [ "${ENABLE_DSTAT}" = "yes" ]; then
    cp -P $(get_install_dir dstat)/usr/bin/dstat ${INSTALL}/usr/bin
  fi

  # dtach
  if [ "${ENABLE_DTACH}" = "yes" ]; then
    cp -P $(get_install_dir dtach)/usr/bin/dtach ${INSTALL}/usr/bin
  fi

  # efibootmgr
  if [ "${TARGET_ARCH}" = "x86_64" ]; then
    cp -P $(get_install_dir efibootmgr)/usr/bin/efibootmgr ${INSTALL}/usr/bin 2>/dev/null || :
  fi

  # encfs
  if [ "${ENABLE_ENCFS}" = "yes" ]; then
    cp -P $(get_install_dir encfs)/usr/bin/{encfs,encfsctl} ${INSTALL}/usr/bin
  fi

  # evtest
  if [ "${ENABLE_EVTEST}" = "yes" ]; then
    cp -P $(get_install_dir evtest)/usr/bin/evtest ${INSTALL}/usr/bin
  fi

  # fdupes
  if [ "${ENABLE_FDUPES}" = "yes" ]; then
    cp -P $(get_install_dir fdupes)/usr/bin/fdupes ${INSTALL}/usr/bin
  fi

  # file
  if [ "${ENABLE_FILE}" = "yes" ]; then
    cp -P $(get_install_dir file)/usr/bin/file ${INSTALL}/usr/bin
    mkdir -p ${INSTALL}/usr/data/usr/share/misc
    cp -P $(get_install_dir file)/usr/share/misc/magic.mgc ${INSTALL}/usr/data/usr/share/misc
  fi

  # fuse
  cp -P $(get_install_dir fuse)/usr/bin/{fusermount,ulockmgr_server} ${INSTALL}/usr/bin
  cp -P $(get_install_dir fuse)/usr/sbin/mount.fuse ${INSTALL}/usr/bin
  cp -P $(get_install_dir fuse)/usr/lib/{libfuse.so*,libulockmgr.so*} ${INSTALL}/usr/lib

  # getscancodes
  if [ "${ENABLE_GETSCANCODES}" = "yes" ]; then
    cp -P $(get_install_dir getscancodes)/usr/bin/getscancodes ${INSTALL}/usr/bin
  fi

  # hddtemp
  if [ "${ENABLE_HDDTEMP}" = "yes" ]; then
    cp -P $(get_install_dir hddtemp)/usr/sbin/hddtemp ${INSTALL}/usr/bin
    mkdir -p ${INSTALL}/etc
    cp -P $(get_install_dir hddtemp)/usr/share/misc/hddtemp.db ${INSTALL}/etc
  fi

  # hd-idle
  if [ "${ENABLE_HD_IDLE}" = "yes" ]; then
    cp -P $(get_install_dir hd-idle)/usr/sbin/hd-idle ${INSTALL}/usr/bin
  fi

  # hid_mapper
  if [ "${ENABLE_HID_MAPPER}" = "yes" ]; then
    cp -P $(get_install_dir hid_mapper)/usr/bin/hid_mapper ${INSTALL}/usr/bin
  fi

  # htop
  if [ "${ENABLE_HTOP}" = "yes" ]; then
    cp -P $(get_install_dir htop)/usr/bin/htop ${INSTALL}/usr/bin
  fi

  # i2c-tools
  if [ "${ENABLE_I2C_TOOLS}" = "yes" ]; then
    cp -P $(get_install_dir i2c-tools)/usr/sbin/{i2cdetect,i2cdump,i2cget,i2cset} ${INSTALL}/usr/bin
    cp -P $(get_install_dir i2c-tools)/usr/lib/${PKG_PYTHON_VERSION}/site-packages/smbus.so ${INSTALL}/usr/lib
    cp -P $(get_install_dir i2c-tools)/usr/lib/libi2c.so.0.1.1 ${INSTALL}/usr/lib/libi2c.so
    cp -P $(get_install_dir i2c-tools)/usr/lib/libi2c.so.0.1.1 ${INSTALL}/usr/lib/libi2c.so.0
    cp -P $(get_install_dir i2c-tools)/usr/lib/libi2c.so.0.1.1 ${INSTALL}/usr/lib/libi2c.so.0.1.1
  fi

  # inotify-tools
  if [ "${ENABLE_INOTIFY_TOOLS}" = "yes" ]; then
    cp -P $(get_install_dir inotify-tools)/usr/bin/{inotifywait,inotifywatch} ${INSTALL}/usr/bin
  fi

  # jq
  if [ "${ENABLE_JQ}" = "yes" ]; then
    cp -P $(get_install_dir jq)/usr/bin/jq ${INSTALL}/usr/bin
    cp -P $(get_install_dir oniguruma)/usr/lib/{libonig.so,libonig.so.5,libonig.so.5.*.*} ${INSTALL}/usr/lib
  fi

  # libgpiod
  if [ "${ENABLE_LIBGPIOD}" = "yes" ]; then
    cp -P $(get_install_dir libgpiod)/usr/bin/{gpiodetect,gpiofind,gpioget,gpioinfo,gpiomon,gpioset} ${INSTALL}/usr/bin
  fi

  # lm_sensors
  if [ "${ENABLE_LM_SENSORS}" = "yes" ]; then
    cp -P $(get_install_dir lm_sensors)/usr/bin/sensors ${INSTALL}/usr/bin
  fi

  # lshw
  if [ "${ENABLE_LSHW}" = "yes" ]; then
    cp -P $(get_install_dir lshw)/usr/sbin/lshw ${INSTALL}/usr/bin
  fi

  # mc
  if [ "${ENABLE_MC}" = "yes" ]; then
    cp -PR  $(get_install_dir mc)/usr/bin/* ${INSTALL}/usr/bin/
    mkdir -p ${INSTALL}/etc
    cp -Pa $(get_install_dir mc)/storage/.kodi/addons/tools.system-tools/etc/* ${INSTALL}/etc
    mkdir -p ${INSTALL}/usr/share/mc
    cp -Pa $(get_install_dir mc)/storage/.kodi/addons/tools.system-tools/share/mc/* ${INSTALL}/usr/share/mc
    mkdir -p ${INSTALL}/usr/lib/mc
    cp -Pa $(get_install_dir mc)/storage/.kodi/addons/tools.system-tools/lib/mc/* ${INSTALL}/usr/lib/mc
    mkdir -p ${INSTALL}/usr/share/mc/bin
    ln -s /usr/lib/mc/mc-wrapper.csh ${INSTALL}/usr/share/mc/bin/mc-wrapper.csh
    ln -s /usr/lib/mc/mc-wrapper.sh ${INSTALL}/usr/share/mc/bin/mc-wrapper.sh
    ln -s /usr/lib/mc/mc.csh ${INSTALL}/usr/share/mc/bin/mc.csh
    ln -s /usr/lib/mc/mc.sh ${INSTALL}/usr/share/mc/bin/mc.sh
    mkdir -p ${INSTALL}/usr/share/locale
    cp -Pa $(get_install_dir mc)/storage/.kodi/addons/tools.system-tools/share/locale/* ${INSTALL}/usr/share/locale
  fi

  # mmc-utils
  if [ "${ENABLE_MMC_UTILS}" = "yes" ]; then
    cp -P $(get_install_dir mmc-utils)/usr/local/bin/mmc ${INSTALL}/usr/bin
  fi

  # mtpfs
  if [ "${ENABLE_MTPFS}" = "yes" ]; then
    cp -P $(get_install_dir mtpfs)/usr/bin/mtpfs ${INSTALL}/usr/bin/
  fi

  # nmon
  if [ "${ENABLE_NMON}" = "yes" ]; then
    cp -P $(get_install_dir nmon)/usr/bin/nmon ${INSTALL}/usr/bin/
  fi

  # patch
  if [ "${ENABLE_PATCH}" = "yes" ]; then
    cp -P $(get_install_dir patch)/usr/bin/patch ${INSTALL}/usr/bin
  fi

  # pv
  if [ "${ENABLE_PV}" = "yes" ]; then
    cp -P $(get_install_dir pv)/usr/bin/pv ${INSTALL}/usr/bin
  fi

  # screen
  if [ "${ENABLE_SCREEN}" = "yes" ]; then
    cp -P $(get_install_dir screen)/usr/bin/screen ${INSTALL}/usr/bin
  fi

  # sdparm
  if [ "${ENABLE_SDPARM}" = "yes" ]; then
    cp -P $(get_install_dir sdparm)/usr/bin/sdparm ${INSTALL}/usr/bin
  fi

  # smartmontools
  if [ "${ENABLE_SMARTMONTOOLS}" = "yes" ]; then
    cp -P $(get_install_dir smartmontools)/usr/sbin/smartctl ${INSTALL}/usr/bin
  fi

  # st
  if [ "${TARGET_ARCH}" = "x86_64" ]; then
    cp -P $(get_build_dir st)/st ${INSTALL}/usr/bin 2>/dev/null || :
  fi

  # strace-ng
  if [ "${ENABLE_STRACE_NG}" = "yes" ]; then
    cp -P $(get_install_dir stress-ng)/usr/bin/stress-ng ${INSTALL}/usr/bin
  fi

  # unrar
  if [ "${ENABLE_UNRAR}" = "yes" ]; then
    cp -P $(get_install_dir unrar)/usr/bin/unrar ${INSTALL}/usr/bin
  fi

  # usb-modeswitch
  if [ "${ENABLE_USB_MODESWITCH}" = "yes" ]; then
    cp -P $(get_install_dir usb-modeswitch)/usr/sbin/usb_modeswitch ${INSTALL}/usr/bin
  fi

  # vim
  if [ "${ENABLE_VIM}" = "yes" ]; then
    cp -P $(get_install_dir vim)/usr/bin/vim ${INSTALL}/usr/bin
    mkdir -p ${INSTALL}/usr/share
    cp -Pa $(get_install_dir vim)/storage/.kodi/addons/tools.system-tools/share/* ${INSTALL}/usr/share
  fi
}
