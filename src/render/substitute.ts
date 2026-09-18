// Unknown colors throw instead of passing through, so a newly added upstream color cannot ship in output unchanged.

const HEX_RE = /#([0-9A-Fa-f]{8}|[0-9A-Fa-f]{6})(?![0-9A-Fa-f])/g
const RGB_RE = /rgb\((\d+) (\d+) (\d+)( ?\/ ?[0-9.]+%?)?\)/g

export function applyTones(text: string, tones: Map<string, string>): string {
  const hexes = text.replace(HEX_RE, (match, digits: string) => {
    let tone = tones.get(`#${digits.toLowerCase()}`)
    if (tone !== undefined) return tone

    // Eight digits are ambiguous: bat writes #RRGGBBAA, qt6ct #AARRGGBB.
    // Try both splits and keep the one whose rgb part is a known source color.
    const suffix = tones.get(`#${digits.slice(0, 6).toLowerCase()}`)
    if (suffix !== undefined) return `#${suffix.slice(1)}${digits.slice(6)}`.toLowerCase()
    const prefix = tones.get(`#${digits.slice(2).toLowerCase()}`)
    if (prefix !== undefined) return `#${digits.slice(0, 2)}${prefix.slice(1)}`.toLowerCase()

    throw new Error(`source color ${match} is not in the tone map`)
  })

  return hexes.replace(RGB_RE, (match, r: string, g: string, b: string, alpha?: string) => {
    const tone = tones.get(`${r},${g},${b}`)
    if (tone !== undefined) {
      const value = tone.slice(1)
      const rgb = [
        parseInt(value.slice(0, 2), 16),
        parseInt(value.slice(2, 4), 16),
        parseInt(value.slice(4, 6), 16),
      ].join(' ')
      return `rgb(${rgb}${alpha ?? ''})`
    }
    if (r === g && g === b && (r === '0' || r === '255')) return match
    throw new Error(`source rgb(${r} ${g} ${b}) is not in the tone map`)
  })
}

export function rename(text: string, pairs: [string | RegExp, string][]): string {
  return pairs.reduce(
    (result, [from, to]) =>
      typeof from === 'string' ? result.replaceAll(from, to) : result.replace(from, to),
    text,
  )
}

export const GENERATED_NOTE = 'Auto-generated file. Do not edit!'
