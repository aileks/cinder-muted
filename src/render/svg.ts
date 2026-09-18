import { oklch, parse } from 'culori'
import { KNOBS, seed, type SourceSlot } from '../palette.ts'

const SWATCH_WIDTH = 180
const SWATCH_HEIGHT = 120
const PER_ROW = 4

const SWATCHES: SourceSlot[] = [
  'background',
  'container',
  'surface',
  'visual',
  'overlay',
  'text_subtle',
  'text_secondary',
  'text',
  'text_bright',
  'error',
  'primary',
  'secondary',
  'warning',
  'info',
  'tertiary',
  'quaternary',
]

const DARK_SLOTS = new Set<string>(['background', 'container', 'surface', 'visual', 'overlay'])

function oklchString(hex: string): string {
  const color = oklch(parse(hex))!
  return `oklch(${color.l.toFixed(3)} ${color.c.toFixed(3)} ${color.h!.toFixed(1)})`
}

export function renderSvg(palette: Record<SourceSlot, string>): string {
  const rows = Math.ceil(SWATCHES.length / PER_ROW)
  const footerHeight = 36
  const width = SWATCH_WIDTH * PER_ROW
  const height = SWATCH_HEIGHT * rows + footerHeight
  const s = seed()

  const swatches = SWATCHES.map((slot, index) => {
    const hex = palette[slot]
    const x = (index % PER_ROW) * SWATCH_WIDTH
    const y = Math.floor(index / PER_ROW) * SWATCH_HEIGHT
    const fill = DARK_SLOTS.has(slot) ? palette.text_bright : palette.background
    return `  <g transform="translate(${x} ${y})">
    <rect width="${SWATCH_WIDTH}" height="${SWATCH_HEIGHT}" fill="${hex}" />
    <text class="hex" x="${SWATCH_WIDTH / 2}" y="48" fill="${fill}">${hex.toUpperCase()}</text>
    <text class="oklch" x="${SWATCH_WIDTH / 2}" y="74" fill="${fill}">${oklchString(hex)}</text>
  </g>`
  }).join('\n\n')

  const knobs = [
    `seed L ${s.l.toFixed(3)} C ${s.c.toFixed(3)} H ${s.h!.toFixed(1)}`,
    `accentChroma ${KNOBS.accentChroma}`,
    `accentLadder ${KNOBS.accentLadderTop}-${KNOBS.accentLadderBottom}`,
    `neutralChromaScale ${KNOBS.neutralChromaScale}`,
    `errorChromaScale ${KNOBS.errorChromaScale}`,
  ].join('  |  ')

  return `<svg
  xmlns="http://www.w3.org/2000/svg"
  width="${width}"
  height="${height}"
  viewBox="0 0 ${width} ${height}"
  role="img"
  aria-labelledby="title desc"
>
  <title id="title">Cinder Muted color palette</title>
  <desc id="desc">Tones of a single muted ember, with a red exception for errors.</desc>

  <style>
    .hex {
      font-family: ui-monospace, SFMono-Regular, Menlo, Monaco, Consolas, "Liberation Mono", monospace;
      font-size: 14px;
      font-weight: 600;
      text-anchor: middle;
    }

    .oklch {
      font-family: ui-monospace, SFMono-Regular, Menlo, Monaco, Consolas, "Liberation Mono", monospace;
      font-size: 11px;
      text-anchor: middle;
    }

    .knobs {
      font-family: ui-monospace, SFMono-Regular, Menlo, Monaco, Consolas, "Liberation Mono", monospace;
      font-size: 12px;
      text-anchor: middle;
      fill: ${palette.overlay};
    }
  </style>

${swatches}

  <text class="knobs" x="${width / 2}" y="${height - 12}">${knobs}</text>
</svg>
`
}
