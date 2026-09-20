# Cinder Muted for st

`colors.h` is the color section for st's `config.def.h`: the 16 ANSI colors,
the indexed extras (cursor, reverse cursor, background, foreground,
selection, search highlight), and the index variables that point at them.

Paste it into your `config.def.h`, replacing the existing `colorname[]` array
and index variables, then rebuild. `config.h` must be deleted first: st only
regenerates it when it is missing, so a stale `config.h` keeps the old
colors.

```sh
rm -f config.h
make clean install
```

The 256-261 extras and the selection indexes are part of current st; the
selection lines need the selection colors patch (`SELECTION_COLORS_PATCH`).
`highlightfg`, `highlightbg`, and entry 261 come from a search patch, so
drop those three lines if your build has no search support.

The 16 colors match `terminalColors()` in `src/palette.ts` and
`xresources/cinder-muted.xrdb`, so st renders the same ANSI palette as the
other terminal ports.
