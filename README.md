# Cinder Muted

Muted monochrome variant of my [Cinder Grove](https://github.com/aileks/cinder-grove.nvim) theme.

![Cinder Muted color palette](./palette.svg)

The palette is tones of Cinder Grove's primary `#E17A3F` accent. Dark tones for backgrounds, light tones for text, and an even lightness ladder for the accents. Errors stay red so they pop.

## Ports

- [bat](bat/README.md)
- [btop](btop/README.md)
- [cava](cava/README.md)
- [Dark Reader](dark-reader/README.md)
- [Emacs](emacs/README.md)
- [GTK 3/4](gtk/README.md)
- [Neovim](https://github.com/aileks/cinder-muted.nvim)
- [qt6ct](qt6ct/README.md)
- [Xresources](xresources/README.md)
- [yazi](yazi/README.md)

## Development

```sh
pnpm install
pnpm build   # render every generated file
pnpm check   # fail if committed outputs are out of sync
pnpm test
```

- `src/palette.ts` derives the palette from the Cinder Grove source colors; the tuning knobs (seed blend, chroma levels, accent ladder, error strength) live in `KNOBS`.
- `templates/` holds verbatim copies of the Cinder Grove config files each renderer starts from. When a port changes, copy the new file in and re-render.
- `applyTones` throws on any color it does not recognize, so new upstream colors fail the build instead of leaking old colors.
- The Neovim palette renders into the `nvim/` submodule; after palette changes, commit inside the submodule, then commit the new pointer here.

## License

GPL-3.0-or-later. The GTK theme's vendored adw-gtk3 base is LGPL-2.1. See `gtk/LICENSE` and `gtk/Cinder-Muted-Dark/COPYING.adw-gtk3`.
