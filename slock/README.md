# Cinder Muted for slock

Copy the contents of `colors.h` into your `config.def.h` and rebuild, or merge `colors.xrdb` into your `~/.Xresources`.

`CAPS` and `BLOCKS` come from the `keypress_feedback` patch, and the Xresources route requires the `xresources` patch.

```sh
rm -f config.h
make clean install
```
