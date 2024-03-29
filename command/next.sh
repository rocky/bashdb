# -*- shell-script -*-
# gdb-like "next" (step through) commmand.
#
#   Copyright (C) 2008, 2010, 2015, 2016, 2024
#   Rocky Bernstein rocky@gnu.org
#
#   This program is free software; you can redistribute it and/or
#   modify it under the terms of the GNU General Public License as
#   published by the Free Software Foundation; either version 2, or
#   (at your option) any later version.
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
#   General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with this program; see the file COPYING.  If not, write to
#   the Free Software Foundation, 59 Temple Place, Suite 330, Boston,
#   MA 02111 USA.

# Sets whether or not to display command to be executed in debugger prompt.
# If yes, always show. If auto, show only if the same line is to be run
# but the command is different.

_Dbg_help_add next \
"**next** [ **+** | **-** ] [ *count* ]

Step one statement ignoring steps into function calls at this level. This is sometimes called
'step over' or 'step through'.

With an integer argument, perform ``next`` that many times.

A suffix of ``+`` on the command or an alias to the command forces to
move to another line, while a suffix of ``-`` does the opposite and
disables the requiring a move to a new line. If no suffix is given,
the debugger setting 'different-line' determines this behavior.

Functions and source'd files are not traced. This is in contrast to
**step**.

See also:
---------

**skip**, *step**, and **set force**." 1

# Next command
# $1 is command next+, next-, or next
# $2 is an optional additional count.
_Dbg_do_next() {
    _Dbg_last_cmd='next'
    _Dbg_inside_skip=0
    _Dbg_next_skip_common 0 $@
    return $?
}

_Dbg_alias_add 'n'  'next'
