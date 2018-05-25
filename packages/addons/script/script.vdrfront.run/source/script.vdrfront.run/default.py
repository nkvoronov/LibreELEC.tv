# -*- coding: utf-8 -*-
# Licence: GPL v.3 http://www.gnu.org/licenses/gpl.html

import os
import xbmcaddon

# Script constants
__addon__ = xbmcaddon.Addon('script.vdrfront.run')
command = __addon__.getSetting('vdr_run_command')

if (__name__ == "__main__"):
    os.system(command)