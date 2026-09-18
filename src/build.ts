import { mkdir, writeFile } from 'node:fs/promises'
import { dirname } from 'node:path'
import { renderOutputs } from './outputs.ts'

for (const [path, content] of renderOutputs()) {
  await mkdir(dirname(path), { recursive: true })
  await writeFile(path, content)
  console.log(`wrote ${path}`)
}
