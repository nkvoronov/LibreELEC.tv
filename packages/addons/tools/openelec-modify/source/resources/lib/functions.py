################################################################################
#      This file is part of OpenELEC - http://www.openelec.tv
#      Copyright (C) 2009-2013 Stephan Raue (stephan@openelec.tv)
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

import xbmc
import xbmcaddon
import xbmcgui
import os
import sys
import re
import traceback
import subprocess
import shutil
import xmlpp
from xml.dom import minidom

__addon__         = xbmcaddon.Addon('tools.openelec-modify')
__cwd__           = __addon__.getAddonInfo('path')
__updates__       = xbmc.translatePath(os.path.join(__cwd__, 'updates'))
__bin__           = xbmc.translatePath(os.path.join(__cwd__, 'bin'))

__workdir__       = __addon__.getSetting("MODIFY_SETUP_DIR")
__backupdir__     = __addon__.getSetting("MODIFY_BACKUP_DIR")
__kernel__        = __addon__.getSetting("CURRENT_KERNEL")
__isbackup__      = __addon__.getSetting("ENABLE_BACKUP")
__isdebug__         = __addon__.getSetting("DEBUG")

######################################################################################################
# dbg_log
def dbg_log(source, text, level=4):
  if __isdebug__ == 'true':
    return
  xbmc.log('## openelec-modify ## ' + source + ' ## ' + text, level)
  xbmc.log(traceback.format_exc())

######################################################################################################
# execute		
def execute(command_line, get_result=0):
  try:
    dbg_log('function::execute', 'enter_function', 0)
    dbg_log('function::execute::command', command_line, 0)
    if get_result == 0:
      process = subprocess.Popen(command_line, shell=True, close_fds=True)
      process.wait()
    else:
      result = ''
      process = subprocess.Popen(command_line, shell=True, close_fds=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
      process.wait()
      for line in process.stdout.readlines():
        result = result + line
      return result
      dbg_log('function::execute', 'exit_function', 0)
  except Exception, e:
    dbg_log('function::execute', 'ERROR: (' + repr(e) + ')')

######################################################################################################
# backup setting.xml file only if backup doesn't exist
def settings_backup(settings_xml):
  try:
    dbg_log('function::settings_backup', 'enter_function', 0)
    with open(settings_xml + '_orig') as f: pass
  except Exception, e:
    shutil.copyfile(settings_xml, settings_xml + '_orig')
    dbg_log('function::settings_backup', 'ERROR: (' + repr(e) + ')')

######################################################################################################
# restore setting.xml file from backup
def settings_restore(settings_xml):
  try:
    dbg_log('function::settings_restore', 'enter_function', 0)
    shutil.copyfile(settings_xml + '_orig', settings_xml)
  except Exception, e:
    dbg_log('function::settings_restore', 'ERROR: (' + repr(e) + ')')

######################################################################################################
# save settings.xml file back
def save_settings(settings_xml, xmldoc):
  try:
    dbg_log('function::save_settings', 'enter_function', 0)
    outputfile = open(settings_xml, 'w')
    xmlpp.pprint(xmldoc.toxml(), output = outputfile, indent=2)
    outputfile.close()
  except Exception, e:
    settings_restore(settings_xml)
    dbg_log('function::save_settings', 'ERROR: (' + repr(e) + ')')

######################################################################################################
# get hdhomerun supported devices on a system (only name like 101ADD2B-0)
def get_updates():
  updates = []
  try:
    dbg_log('function::get_updates', 'enter_function', 0)
    updates = os.listdir(__updates__)
  except Exception, e:
    dbg_log('function::get_updates', 'ERROR: (' + repr(e) + ')')
  return updates

######################################################################################################
# parse settings.xml file
def parse_settings(settings_xml):
  try:
    dbg_log('function::parse_settings', 'enter_function', 0)
    xmldoc = minidom.parse(settings_xml)
    category = xmldoc.getElementsByTagName('category')
    return xmldoc
  except Exception, e:
    dbg_log('function::parse_settings', 'ERROR: (' + repr(e) + ')')
    return None

######################################################################################################
# remove all nodes with id started with UPDATES_
def remove_old_updates(xmldoc):
  try:
    dbg_log('function::remove_old_updates', 'enter_function', 0)
    category = xmldoc.getElementsByTagName('category')
    for node_cat in category:
      setting = node_cat.getElementsByTagName('setting')
      for node_set in setting :
        if 'id' in node_set.attributes.keys() and not node_set.getAttribute('id').find('UPDATES_'):
          node_set.parentNode.removeChild(node_set)
  except Exception, e:
    dbg_log('function::remove_old_updates', 'ERROR: (' + repr(e) + ')')

######################################################################################################
# add new UPDATES_ nodes for available updates
def add_new_updates(xmldoc, updates):
  try:
    dbg_log('function::add_new_updates', 'enter_function', 0)
    category = xmldoc.getElementsByTagName('category')
    for node_cat in category:
      setting = node_cat.getElementsByTagName('setting')
      for node_set in setting :
        if 'label' in node_set.attributes.keys() and '2101' in node_set.getAttribute('label'):
          for ix, update in enumerate(updates):
	    node = xmldoc.createElement("setting")
            node.setAttribute("id", 'UPDATES_' + update)
            node.setAttribute("label", update)
            node.setAttribute("type", 'bool')
            node.setAttribute("default", 'false')
            node_cat.appendChild(node)

  except Exception, e:
    dbg_log('function::add_new_updates', 'ERROR: (' + repr(e) + ')')

######################################################################################################
# refresh updates in settings.xml file
def refresh_updates(settings_xml):
  try:
    dbg_log('function::refresh_updates', 'enter_function', 0)
    settings_backup(settings_xml)
    updates = get_updates()
    xmldoc = parse_settings(settings_xml)
    if xmldoc == None:
      dbg_log('function::refresh_updates', 'No updates found', 0)
    else:
      remove_old_updates(xmldoc)
      add_new_updates(xmldoc, updates)
      save_settings(settings_xml, xmldoc)

  except Exception, e:
    dbg_log('function::refresh_updates', 'ERROR: (' + repr(e) + ')')
