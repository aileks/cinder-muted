import { applyTones, GENERATED_NOTE, rename } from './substitute.ts'

// Grove configs that only need colors and names swapped.

export function renderCava(template: string, tones: Map<string, string>): string {
  return `# ${GENERATED_NOTE}\n${applyTones(template, tones)}`
}

export function renderBtop(template: string, tones: Map<string, string>): string {
  return `# ${GENERATED_NOTE}\n${applyTones(template, tones)}`
}

export function renderQt6ct(template: string, tones: Map<string, string>): string {
  return `# ${GENERATED_NOTE}\n${applyTones(template, tones)}`
}

export function renderBatTheme(template: string, tones: Map<string, string>): string {
  const renamed = rename(template, [
    ['Caspian Harper', 'Kieran Pedrick <kieran@aileks.dev>'],
    [/Cinder Grove/g, 'Cinder Muted'],
    ['theme.dark.cinder-grove', 'theme.dark.cinder-muted'],
    // Distinct uuid so bat's theme cache keeps grove and muted apart.
    ['b3437e78-ba04-4c87-b602-b41da2f987f8', 'd41f9b6e-2c58-4a17-8e0d-6f9c31b2a745'],
  ])
  return applyTones(renamed, tones)
}

export function renderYaziThemeToml(template: string, tones: Map<string, string>): string {
  return `# ${GENERATED_NOTE}\n${applyTones(
    rename(template, [['cinder-grove.tmTheme', 'cinder-muted.tmTheme']]),
    tones,
  )}`
}

export function renderYaziTheme(template: string, tones: Map<string, string>): string {
  return applyTones(rename(template, [[/Cinder Grove/g, 'Cinder Muted']]), tones)
}
