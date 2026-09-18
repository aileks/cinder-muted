import { applyTones, GENERATED_NOTE, rename } from './substitute.ts'

export function renderCava(template: string, tones: Map<string, string>): string {
  return `# ${GENERATED_NOTE}\n${applyTones(template, tones)}`
}

export function renderBtop(template: string, tones: Map<string, string>): string {
  return `# ${GENERATED_NOTE}\n${applyTones(template, tones)}`
}

export function renderQt6ct(template: string, tones: Map<string, string>): string {
  return `# ${GENERATED_NOTE}\n${applyTones(template, tones)}`
}

export function renderDunst(template: string, tones: Map<string, string>): string {
  return `# ${GENERATED_NOTE}\n${applyTones(template, tones)}`
}

export function renderRofi(template: string, tones: Map<string, string>): string {
  return `/* ${GENERATED_NOTE} */\n${applyTones(template, tones)}`
}



export function renderStHeader(template: string, tones: Map<string, string>): string {
  return `/* ${GENERATED_NOTE} */\n${applyTones(template, tones)}`
}

// i3lock colors have no leading #, so do the color swap by hand here.
export function renderI3lock(template: string, tones: Map<string, string>): string {
  const colored = template.replace(
    /([0-9a-f]{6})(ff)?(?![0-9a-f])/g,
    (match, digits: string, alpha?: string) => {
      const tone = tones.get(`#${digits}`)
      if (tone === undefined) throw new Error(`i3lock color ${match} is not in the tone map`)
      return `${tone.slice(1)}${alpha ?? ''}`
    },
  )
  return colored.replace('#!/bin/sh\n', `#!/bin/sh\n# ${GENERATED_NOTE}\n`)
}

export function renderFzf(template: string, tones: Map<string, string>): string {
  return `# ${GENERATED_NOTE}\n${applyTones(template, tones)}`
}

export function renderBatTheme(template: string, tones: Map<string, string>): string {
  // Angle brackets must stay escaped inside the plist strings.
  const renamed = rename(template, [
    ['Caspian Harper', 'Kieran Pedrick &lt;kieran@aileks.dev&gt;'],
    [/Cinder Grove/g, 'Cinder Muted'],
    ['theme.dark.cinder-grove', 'theme.dark.cinder-muted'],
    // Distinct uuid so bat's theme cache keeps the two themes apart.
    ['b3437e78-ba04-4c87-b602-b41da2f987f8', 'd41f9b6e-2c58-4a17-8e0d-6f9c31b2a745'],
  ])
  return applyTones(renamed, tones)
}

export function renderYaziTheme(template: string, tones: Map<string, string>): string {
  return applyTones(rename(template, [[/Cinder Grove/g, 'Cinder Muted']]), tones)
}
