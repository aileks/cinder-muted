import { TERMINAL_SLOTS, type GroveSlot } from '../palette.ts'

// The slot order is shared with cinder-grove's terminal colors, so Xresources
// and nvim cannot drift apart.
export function renderXresources(palette: Record<GroveSlot, string>): string {
  const colors = TERMINAL_SLOTS.map(
    (slot, index) => `*.color${index}:  ${palette[slot].toUpperCase()}`,
  )
  return `! Auto-generated file. Do not edit!
*.foreground: ${palette.text.toUpperCase()}
*.background: ${palette.background.toUpperCase()}
*.cursorColor: ${palette.text_bright.toUpperCase()}
${colors.join('\n')}
`
}
