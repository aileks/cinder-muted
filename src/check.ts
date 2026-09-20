import { access, readFile } from 'node:fs/promises'
import { palette, terminalColors } from './palette.ts'
import { renderOutputs } from './outputs.ts'

let failures = 0

for (const [path, expected] of renderOutputs()) {
  const actual = await readFile(path, 'utf8').catch(() => null)
  if (actual !== expected) {
    failures += 1
    console.log(`stale: ${path} (run pnpm build and commit the result)`)
  }
}

// The vendored adw-gtk3 base is maintained by hand (see gtk/VENDOR.txt).
// Without it the theme installs without any widget CSS.
const vendoredBase = [
  'gtk/Cinder-Muted-Dark/gtk-3.0/base/gtk.css',
  'gtk/Cinder-Muted-Dark/gtk-4.0/base/libadwaita.css',
]
for (const path of vendoredBase) {
  if ((await access(path).catch(() => null)) === null) {
    failures += 1
    console.log(`missing vendored file: ${path} (see gtk/VENDOR.txt)`)
  }
}

// Port files are maintained by hand; the two ANSI-16 mirrors must stay in
// step with terminalColors() when the palette changes.
const expected = terminalColors(palette()).map((hex) => hex.toUpperCase())
const xrdbColors = [
  ...(await readFile('xresources/cinder-muted.xrdb', 'utf8')).matchAll(
    /^\*\.color(\d+):\s+(#[0-9A-F]{6})$/gm,
  ),
]
  .sort((a, b) => Number(a[1]) - Number(b[1]))
  .map((match) => match[2])
const stColors = [
  ...(await readFile('st/colors.h', 'utf8')).matchAll(/^\s*"(#[0-9A-F]{6})",$/gm),
].map((match) => match[1])
for (const [path, colors] of [
  ['xresources/cinder-muted.xrdb', xrdbColors],
  ['st/colors.h', stColors],
] as const) {
  if (colors.join() !== expected.join()) {
    failures += 1
    console.log(`drifted: ${path} (colors no longer match terminalColors())`)
  }
}

if (failures > 0) process.exit(1)
console.log('rendered files in sync, terminal port colors match')
