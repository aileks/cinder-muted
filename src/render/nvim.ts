import type { GroveSlot } from '../palette.ts'

// Palette overrides for cinder-grove.nvim; key order matches grove's palette.lua.
export function renderNvimPalette(palette: Record<GroveSlot, string>): string {
  const entries = Object.entries(palette)
    .map(([name, hex]) => `  ${name} = '${hex}',`)
    .join('\n')
  return `-- Auto-generated file. Do not edit!
-- Cinder Muted: one ember tone ramp derived from the Cinder Grove palette.
return {
${entries}
}
`
}
