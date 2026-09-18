import { clampChroma, formatHex, oklch, parse } from 'culori'
import type { Oklch } from 'culori'

// Cinder Grove's colors.
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
  purple: '#9A788F',
  cyan: '#58918C',
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
  'purple',
  'cyan',
] as const satisfies readonly SourceSlot[]

export const KNOBS = {
  // 0 blends the seed toward primary, 1 toward secondary.
  blendRatio: 0,
  accentChroma: 0.11,
  accentLadderTop: 0.85,
  accentLadderBottom: 0.5,
  neutralChromaScale: 1.8,
  errorChromaScale: 0.75,
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

// Upstream info, purple, and cyan differ only by hue at nearly one lightness.
// Accent lightness is re-spaced evenly by upstream rank.
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

export function toneMap(): Map<string, string> {
  const extras = [
    '#827B71', // Xresources color8
    '#E8A64D', // Xresources color11
    '#8D5533', // btop cpu_box
    '#C87546', // btop used_mid
    '#34312D', // qt6ct shadow
    '#171613', // qt6ct deep bg
    '#706A62', // qt6ct disabled text
    '#878077', // qt6ct disabled highlight
    '#DC8853', // fzf spinner
  ]
  const derive = (hex: string): string => {
    if (hex.toLowerCase() === SOURCE_COLORS.error) return errorFromHex(hex)
    // Low-chroma extras read as neutrals, the rest as accents.
    return parseOklch(hex).c < 0.06 ? neutralFromHex(hex) : accentFromHex(hex)
  }
  const entries: [string, string][] = (Object.keys(SOURCE_COLORS) as SourceSlot[]).map((slot) => [
    SOURCE_COLORS[slot],
    slotTone(slot),
  ])
  for (const hex of extras) entries.push([hex, derive(hex)])

  const map = new Map<string, string>()
  for (const [from, to] of entries) {
    map.set(from.toLowerCase(), to)
    const value = parseInt(from.slice(1), 16)
    map.set(`${(value >> 16) & 255},${(value >> 8) & 255},${value & 255}`, to)
  }
  return map
}

// ANSI slots in cinder-grove.nvim's terminal.lua order.
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
] as const satisfies readonly SourceSlot[]
