import { describe, expect, it } from 'vitest'
import { oklch, parse } from 'culori'
import {
  ACCENT_SLOTS,
  KNOBS,
  SOURCE_COLORS,
  TERMINAL_SLOTS,
  ladderLightness,
  palette,
  seed,
  toneMap,
} from './palette.ts'

const hue = (hex: string) => oklch(parse(hex)!)!.h!
const chroma = (hex: string) => oklch(parse(hex)!)!.c

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

describe('toneMap', () => {
  it('keys hex and rgb decimal forms identically', () => {
    const map = toneMap()
    expect(map.get('#131210')).toBe(map.get('19,18,16'))
  })

  it('covers the terminal slots', () => {
    for (const slot of TERMINAL_SLOTS) {
      expect(toneMap().get(SOURCE_COLORS[slot].toLowerCase()), slot).toBeDefined()
    }
  })
})
