import { KNOBS, seed, type GroveSlot } from '../palette.ts'

const SWATCH_WIDTH = 180
const SWATCH_HEIGHT = 120
const PER_ROW = 5

// Grouped by role: surfaces, text, accents, then the red exception.
const SWATCHES: { slot: GroveSlot; label: string }[] = [
  { slot: 'background', label: 'background' },
  { slot: 'container', label: 'container' },
  { slot: 'surface', label: 'surface' },
  { slot: 'visual', label: 'visual' },
  { slot: 'overlay', label: 'overlay' },
  { slot: 'text_subtle', label: 'text subtle' },
  { slot: 'text_secondary', label: 'text secondary' },
  { slot: 'text', label: 'text' },
  { slot: 'text_bright', label: 'text bright' },
  { slot: 'error', label: 'error (red exception)' },
  { slot: 'primary', label: 'primary' },
  { slot: 'secondary', label: 'secondary' },
  { slot: 'warning', label: 'warning' },
  { slot: 'info', label: 'info' },
  { slot: 'purple', label: 'purple' },
  { slot: 'cyan', label: 'cyan' },
]

export function renderSvg(palette: Record<GroveSlot, string>): string {
  const rows = Math.ceil(SWATCHES.length / PER_ROW)
  const footerHeight = 36
  const width = SWATCH_WIDTH * PER_ROW
  const height = SWATCH_HEIGHT * rows + footerHeight
  const s = seed()

  const swatchSvg = SWATCHES.map(({ slot, label }, index) => {
    const hex = palette[slot]
    const x = (index % PER_ROW) * SWATCH_WIDTH
    const y = Math.floor(index / PER_ROW) * SWATCH_HEIGHT
    const textFill =
      slot === 'background' || slot === 'container' || slot === 'surface' || slot === 'visual'
        ? palette.text_bright
        : palette.background
    return `  <g transform="translate(${x} ${y})">
    <rect width="${SWATCH_WIDTH}" height="${SWATCH_HEIGHT}" fill="${hex}" />
    <text class="hex" x="${SWATCH_WIDTH / 2}" y="48" fill="${textFill}">${hex.toUpperCase()}</text>
    <text class="name" x="${SWATCH_WIDTH / 2}" y="74" fill="${textFill}">${label}</text>
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
  <desc id="desc">Tones of a single muted gold blended from Cinder Grove's primary and secondary, with a red exception for errors.</desc>

  <style>
    .hex {
      font-family: ui-monospace, SFMono-Regular, Menlo, Monaco, Consolas, "Liberation Mono", monospace;
      font-size: 14px;
      font-weight: 600;
      text-anchor: middle;
    }

    .name {
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

${swatchSvg}

  <text class="knobs" x="${width / 2}" y="${height - 12}">${knobs}</text>
</svg>
`
}
