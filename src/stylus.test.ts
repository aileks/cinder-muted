import { describe, expect, it } from 'vitest'
import { toneMap } from './palette.ts'
import { SITES, renderStylusSite } from './render/stylus.ts'
import { applyTones } from './render/substitute.ts'

describe('renderStylusSite', () => {
  const tones = toneMap()

  it('wraps every template in a UserStyle header and domain rule', () => {
    for (const site of SITES) {
      const out = renderStylusSite(site, 'body { color: #131210; }', tones)
      expect(out).toContain(`@name           Cinder Muted - ${site.name}`)
      expect(out).toContain('@updateURL')
      expect(out).toContain('@-moz-document')
      for (const domain of site.domains) {
        expect(out).toContain(`domain("${domain}")`)
      }
      expect(out).toContain('catppuccin/userstyles, MIT')
    }
  })

  it('substitutes template colors and preserves site-native colors', () => {
    const hn = SITES.find((s) => s.slug === 'hacker-news')!
    const out = renderStylusSite(
      hn,
      'a { color: #131210; } [bgcolor="#ff6600"] { background: #1B1916; }',
      tones,
    )
    expect(out).toContain('color: #16110f;')
    expect(out).toContain('background: #1f1714;')
    expect(out).toContain('[bgcolor="#ff6600"]')
  })
})

describe('applyTones preserve', () => {
  it('skips preserved hex and rgb decimal forms', () => {
    const preserve = new Set(['de5833', '222,88,51'])
    const tones = new Map([['#131210', '#16110f']])
    const out = applyTones(
      'a { color: #de5833; } [style*="color: rgb(222, 88, 51);"] b { color: #131210; }',
      tones,
      preserve,
    )
    expect(out).toContain('#de5833')
    expect(out).toContain('rgb(222, 88, 51)')
    expect(out).toContain('#16110f')
  })
})

describe('stylus palette', () => {
  it('produces valid hex tones for every mapped color', () => {
    for (const tone of toneMap().values()) {
      expect(tone, tone).toMatch(/^#[0-9a-f]{6}$/)
    }
  })
})
