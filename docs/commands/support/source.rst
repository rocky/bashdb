.. index:: source
.. _source:

Read and Run Debugger Commands from a File (`source`)
-----------------------------------------------------

**source** [ **-v** ][ **-Y** | **-N** ][ **-c** ] *file*

Read debugger commands from a file named *file*.  Optional *-v* switch
(before the filename) causes each command in *file* to be echoed as it
is executed.  Option *-Y* sets the default value in any confirmation
command to be "yes" and *-N* sets the default value to "no".

Note that the command startup file `.bashdbrc` is read automatically
via a *source* command the debugger is started.

An error in any command terminates execution of the command file
unless option `-c` is given.
