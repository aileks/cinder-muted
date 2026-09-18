import { readFile, access } from 'node:fs/promises'
import { renderOutputs } from './outputs.ts'

let stale = 0
for (const [path, expected] of renderOutputs()) {
  const actual = await readFile(path, 'utf8').catch(() => null)
  if (actual !== expected) {
    stale += 1
    console.log(`stale: ${path} (run pnpm build and commit the result)`)
  }
}

// The vendored adw-gtk3 base is not generated; it must be committed by hand
// (see gtk/VENDOR.txt). Without it the theme installs without any widget CSS.
const vendoredBase = [
  'gtk/Cinder-Muted-Dark/gtk-3.0/base/gtk.css',
  'gtk/Cinder-Muted-Dark/gtk-4.0/base/libadwaita.css',
]
for (const path of vendoredBase) {
  if ((await access(path).catch(() => null)) === null) {
    stale += 1
    console.log(`missing vendored file: ${path} (see gtk/VENDOR.txt)`)
  }
}

if (stale > 0) process.exit(1)
console.log('all generated files in sync')
