import type { SourceSlot } from '../palette.ts'

// Palette for the cinder-muted.nvim submodule. Key order matches its palette.lua.
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
