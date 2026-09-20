# Cinder Muted for dwm

Copy the contents of `colors.h` into your `config.def.h` and rebuild.

The urgent scheme comes from the `urgentborder` patch, and the fourth column (float) comes from the floatborder patch, which gives floating windows their own border color.
Status text from [dwmblocks](../dwmblocks/README.md) renders via the `status2d` patch.

```sh
rm -f config.h
make clean install
```

