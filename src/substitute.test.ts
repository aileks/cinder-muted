import { describe, expect, it } from 'vitest'
import { palette } from './palette.ts'
import { applyTones } from './render/substitute.ts'
import { renderI3lock } from './render/configs.ts'
import { renderXresources } from './render/xresources.ts'

const tones = new Map([
  ['#ddd5ca', '#eccfc1'],
  ['#bbb3a9', '#c9aea0'],
  ['#879b5c', '#df8452'],
  ['221,213,202', '#eccfc1'],
])

describe('applyTones', () => {
  it('replaces plain hexes case-insensitively', () => {
    expect(applyTones('fg = "#BBB3A9"', tones)).toBe('fg = "#c9aea0"')
  })

  it('preserves rgba suffix alpha (bat/sublime form)', () => {
    expect(applyTones('"#DDD5CAA5"', tones)).toBe('"#eccfc1a5"')
  })

  it('preserves argb prefix alpha (qt6ct form)', () => {
    expect(applyTones('#ffbbb3a9', tones)).toBe('#ffc9aea0')
  })

  it('replaces rgb() triples with their alpha intact', () => {
    expect(applyTones('rgb(221 213 202 / 65%)', tones)).toBe('rgb(236 207 193 / 65%)')
  })

  it('leaves pure black and white alone', () => {
    expect(applyTones('rgb(0 0 0 / 90%)', tones)).toBe('rgb(0 0 0 / 90%)')
  })

  it('throws on colors outside the tone map', () => {
    expect(() => applyTones('#123456', tones)).toThrow(/tone map/)
    expect(() => applyTones('rgb(1 2 3)', tones)).toThrow(/tone map/)
  })
})

describe('renderXresources', () => {
  it('writes a note plus foreground, background, cursor, and 16 color slots', () => {
    const lines = renderXresources(palette()).trim().split('\n')
    expect(lines).toHaveLength(20)
    expect(lines.at(-1)).toMatch(/^\*\.color15:\s+#[0-9A-F]{6}$/)
  })
})

describe('renderI3lock', () => {
  it('replaces bare hexes and preserves the ff alpha suffix', () => {
    const tones = new Map([
      ['#131210', '#15110f'],
      ['#879b5c', '#d98c63'],
    ])
    const out = renderI3lock('i3lock -c 131210 --ring-color=879b5cff', tones)
    expect(out).toBe('i3lock -c 15110f --ring-color=d98c63ff')
  })

  it('throws on colors outside the tone map', () => {
    expect(() => renderI3lock('--keyhlcolor=123456ff', new Map())).toThrow(/tone map/)
  })
})
