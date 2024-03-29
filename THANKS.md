The following kind people have contributed to this debugger

* Eric Blake `ebb9 at byu dot edu` - packaging/build fixes. cygwin packaging
* Manfred Tremmel `Manfred.Tremmel at iiv.de` - RPM building for SuSE
* Masatake YAMATO `jet at gyve.org` - Emacs support, screenshots, progress meter
* Matthias Klose `doko at cs dot tu-berlin dot de` - making the build system
  and package more industrial strength.
* Mikael Andersson  `snikkt at telia dot com` - "V" command `auto*` fixes
* Oleksandr Moskalenko  `malex at tagancha dot org` Debian packaging
* Matt Fleming - NetBSD packaging
* Alberto Griggio - Annotate patch #1781965 (for pydb)
* Michał Rogaliński (rogalmic)  - VSCode package. Fixing embedded blanks in path names
* Joachim Ansorg - JetBrains Pro package. More embedded blanks. "info variables" extensions

Some ideas from Kent Sibilev's ruby-debug have been encorporated into
this debugger.

The O'Reilly book on the Korn shell by Bill Rosenblatt suggested that
it might be possible to write a debugger.

Thanks to Chet Ramey for continued support of bash and
adding/encorprating changes needed to support debugging better.

--

The following software is used in this debugger:

getopts_long.sh by Stéphane Chazelas - GNU-compatible long-options parsing
shunit2 by Kate Ward - unit tests
