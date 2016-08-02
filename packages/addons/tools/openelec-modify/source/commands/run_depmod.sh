#!/bin/sh

################################################################################
#      This file is part of OpenELEC - http://www.openelec.tv
#      Copyright (C) 2009-2014 Stephan Raue (stephan@openelec.tv)
#
#  OpenELEC is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 2 of the License, or
#  (at your option) any later version.
#
#  OpenELEC is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with OpenELEC.  If not, see <http://www.gnu.org/licenses/>.
################################################################################

. /etc/profile

WORK_DIR=$1
LINUX_KERNEL=$2

if [ "$WORK_DIR" != "" ]; then
  ln -sf /usr/bin/kmod $WORK_DIR/depmod
  find $WORK_DIR/system.new/lib/modules/$LINUX_KERNEL/ -name *.ko | \
  sed -e "s,$WORK_DIR/system.new/lib/modules/$LINUX_KERNEL/,," > $WORK_DIR/system.new/lib/modules/$LINUX_KERNEL/modules.order
  $WORK_DIR/depmod -b $WORK_DIR/system.new $LINUX_KERNEL
fi