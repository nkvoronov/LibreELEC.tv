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

import os
import sys
import xbmcaddon

__addon__         = xbmcaddon.Addon('tools.openelec-modify')
__cwd__           = __addon__.getAddonInfo('path')
__resources_lib__ = xbmc.translatePath(os.path.join(__cwd__, 'resources', 'lib'))
__settings_xml__  = xbmc.translatePath(os.path.join(__cwd__, 'resources', 'settings.xml'))

if len(sys.argv) == 2 and sys.argv[1] == 'refresh_updates':
  sys.path.append(__resources_lib__)
  from functions import refresh_updates
  refresh_updates(__settings_xml__)
  __addon__.openSettings()
