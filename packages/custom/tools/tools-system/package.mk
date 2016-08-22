################################################################################
#      This file is part of LibreELEC - http://www.libreelec.tv
#      Copyright (C) 2016 Team LibreELEC
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

PKG_NAME="tools-system"
PKG_VERSION="1"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE=""
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain"
PKG_PRIORITY="optional"
PKG_SECTION="tools"
PKG_SHORTDESC="A bundle of system tools and programs"
PKG_LONGDESC="This bundle currently includes autossh, diffutils, dtach, efibootmgr, evtest, fdupes, file, getscancodes, hddtemp, hd-idle, hid_mapper, i2c-tools, jq, lm_sensors, lshw, mrxvt, mtpfs, p7zip, patch, pv, screen, strace, unrar and usb-modeswitch."

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

ENABLE_AUTOSSH="no"
ENABLE_DIFFUTILS="no"
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
ENABLE_JQ="no"
ENABLE_LM_SENSORS="yes"
ENABLE_LSHW="no"
ENABLE_MRXVT="no"
ENABLE_MTPFS="no"
ENABLE_P7ZIP="yes"
ENABLE_PATCH="no"
ENABLE_PV="no"
ENABLE_SCREEN="no"
ENABLE_STRACE="no"
ENABLE_UNRAR="yes"
ENABLE_USB_MODESWITCH="no"
ENABLE_MC="yes"
ENABLE_HTOP="yes"

if [ "$ENABLE_AUTOSSH" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET autossh"
fi

if [ "$ENABLE_DIFFUTILS" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET diffutils"
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

if [ "$ENABLE_JQ" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET jq"
fi

if [ "$ENABLE_LM_SENSORS" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET lm_sensors"
fi

if [ "$ENABLE_LSHW" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET lshw"
fi

if [ "$ENABLE_MRXVT" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET mrxvt"
fi

if [ "$ENABLE_MTPFS" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET mtpfs"
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

if [ "$ENABLE_MC" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET mc"
fi

if [ "$ENABLE_HTOP" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET htop"
fi

make_target() {
  : # nothing to make here
}

makeinstall_target() {
  : # nothing to install here
}

post_install() {

  mkdir -p $INSTALL/
  mkdir -p $INSTALL/usr/bin/
  mkdir -p $INSTALL/usr/lib/

  if [ "$ENABLE_AUTOSSH" = yes ]; then
    cp -P $(get_build_dir autossh)/.$TARGET_NAME/autossh $INSTALL/usr/bin
  fi

  if [ "$ENABLE_DIFFUTILS" = yes ]; then
    cp -P $(get_build_dir diffutils)/.$TARGET_NAME/src/cmp $INSTALL/usr/bin
    cp -P $(get_build_dir diffutils)/.$TARGET_NAME/src/diff $INSTALL/usr/bin
    cp -P $(get_build_dir diffutils)/.$TARGET_NAME/src/diff3 $INSTALL/usr/bin
    cp -P $(get_build_dir diffutils)/.$TARGET_NAME/src/sdiff $INSTALL/usr/bin
  fi

  if [ "$ENABLE_DTACH" = yes ]; then
    cp -P $(get_build_dir dtach)/.$TARGET_NAME/dtach $INSTALL/usr/bin
  fi

  if [ "$ENABLE_EFIBOOTMGR" = yes ]; then
    cp -P $(get_build_dir efibootmgr)/src/efibootmgr/efibootmgr $INSTALL/usr/bin 2>/dev/null || :
  fi

  if [ "$ENABLE_EVTEST" = yes ]; then
    cp -P $(get_build_dir evtest)/.$TARGET_NAME/evtest $INSTALL/usr/bin
  fi

  if [ "$ENABLE_FDUPES" = yes ]; then
    cp -P $(get_build_dir fdupes)/fdupes $INSTALL/usr/bin
  fi

  if [ "$ENABLE_FILE" = yes ]; then    
    cp -P $(get_build_dir file)/.$TARGET_NAME/src/file $INSTALL/usr/bin
    mkdir -p $INSTALL/usr/data/
    cp -P $(get_build_dir file)/.$TARGET_NAME/magic/magic.mgc $INSTALL/usr/data
  fi

  if [ "$ENABLE_GETSCANCODES" = yes ]; then
    cp -P $(get_build_dir getscancodes)/getscancodes $INSTALL/usr/bin
  fi

  if [ "$ENABLE_HDDTEMP" = yes ]; then
    cp -P $(get_build_dir hddtemp)/.$TARGET_NAME/src/hddtemp $INSTALL/usr/bin
  fi

  if [ "$ENABLE_HD_IDLE" = yes ]; then
    cp -P $(get_build_dir hd-idle)/hd-idle $INSTALL/usr/bin
  fi

  if [ "$ENABLE_HID_MAPPER" = yes ]; then
    cp -P $(get_build_dir hid_mapper)/hid_mapper $INSTALL/usr/bin
  fi

  if [ "$ENABLE_I2C_TOOLS" = yes ]; then
    cp -P $(get_build_dir i2c-tools)/tools/i2cdetect $INSTALL/usr/bin
    cp -P $(get_build_dir i2c-tools)/tools/i2cdump $INSTALL/usr/bin
    cp -P $(get_build_dir i2c-tools)/tools/i2cget $INSTALL/usr/bin
    cp -P $(get_build_dir i2c-tools)/tools/i2cset $INSTALL/usr/bin
    cp -P $(get_build_dir i2c-tools)/py-smbus/build/lib.linux-*/smbus.so $INSTALL/usr/lib
  fi

  if [ "$ENABLE_JQ" = yes ]; then
    cp -P $(get_build_dir jq)/.$TARGET_NAME/jq $INSTALL/usr/bin
  fi

  if [ "$ENABLE_LM_SENSORS" = yes ]; then
    cp -P $(get_build_dir lm_sensors)/prog/sensors/sensors $INSTALL/usr/bin 2>/dev/null || :
  fi

  if [ "$ENABLE_LSHW" = yes ]; then
    cp -P $(get_build_dir lshw)/src/lshw $INSTALL/usr/bin
  fi

  if [ "$ENABLE_MRXVT" = yes ]; then
    cp -P $(get_build_dir mrxvt)/.$TARGET_NAME/src/mrxvt $INSTALL/usr/bin 2>/dev/null || :
  fi

  if [ "$ENABLE_MTPFS" = yes ]; then
    cp -P $(get_build_dir mtpfs)/.$TARGET_NAME/mtpfs $INSTALL/usr/bin/
  fi

  if [ "$ENABLE_P7ZIP" = yes ]; then
    cp -P $(get_build_dir p7zip)/bin/7z.so $INSTALL/usr/bin
    cp -PR $(get_build_dir p7zip)/bin/Codecs $INSTALL/usr/bin
    cp -P $(get_build_dir p7zip)/bin/7z $INSTALL/usr/bin
    cp -P $(get_build_dir p7zip)/bin/7za $INSTALL/usr/bin
  fi

  if [ "$ENABLE_PATCH" = yes ]; then
    cp -P $(get_build_dir patch)/.$TARGET_NAME/src/patch $INSTALL/usr/bin
  fi

  if [ "$ENABLE_PV" = yes ]; then
    cp -P $(get_build_dir pv)/.$TARGET_NAME/pv $INSTALL/usr/bin
  fi

  if [ "$ENABLE_SCREEN" = yes ]; then
    cp -P $(get_build_dir screen)/screen $INSTALL/usr/bin
  fi

  if [ "$ENABLE_STRACE" = yes ]; then
    cp -P $(get_build_dir strace)/.$TARGET_NAME/strace $INSTALL/usr/bin
  fi

  if [ "$ENABLE_UNRAR" = yes ]; then
    cp -P $(get_build_dir unrar)/unrar $INSTALL/usr/bin
  fi

  if [ "$ENABLE_USB_MODESWITCH" = yes ]; then
    cp -P $(get_build_dir usb-modeswitch)/usb_modeswitch $INSTALL/usr/bin
  fi

  if [ "$ENABLE_MC" = yes ]; then
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

  if [ "$ENABLE_HTOP" = yes ]; then
    cp -P $(get_build_dir htop)/htop $INSTALL/usr/bin
  fi
}
