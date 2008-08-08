# -*- shell-script -*-
# Set up to Debug into another script...
#
#   Copyright (C) 2002, 2003, 2004, 2006, 2008 Rocky Bernstein 
#   rocky@gnu.org
#
#   bashdb is free software; you can redistribute it and/or modify it under
#   the terms of the GNU General Public License as published by the Free
#   Software Foundation; either version 2, or (at your option) any later
#   version.
#
#   bashdb is distributed in the hope that it will be useful, but WITHOUT ANY
#   WARRANTY; without even the implied warranty of MERCHANTABILITY or
#   FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
#   for more details.
#   
#   You should have received a copy of the GNU General Public License along
#   with bashdb; see the file COPYING.  If not, write to the Free Software
#   Foundation, 59 Temple Place, Suite 330, Boston, MA 02111 USA.

# TODO: would work better if instead of using $source_line below
# which might have several statements, we could just pick up the next
# single statement.
_Dbg_do_debug() {

  # set -xv
  local script_cmd=${@:-$_Dbg_bash_command}

  # We need to expand variables that might be in $script_cmd.
  # set_Dbg_nested_debug_cmd is set up to to be eval'd below.
  local set_Dbg_debug_cmd="local _Dbg_debug_cmd=\"$script_cmd\"";

  [ -z "$BASH" ] && BASH='bash'

  eval "$_seteglob"
  # Add appropriate bash debugging options
  if [[ $_Dbg_script != 1 ]] ; then
    # Running "bash --debugger", so prepend "bash --debugger"
    set_Dbg_debug_cmd="local _Dbg_debug_cmd=\"$BASH --debugger $script_cmd\"";
  elif [[ $_Dbg_orig_0/// == *bashdb/// ]] ; then
    # Running "bashdb", so prepend "bash bashdb .."
    set_Dbg_debug_cmd="local _Dbg_debug_cmd=\"$BASH $_Dbg_orig_0 -q -L $_Dbg_libdir $script_cmd\"";
  fi
  eval "$_resteglob"
  eval $set_Dbg_debug_cmd

  if (( _Dbg_basename_only )) ; then 
    _Dbg_msg "Debugging new script with $script_cmd"
  else
    _Dbg_msg "Debugging new script with $_Dbg_debug_cmd"
  fi
  local -r old_quit_on_quit=$BASHDB_QUIT_ON_QUIT
  export BASHDB_QUIT_ON_QUIT=1
  export BASHDB_BASENAME_ONLY="$_Dbg_basename_only"
  ((BASHDB_LEVEL++))
  $_Dbg_debug_cmd
  ((BASHDB_LEVEL--))
  export BASHDB_QUIT_ON_QUIT=$old_quit_on_quit
}