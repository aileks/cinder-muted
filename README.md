# Cinder Muted

Muted monochrome variant of my [Cinder Grove](https://github.com/aileks/cinder-grove.nvim) theme.

![Cinder Muted color palette](./palette.svg)

The palette is tones of Cinder Grove's primary `#E17A3F` accent. Dark tones for backgrounds, light tones for text, and an even lightness ladder for the accents. Errors stay red so they pop.

## Apps

Each port has its own README with install instructions.

| App | Files | Install |
| --- | --- | --- |
| [Neovim](docs/nvim.md) | `colors/`, `lua/` at the repo root | plugin manager or local runtimepath |
| [Emacs](docs/emacs.md) | `cinder-muted-theme.el` at the repo root | package recipe or manual |
| [Xresources](xresources/README.md) | `xresources/cinder-muted.xrdb` | include or paste into `~/.Xresources` |
| [GTK 3/4](gtk/README.md) | `gtk/Cinder-Muted-Dark/` | `gtk/install.sh` |
| [Stylus](stylus/README.md) | `stylus/cinder-muted.user.css` | import into the Stylus extension |
| [cava](cava/README.md) | `cava/config` | copy to `~/.config/cava/config` |
| [btop](btop/README.md) | `btop/cinder-muted.theme` | copy and set `color_theme` |
| [qt6ct](qt6ct/README.md) | `qt6ct/cinder-muted.conf` | copy into a qt6ct color dir |
| [bat](bat/README.md) | `bat/cinder-muted.tmTheme` | copy, rebuild cache, set `--theme` |
| [yazi](yazi/README.md) | `yazi/theme.toml`, `yazi/cinder-muted.tmTheme` | copy to `~/.config/yazi/` |

The repo root doubles as the Neovim plugin and the Emacs package, so both plugin managers consume it straight from git. Cinder Muted installs side by side with Cinder Grove everywhere.

## Development

```sh
pnpm install
pnpm build   # render every generated file
pnpm check   # fail if committed outputs are out of sync
pnpm test
```

- `src/palette.ts` derives the palette from the Cinder Grove source colors; the tuning knobs (seed blend, chroma levels, accent ladder, error strength) live in `KNOBS`.
- `templates/` holds verbatim copies of the Cinder Grove config files each renderer starts from. When a grove port changes, copy the new file in and re-render.
- Generated files carry a "do not edit" note and are committed at their final paths so apps can consume them without a Node toolchain.
- `applyTones` throws on any color it does not recognize, so a grove update with new colors fails the build instead of leaking old colors.

## License

GPL-3.0-or-later. The GTK theme's vendored adw-gtk3 base is LGPL-2.1. See `gtk/LICENSE` and `gtk/Cinder-Muted-Dark/COPYING.adw-gtk3`.
