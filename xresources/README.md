# Cinder Muted for Xresources

Terminal palette in Xresources form. The color order matches cinder-grove.nvim's terminal colors.

## Install

Add the colors to `~/.Xresources` with an include:

```
#include "/path/to/cinder-muted/xresources/cinder-muted.xrdb"
```

Or just copy and paste them int `~/.Xresources` directly.

Then reload:

```sh
xrdb -merge ~/.Xresources
```
