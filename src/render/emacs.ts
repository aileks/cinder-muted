import { applyTones, rename } from './substitute.ts'

const AUTHOR = ';; Author: Kieran Pedrick <kieran@aileks.dev>'
const BOILERPLATE_RE =
  /;; This program is free software.*?<https:\/\/www\.gnu\.org\/licenses\/>\.\n+/s

// The cinder-grove.el theme file with renamed identifiers and retuned colors.
// The copyright boilerplate collapses to the SPDX line.
export function renderEmacs(template: string, tones: Map<string, string>): string {
  const renamed = rename(template, [
    // Drop the nvim port credit. The muted theme derives from cinder-grove.el,
    // and the blanket rename below would otherwise turn it into a false
    // cinder-muted.nvim claim.
    [/  Ported from\n;; cinder-grove\.nvim \(https:\/\/github\.com\/aileks\/cinder-grove\.nvim\)\./, ''],
    ['https://github.com/aileks/cinder-grove.el', 'https://github.com/aileks/cinder-muted'],
    [/;; Copyright \(C\) \d+ aileks\n\n/, ''],
    [/;; Author: aileks/, AUTHOR],
    [/cinder-grove/g, 'cinder-muted'],
    [/Cinder Grove/g, 'Cinder Muted'],
  ])
  if (renamed.includes('nvim')) throw new Error('emacs template still mentions nvim')

  const stripped = renamed.replace(BOILERPLATE_RE, '')
  if (stripped === renamed) throw new Error('emacs template has no license boilerplate')
  if (stripped.includes('Copyright')) throw new Error('emacs template still has a copyright line')

  const noted = stripped.replace(
    ';;; Commentary:',
    ';;; Commentary:\n\n;; Auto-generated file. Do not edit!\n;; Derived from cinder-grove.el.',
  )
  if (noted === stripped) throw new Error('emacs template has no Commentary header')
  return applyTones(noted, tones)
}
