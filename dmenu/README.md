# Cinder Muted for dmenu

Copy the contents of `colors.h` into your `config.def.h` and rebuild.

The highlight rows come from the `highlight` patch, and the border row plus `border_width` come from the `border` patch.

```sh
rm -f config.h
make clean install
```
