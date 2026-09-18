import { readFileSync } from 'node:fs'
import { describe, expect, it } from 'vitest'
import { oklch, parse } from 'culori'
import {
  ACCENT_SLOTS,
  KNOBS,
  SOURCE_COLORS,
  ladderLightness,
  palette,
  seed,
  terminalColors,
} from './palette.ts'

const hue = (hex: string) => oklch(parse(hex)!)!.h!
const chroma = (hex: string) => oklch(parse(hex)!)!.c
const lightness = (hex: string) => oklch(parse(hex)!)!.l

describe('seed', () => {
  it('at blendRatio 0 is the source primary', () => {
    const s = seed()
    const primary = oklch(parse(SOURCE_COLORS.primary)!)!
    expect(s.l).toBeCloseTo(primary.l, 3)
    expect(s.c).toBeCloseTo(primary.c, 3)
    expect(s.h!).toBeCloseTo(primary.h!, 1)
  })
})

describe('palette', () => {
  const p = palette()

  it('keeps every non-error slot on the seed hue', () => {
    const expected = seed().h!
    for (const [slot, hex] of Object.entries(p)) {
      if (slot === 'error') continue
      const delta = Math.abs(hue(hex) - expected)
      // Hue wobbles through the hex roundtrip at low chroma. Accents are exact.
      const tolerance =
        slot.includes('text') ||
        ['background', 'container', 'surface', 'visual', 'overlay'].includes(slot)
          ? 10
          : 2
      expect(Math.min(delta, 360 - delta), slot).toBeLessThan(tolerance)
    }
  })

  it('keeps error red, muted below source strength', () => {
    expect(Math.abs(hue(p.error) - hue(SOURCE_COLORS.error))).toBeLessThan(2)
    expect(chroma(p.error)).toBeLessThan(chroma(SOURCE_COLORS.error))
    expect(chroma(p.error)).toBeCloseTo(chroma(SOURCE_COLORS.error) * KNOBS.errorChromaScale, 2)
  })

  it('aliases success onto secondary like the source does', () => {
    expect(p.success).toBe(p.secondary)
  })

  it('spaces the accents down the ladder in source lightness order', () => {
    const byRank = [...ACCENT_SLOTS].sort(
      (a, b) => oklch(parse(SOURCE_COLORS[b])!)!.l - oklch(parse(SOURCE_COLORS[a])!)!.l,
    )
    const lightnesses = byRank.map((slot) => oklch(parse(p[slot])!)!.l)
    expect(lightnesses).toEqual([...lightnesses].sort((a, b) => b - a))
    expect(lightnesses[0]).toBeCloseTo(KNOBS.accentLadderTop, 2)
    expect(lightnesses.at(-1)!).toBeCloseTo(KNOBS.accentLadderBottom, 2)
  })

  it('keeps the neutral ramp ordered like the source', () => {
    const ramp = [
      'background',
      'container',
      'surface',
      'overlay',
      'text_subtle',
      'text_bright',
    ] as const
    const lightnesses = ramp.map((slot) => oklch(parse(p[slot])!)!.l)
    expect(lightnesses).toEqual([...lightnesses].sort((a, b) => a - b))
  })
})

describe('ladderLightness', () => {
  it('extends past the bottom for darker-than-info accents', () => {
    const infoL = Math.min(...ACCENT_SLOTS.map((s) => oklch(parse(SOURCE_COLORS[s])!)!.l))
    expect(ladderLightness(infoL - 0.1)).toBeLessThan(KNOBS.accentLadderBottom)
  })

  it('caps lighter-than-warning accents at the top rung', () => {
    expect(ladderLightness(0.95)).toBe(KNOBS.accentLadderTop)
  })
})

describe('terminalColors', () => {
  const p = palette()
  const t = terminalColors(p)

  it('passes the non-accent slots through untouched', () => {
    expect(t[0]).toBe(p.background)
    expect(t[1]).toBe(p.error)
    expect(t[7]).toBe(p.text_secondary)
    expect(t[8]).toBe(p.overlay)
    expect(t[9]).toBe(p.primary)
    expect(t[15]).toBe(p.text_bright)
  })

  it('keeps every accent at or above the floor', () => {
    for (const index of [2, 3, 4, 5, 6, 10, 11, 12, 13, 14]) {
      expect(lightness(t[index]!), `color${index}`).toBeGreaterThanOrEqual(
        KNOBS.terminalFloor - 0.01,
      )
    }
  })

  it('lifts each bright accent above its normal counterpart', () => {
    for (const [bright, normal] of [
      [10, 2],
      [11, 3],
      [12, 4],
      [13, 5],
      [14, 6],
    ] as const) {
      const expected = Math.min(
        KNOBS.terminalBrightCap,
        lightness(t[normal]!) + KNOBS.terminalBrightLift,
      )
      expect(lightness(t[bright]!), `color${bright}`).toBeCloseTo(expected, 2)
    }
  })

  it('keeps all sixteen colors distinct', () => {
    expect(new Set(t).size).toBe(16)
  })
})

describe('terminal files', () => {
  it('xrdb and st carry the same sixteen colors as terminalColors', () => {
    const expected = terminalColors(palette()).map((hex) => hex.toUpperCase())
    const xrdbColors = [
      ...readFileSync('xresources/cinder-muted.xrdb', 'utf8').matchAll(
        /^\*\.color(\d+):\s+(#[0-9A-F]{6})$/gm,
      ),
    ]
      .sort((a, b) => Number(a[1]) - Number(b[1]))
      .map((match) => match[2]!)
    const stColors = [
      ...readFileSync('st/config.def.h', 'utf8').matchAll(/^\t"(#[0-9A-F]{6})",$/gm),
    ].map((match) => match[1]!)
    expect(xrdbColors).toEqual(expected)
    expect(stColors).toEqual(expected)
  })
})
