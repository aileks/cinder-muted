import { readFile } from 'node:fs/promises'
import { renderOutputs } from './outputs.ts'

let stale = 0
for (const [path, expected] of renderOutputs()) {
  const actual = await readFile(path, 'utf8').catch(() => null)
  if (actual !== expected) {
    stale += 1
    console.log(`stale: ${path} (run pnpm build and commit the result)`)
  }
}
if (stale > 0) process.exit(1)
console.log('all generated files in sync')
