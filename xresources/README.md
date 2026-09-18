# Cinder Muted for Xresources

Terminal palette in Xresources form. The slot order matches cinder-grove.nvim's terminal colors, so xrdb and nvim cannot drift apart.

## Install

Add the colors to `~/.Xresources` with an include:

```
#include "/path/to/cinder-muted/xresources/cinder-muted.xrdb"
```

Then reload:

```sh
xrdb -merge ~/.Xresources
```
