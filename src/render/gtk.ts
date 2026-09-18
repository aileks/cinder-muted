import type { SourceSlot } from '../palette.ts'
import { applyTones } from './substitute.ts'

// The adw-gtk3 overlays with retuned colors. The base CSS is vendored, not
// generated.
export function renderGtkOverlay(template: string, tones: Map<string, string>): string {
  return applyTones(template, tones)
}

export function renderGtkAccent3(palette: Record<SourceSlot, string>): string {
  return `/* Auto-generated file. Do not edit! */
@define-color cinder_primary ${palette.primary};
@define-color accent_bg_color ${palette.primary};
@define-color accent_fg_color ${palette.background};
@define-color accent_color ${palette.primary};
`
}

export function renderGtkAccent4(palette: Record<SourceSlot, string>): string {
  return `/* Auto-generated file. Do not edit! */
@define-color cinder_primary ${palette.primary};
@define-color accent_bg_color ${palette.primary};
@define-color accent_fg_color ${palette.background};

:root {
  --cinder-primary: ${palette.primary};
  --accent-bg-color: ${palette.primary};
  --accent-fg-color: ${palette.background};
}
`
}

export function renderGtkIndex(): string {
  return `[X-GNOME-Metatheme]
Name=Cinder Muted Dark
Type=X-GNOME-Metatheme
Comment=Muted, monochrome dark theme
Encoding=UTF-8
GtkTheme=Cinder-Muted-Dark
`
}

export const GTK3_MAIN_CSS = '@import url("base/gtk.css");\n@import url("cinder-muted.css");\n'
export const GTK3_DARK_CSS = '@import url("gtk.css");\n'
export const GTK4_MAIN_CSS = [
  '@import url("base/libadwaita.css");',
  '@import url("base/libadwaita-tweaks.css");',
  '@import url("cinder-muted.css");',
  '@import url("accent.css");',
  '',
].join('\n')
export const GTK4_DARK_CSS = '@import url("gtk.css");\n'
