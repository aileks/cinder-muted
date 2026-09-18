import { renderSvg } from './render/svg.ts'
import { palette } from './palette.ts'

// Every generated file in the repo, path -> exact content. Build writes them,
// check compares them.
export function renderOutputs(): Map<string, string> {
  return new Map([['palette.svg', renderSvg(palette())]])
}
