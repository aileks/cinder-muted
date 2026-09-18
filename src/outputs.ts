import { readFileSync } from 'node:fs'
import { renderSvg } from './render/svg.ts'
import { palette, toneMap } from './palette.ts'
import { renderNvimPalette } from './render/nvim.ts'
import { renderYaziThemeToml } from './render/yazi.ts'
import { renderEmacs } from './render/emacs.ts'
import { renderXresources } from './render/xresources.ts'
import * as gtk from './render/gtk.ts'
import * as configs from './render/configs.ts'

const template = (path: string) => readFileSync(`templates/${path}`, 'utf8')

export function renderOutputs(): Map<string, string> {
  const p = palette()
  const tones = toneMap()

  return new Map([
    ['palette.svg', renderSvg(p)],
    ['nvim/lua/cinder-muted/palette.lua', renderNvimPalette(p)],
    ['emacs/cinder-muted-theme.el', renderEmacs(template('emacs/template.el'), tones)],
    ['xresources/cinder-muted.xrdb', renderXresources(p)],
    ['gtk/Cinder-Muted-Dark/index.theme', gtk.renderGtkIndex()],
    ['gtk/Cinder-Muted-Dark/gtk-3.0/gtk.css', gtk.GTK3_MAIN_CSS],
    ['gtk/Cinder-Muted-Dark/gtk-3.0/gtk-dark.css', gtk.GTK3_DARK_CSS],
    [
      'gtk/Cinder-Muted-Dark/gtk-3.0/cinder-muted.css',
      gtk.renderGtkOverlay(template('gtk/gtk-3.0.css'), tones),
    ],
    ['gtk/Cinder-Muted-Dark/gtk-3.0/accent.css', gtk.renderGtkAccent3(p)],
    ['gtk/Cinder-Muted-Dark/gtk-4.0/gtk.css', gtk.GTK4_MAIN_CSS],
    ['gtk/Cinder-Muted-Dark/gtk-4.0/gtk-dark.css', gtk.GTK4_DARK_CSS],
    [
      'gtk/Cinder-Muted-Dark/gtk-4.0/cinder-muted.css',
      gtk.renderGtkOverlay(template('gtk/gtk-4.0.css'), tones),
    ],
    ['gtk/Cinder-Muted-Dark/gtk-4.0/accent.css', gtk.renderGtkAccent4(p)],
    ['cava/config', configs.renderCava(template('cava/template'), tones)],
    ['btop/cinder-muted.theme', configs.renderBtop(template('btop/template.theme'), tones)],
    ['qt6ct/cinder-muted.conf', configs.renderQt6ct(template('qt6ct/template.conf'), tones)],
    [
      'bat/cinder-muted.tmTheme',
      configs.renderBatTheme(template('bat/template.tmTheme'), tones),
    ],
    ['yazi/theme.toml', renderYaziThemeToml(p)],
    [
      'yazi/cinder-muted.tmTheme',
      configs.renderYaziTheme(template('yazi/template.tmTheme'), tones),
    ],
  ])
}
