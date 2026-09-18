import { palette } from './palette.ts'
import { renderSvg } from './render/svg.ts'
import { renderNvimPalette } from './render/nvim.ts'

// Port files are maintained directly with their final colors; only the two
// pure-palette artifacts are rendered.
export function renderOutputs(): Map<string, string> {
  const p = palette()
  return new Map([
    ['palette.svg', renderSvg(p)],
    ['nvim/lua/cinder-muted/palette.lua', renderNvimPalette(p)],
  ])
}
