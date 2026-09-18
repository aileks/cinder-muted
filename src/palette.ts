import { clampChroma, formatHex, oklch, parse } from 'culori'
import type { Oklch } from 'culori'

// Cinder Grove palette as of 2026-09, the source of every lightness value here.
// Only L survives into cinder-muted; hue comes from the seed blend, chroma
// from the knobs below.
export const GROVE = {
  visual: '#3E3A34',
  background: '#131210',
  container: '#1B1916',
  surface: '#23201C',
  overlay: '#58534C',
  text_muted: '#58534C',
  text_subtle: '#9A938A',
  text_secondary: '#ACA49B',
  text: '#BBB3A9',
  text_bright: '#DDD5CA',
  primary: '#E17A3F',
  secondary: '#879B5C',
  error: '#B34A45',
  warning: '#D9A441',
  success: '#879B5C',
  info: '#6785A1',
  purple: '#9A788F',
  cyan: '#58918C',
} as const

export type GroveSlot = keyof typeof GROVE

export const NEUTRAL_SLOTS = [
  'visual',
  'background',
  'container',
  'surface',
  'overlay',
  'text_muted',
  'text_subtle',
  'text_secondary',
  'text',
  'text_bright',
] as const satisfies readonly GroveSlot[]

export const ACCENT_SLOTS = [
  'primary',
  'secondary',
  'warning',
  'info',
  'purple',
  'cyan',
] as const satisfies readonly GroveSlot[]

// Tuning knobs. The whole palette re-derives from these; see palette.svg.
export const KNOBS = {
  // Weight of primary vs secondary in the seed blend. 0 is pure ember
  // (#E17A3F), 1 would be pure grove green.
  blendRatio: 0,
  // Chroma of every accent tone. Grove's accents run 0.055-0.147; the ember
  // seed sits at 0.147.
  accentChroma: 0.13,
  // Ends of the accent lightness ladder. Grove's info, purple, and cyan
  // cluster within 0.01 L of each other, so accent lightness is re-spaced
  // evenly by rank instead of kept (see accentLadderLightness).
  accentLadderTop: 0.8,
  accentLadderBottom: 0.55,
  // Multiplies grove's own neutral chroma (which rises from 0.004 at the
  // background to 0.017 at the brightest text), so the neutral ramp keeps
  // grove's shape with more ember presence.
  neutralChromaScale: 2.2,
  // Pulls the error red down toward the theme's chroma level.
  errorChromaScale: 0.75,
} as const

type Hex = string

function groveOklch(hex: Hex): Oklch {
  const color = oklch(parse(hex))
  if (color == null) throw new Error(`not a color: ${hex}`)
  return color
}

function shortestHueDelta(from: number, to: number): number {
  const delta = (to - from) % 360
  return delta > 180 ? delta - 360 : delta < -180 ? delta + 360 : delta
}

function hexOf(color: Oklch): Hex {
  return formatHex(clampChroma(color, 'oklch') ?? color) ?? '#000000'
}

export function seed(): Oklch {
  const primary = groveOklch(GROVE.primary)
  const secondary = groveOklch(GROVE.secondary)
  const t = KNOBS.blendRatio
  const hue = primary.h! + shortestHueDelta(primary.h!, secondary.h!) * t
  return { mode: 'oklch', l: primary.l + (secondary.l - primary.l) * t, c: primary.c + (secondary.c - primary.c) * t, h: hue }
}

// Neutral tones keep grove's lightness and chroma shape, re-hued to the seed.
export function neutralFromHex(hex: Hex): Hex {
  const base = groveOklch(hex)
  const s = seed()
  return hexOf({ ...base, c: base.c * KNOBS.neutralChromaScale, h: s.h! })
}

const accentLightnesses = ACCENT_SLOTS.map((slot) => groveOklch(GROVE[slot]).l)
  .sort((a, b) => b - a)

// Grove's info, purple, and cyan differ by hue at nearly one lightness, which
// collapses once hue is gone. Rank accents by grove lightness and space them
// evenly down the ladder; anything lighter than the lightest grove accent
// takes the top rung, darker tones keep stepping past the bottom.
export function accentLadderLightness(l: number): number {
  const rank = accentLightnesses.filter((accentL) => accentL > l).length
  const step =
    (KNOBS.accentLadderTop - KNOBS.accentLadderBottom) / (accentLightnesses.length - 1)
  return Math.min(0.9, Math.max(0.3, KNOBS.accentLadderTop - rank * step))
}

// Accent tones take the seed hue and one muted chroma, with lightness re-spaced
// onto the ladder.
export function accentFromHex(hex: Hex): Hex {
  const base = groveOklch(hex)
  const s = seed()
  return hexOf({
    mode: 'oklch',
    l: accentLadderLightness(base.l),
    c: KNOBS.accentChroma,
    h: s.h!,
  })
}

// The one hue exception: errors stay red, muted to the theme's level.
export function errorFromHex(hex: Hex): Hex {
  const base = groveOklch(hex)
  return hexOf({ ...base, c: base.c * KNOBS.errorChromaScale })
}

function slotTone(slot: GroveSlot): Hex {
  if (slot === 'error') return errorFromHex(GROVE.error)
  if ((ACCENT_SLOTS as readonly string[]).includes(slot)) {
    return accentFromHex(GROVE[slot])
  }
  return neutralFromHex(GROVE[slot])
}

export function palette(): Record<GroveSlot, Hex> {
  return Object.fromEntries(
    (Object.keys(GROVE) as GroveSlot[]).map((slot) => [slot, slotTone(slot)]),
  ) as Record<GroveSlot, Hex>
}

// Maps any grove-family hex to its cinder-muted tone. Covers off-palette
// stragglers from btop and qt6ct configs alongside the canonical slots.
export function hexMap(): Map<Hex, Hex> {
  const extras: Hex[] = [
    '#827B71', // grove Xresources color8
    '#E8A64D', // grove Xresources color11
    '#8D5533', // btop cpu_box
    '#C87546', // btop used_mid
    '#34312D', // qt6ct shadow
    '#171613', // qt6ct deep bg
    '#706A62', // qt6ct disabled text
    '#878077', // qt6ct disabled highlight
  ]
  const derive = (hex: Hex): Hex => {
    const lower = hex.toLowerCase()
    if (lower === GROVE.error) return errorFromHex(hex)
    // Extras near the neutral chroma band (< 0.06) read as surfaces/text;
    // the rest are accent-strength colors.
    return groveOklch(hex).c < 0.06 ? neutralFromHex(hex) : accentFromHex(hex)
  }
  const entries: [Hex, Hex][] = (Object.keys(GROVE) as GroveSlot[]).map(
    (slot) => [GROVE[slot], slotTone(slot)],
  )
  for (const hex of extras) entries.push([hex, derive(hex)])
  return new Map(entries.map(([from, to]) => [from.toLowerCase(), to]))
}

// ANSI slot mapping, identical to cinder-grove.nvim's terminal.lua. Defining
// it once keeps Xresources and the nvim terminal in lockstep.
export const TERMINAL_SLOTS = [
  'background',
  'error',
  'success',
  'warning',
  'info',
  'purple',
  'cyan',
  'text_secondary',
  'overlay',
  'primary',
  'success',
  'warning',
  'info',
  'purple',
  'cyan',
  'text_bright',
] as const satisfies readonly GroveSlot[]
