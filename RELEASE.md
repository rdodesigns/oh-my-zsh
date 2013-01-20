Release 0.1.3 (2013/01/20 04:29 UTC-8)
======================================

New
---
- Logging in through SSH now sets the address that the user came from to
  the RPROMPT variable. The burnt orange colour has been removed.
- vi-mode now uses a red 'N' in the RPROMPT when in normal mode.


Release 0.1.2 (2013/01/20 01:11 UTC-8)
======================================
When logging in through SSH, the prompt now changes to a burnt orange colour.
Note that this requires a 256 colour terminal.


Release 0.1.1 (2013/01/10 00:42 UTC-8)
======================================
Bug fix release since version 0.1.0

Fixes
-----
- [Aliases with sudo](http://www.zsh.org/mla/users/2008/msg01229.html)
- Added `/opt/local/sbin` to the suggested Mac PATHS variable.
- Fixed bug where the installer would clone the original, robbyrussell
  repository instead of this one.
