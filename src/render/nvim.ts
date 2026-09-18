import type { SourceSlot } from '../palette.ts'

// Palette overrides for cinder-grove.nvim. Key order matches its palette.lua.
export function renderNvimPalette(palette: Record<SourceSlot, string>): string {
  const entries = Object.entries(palette)
    .map(([name, hex]) => `  ${name} = '${hex}',`)
    .join('\n')
  return `-- Auto-generated file. Do not edit!
return {
${entries}
}
`
}
