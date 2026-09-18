# Cinder Muted

Muted monochrome variant of my [Cinder Grove](https://github.com/aileks/cinder-grove.nvim) theme.

![Cinder Muted color palette](./palette.svg)

The palette is tones of Cinder Grove's primary `#E17A3F` accnet. Dark tones for backgrounds, light tones for text, and an even lightness ladder for the accents. Errors stay red so they pop.

## Apps

| App | File | Placement |
| --- | --- | --- |
| Neovim | `nvim/` | runtimepath plugin, requires cinder-grove.nvim |
| Emacs | `emacs/cinder-muted-theme.el` | `custom-theme-load-path` |
| Xresources | `xresources/cinder-muted.xrdb` | `#include` or paste into `~/.Xresources` |
| GTK 3/4 | `gtk/Cinder-Muted-Dark/` | `gtk/install.sh` |
| cava | `cava/config` | `~/.config/cava/config` |
| btop | `btop/cinder-muted.theme` | `~/.config/btop/themes/`, set `color_theme = "cinder-muted"` |
| qt6ct | `qt6ct/cinder-muted.conf` | `/usr/local/share/qt6ct/colors/` (or another `qt6ct` color dir) |
| bat | `bat/cinder-muted.tmTheme` | `$(bat --config-dir)/themes/`, set `--theme=cinder-muted` |
| yazi | `yazi/theme.toml`, `yazi/cinder-muted.tmTheme` | `~/.config/yazi/` |

### Neovim

The colorscheme is a thin layer that feeds the cinder-muted palette through cinder-grove.nvim's palette overrides, so all of grove's highlight groups, plugin integrations, and terminal colors re-resolve in muted tones. cinder-grove.nvim must be installed.

```lua
{
  'aileks/cinder-grove.nvim',
  lazy = false,
  priority = 1000,
}

vim.opt.runtimepath:prepend('/path/to/cinder-monochrome/nvim')
vim.cmd.colorscheme('cinder-muted')
```

lualine picks it up through `theme = 'auto'` via the bundled `lua/lualine/themes/cinder-muted.lua`. fzf.vim and minimap.vim users can use `require('cinder-grove.extras')` as documented in grove's README; the extras read the active palette.

### Emacs

```elisp
(add-to-list 'custom-theme-load-path "/path/to/cinder-monochrome/emacs")
(setq doom-theme 'cinder-muted)
```

The `cg-transparent` option from cinder-grove.el works unchanged.

### GTK

`gtk/install.sh` copies `Cinder-Muted-Dark` to `~/.local/share/themes/`, writes the libadwaita overlay into `~/.config/gtk-4.0/gtk.css` (backing up any existing file), and points gsettings at the theme. The stock adw-gtk3 base CSS is vendored under `gtk/Cinder-Muted-Dark/` (see `gtk/VENDOR.txt`).

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
