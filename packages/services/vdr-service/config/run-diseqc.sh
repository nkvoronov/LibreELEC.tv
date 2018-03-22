#!/bin/sh

#MCPC_SETTINGS="$HOME/.xbmc/userdata/addon_data/os.mcpcvdr.settings/settings.xml"

osd_msg() {
  if [ -z "$2" ]; then
    xbmc-send -a "Notification(DiSEqC, $1, 2000)"
  else
    xbmc-send -a "Notification(DiSEqC, $1, $2)"
  fi
}

#cat "$MCPC_SETTINGS" | awk -F\" '{print $2"=\""$4"\""}' | sed '/^=/d' > /var/config/settings.conf
/etc/vdr/diseqccalc.sh > /etc/vdr/diseqc.conf

osd_msg "DiSEqC completed."
