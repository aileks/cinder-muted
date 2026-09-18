import { applyTones, rename } from './substitute.ts'

const AUTHOR = ';; Author: Kieran Pedrick <kieran@aileks.dev>'
const BOILERPLATE_RE =
  /;; This program is free software.*?<https:\/\/www\.gnu\.org\/licenses\/>\.\n+/s

// Grove's theme file with renamed identifiers and retuned colors. Mentions of
// cinder-grove.nvim are shielded so provenance survives the rename, and the
// copyright boilerplate collapses to the SPDX line.
export function renderEmacs(template: string, tones: Map<string, string>): string {
  const PLACEHOLDER = '__GROVE_NVIM__'
  const renamed = rename(template, [
    ['cinder-grove.nvim', PLACEHOLDER],
    ['https://github.com/aileks/cinder-grove.el', 'https://github.com/aileks/cinder-muted'],
    [/;; Copyright \(C\) \d+ aileks\n\n/, ''],
    [/;; Author: aileks/, AUTHOR],
    [/cinder-grove/g, 'cinder-muted'],
    [/Cinder Grove/g, 'Cinder Muted'],
    [PLACEHOLDER, 'cinder-grove.nvim'],
  ])
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
