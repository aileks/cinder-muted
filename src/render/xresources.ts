import { TERMINAL_SLOTS, type SourceSlot } from '../palette.ts'

// Slot order matches cinder-grove.nvim's terminal colors.
export function renderXresources(palette: Record<SourceSlot, string>): string {
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
