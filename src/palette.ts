import { clampChroma, formatHex, oklch, parse } from 'culori'
import type { Oklch } from 'culori'

// The source colors the theme is built from.
export const SOURCE_COLORS = {
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
  tertiary: '#9A788F',
  quaternary: '#58918C',
} as const

export type SourceSlot = keyof typeof SOURCE_COLORS

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
] as const satisfies readonly SourceSlot[]

export const ACCENT_SLOTS = [
  'primary',
  'secondary',
  'warning',
  'info',
  'tertiary',
  'quaternary',
] as const satisfies readonly SourceSlot[]

export const KNOBS = {
  // 0 blends the seed toward primary, 1 toward secondary.
  blendRatio: 0,
  accentChroma: 0.11,
  accentLadderTop: 0.85,
  accentLadderBottom: 0.5,
  neutralChromaScale: 1.8,
  errorChromaScale: 0.75,
  // Terminal-only overrides; the UI palette is untouched by these.
  terminalFloor: 0.64,
  terminalBrightLift: 0.06,
  terminalBrightCap: 0.9,
} as const

function parseOklch(hex: string): Oklch {
  const color = oklch(parse(hex))
  if (color == null) throw new Error(`not a color: ${hex}`)
  return color
}

function shortestHueDelta(from: number, to: number): number {
  const delta = (to - from) % 360
  return delta > 180 ? delta - 360 : delta < -180 ? delta + 360 : delta
}

function toHex(color: Oklch): string {
  return formatHex(clampChroma(color, 'oklch') ?? color) ?? '#000000'
}

export function seed(): Oklch {
  const primary = parseOklch(SOURCE_COLORS.primary)
  const secondary = parseOklch(SOURCE_COLORS.secondary)
  const t = KNOBS.blendRatio
  const hue = primary.h! + shortestHueDelta(primary.h!, secondary.h!) * t
  return {
    mode: 'oklch',
    l: primary.l + (secondary.l - primary.l) * t,
    c: primary.c + (secondary.c - primary.c) * t,
    h: hue,
  }
}

export function neutralFromHex(hex: string): string {
  const base = parseOklch(hex)
  return toHex({ ...base, c: base.c * KNOBS.neutralChromaScale, h: seed().h! })
}

const accentLightnesses = ACCENT_SLOTS.map((slot) => parseOklch(SOURCE_COLORS[slot]).l).sort(
  (a, b) => b - a,
)

// The info, tertiary, and quaternary sources differ only by hue at nearly one
// lightness. Accent lightness is re-spaced evenly by rank.
export function ladderLightness(l: number): number {
  const rank = accentLightnesses.filter((accentL) => accentL > l).length
  const step = (KNOBS.accentLadderTop - KNOBS.accentLadderBottom) / (accentLightnesses.length - 1)
  return Math.min(0.9, Math.max(0.3, KNOBS.accentLadderTop - rank * step))
}

export function accentFromHex(hex: string): string {
  const base = parseOklch(hex)
  return toHex({
    mode: 'oklch',
    l: ladderLightness(base.l),
    c: KNOBS.accentChroma,
    h: seed().h!,
  })
}

// The one hue exception: errors stay red, muted to the theme's chroma.
export function errorFromHex(hex: string): string {
  const base = parseOklch(hex)
  return toHex({ ...base, c: base.c * KNOBS.errorChromaScale })
}

function slotTone(slot: SourceSlot): string {
  if (slot === 'error') return errorFromHex(SOURCE_COLORS.error)
  if ((NEUTRAL_SLOTS as readonly string[]).includes(slot))
    return neutralFromHex(SOURCE_COLORS[slot])
  return accentFromHex(SOURCE_COLORS[slot])
}

export function palette(): Record<SourceSlot, string> {
  return Object.fromEntries(
    (Object.keys(SOURCE_COLORS) as SourceSlot[]).map((slot) => [slot, slotTone(slot)]),
  ) as Record<SourceSlot, string>
}

// ANSI slot order: black, red, green, yellow, blue, magenta, cyan, white,
// then the bright variants. ANSI color names live only here as comments;
// the palette itself uses tokens.
export const TERMINAL_SLOTS = [
  'background', // 0 black
  'error', // 1 red
  'success', // 2 green
  'warning', // 3 yellow
  'info', // 4 blue
  'tertiary', // 5 magenta
  'quaternary', // 6 cyan
  'text_secondary', // 7 white
  'overlay', // 8 bright black
  'primary', // 9 bright red
  'success', // 10 bright green
  'warning', // 11 bright yellow
  'info', // 12 bright blue
  'tertiary', // 13 bright magenta
  'quaternary', // 14 bright cyan
  'text_bright', // 15 bright white
] as const satisfies readonly SourceSlot[]

// Terminal overrides for xrdb and st. The UI palette lets accent rungs go as
// dark as L 0.50 (mud for ls directories) and its bright slots just repeat
// the normal colors. All accents share the seed hue, so equal lightness
// merges shades: rungs at or below the floor are re-spread between the floor
// and the lowest rung above it rather than clamped flat. Red keeps its error
// tone and bright red stays primary.
export function terminalColors(p: Record<SourceSlot, string>): string[] {
  const accentSlots = TERMINAL_SLOTS.slice(2, 7)
  const lightness = (slot: SourceSlot) => parseOklch(p[slot]).l
  const rungs = accentSlots.map(lightness)
  const above = rungs.filter((l) => l > KNOBS.terminalFloor)
  const ceiling = above.length > 0 ? Math.min(...above) : KNOBS.accentLadderTop
  const below = rungs.filter((l) => l <= KNOBS.terminalFloor).sort((a, b) => a - b)
  const step = (ceiling - KNOBS.terminalFloor) / below.length
  const spread = new Map(below.map((l, index) => [l, KNOBS.terminalFloor + index * step]))

  const adjustedL = (slot: SourceSlot) => spread.get(lightness(slot)) ?? lightness(slot)
  const shade = (slot: SourceSlot, l: number) => toHex({ ...parseOklch(p[slot]), l })
  const normal = (slot: SourceSlot) => {
    const l = adjustedL(slot)
    return l === lightness(slot) ? p[slot] : shade(slot, l)
  }
  const bright = (slot: SourceSlot) =>
    shade(slot, Math.min(KNOBS.terminalBrightCap, adjustedL(slot) + KNOBS.terminalBrightLift))

  return [
    p.background, // 0
    p.error, // 1
    ...accentSlots.map(normal), // 2-6
    p.text_secondary, // 7
    p.overlay, // 8
    p.primary, // 9
    ...accentSlots.map(bright), // 10-14
    p.text_bright, // 15
  ]
}
