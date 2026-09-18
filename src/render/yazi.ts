import type { GroveSlot } from '../palette.ts'

// Grove's yazi colors separate file types by hue, which a one-hue palette
// collapses. This renderer assigns lightness steps instead: directories
// brightest for scanning, executables in the primary tone, media and archives
// at the warning and error steps.
export function renderYaziThemeToml(palette: Record<GroveSlot, string>): string {
  const p = palette
  return `[app]
"overall" = { "fg" = "${p.text}" }

[cmp]
"active" = { "bg" = "${p.visual}", "fg" = "${p.text_bright}" }
"border" = { "fg" = "${p.primary}" }
"inactive" = { "fg" = "${p.text}" }

[confirm]
"border" = { "fg" = "${p.primary}" }
"btn_no" = { "fg" = "${p.text_subtle}" }
"btn_yes" = { "bg" = "${p.visual}", "fg" = "${p.text_bright}" }
"title" = { "fg" = "${p.primary}" }

[filetype]
"rules" = [
  { "fg" = "${p.text_bright}", "url" = "*/" },
  { "fg" = "${p.primary}", "is" = "exec" },
  { "fg" = "${p.error}", "is" = "orphan" },
  { "fg" = "${p.warning}", "mime" = "**/image/*" },
  { "fg" = "${p.secondary}", "mime" = "**/{audio,video}/*" },
  { "fg" = "${p.error}", "mime" = "**/application/{zip,rar,7z*,tar,gzip,xz,zstd,bzip*,lzma,compress,archive,cpio,arj,xar,ms-cab*}" },
  { "fg" = "${p.cyan}", "mime" = "**/application/{pdf,doc,rtf}" },
  { "fg" = "${p.text_subtle}", "mime" = "vfs/{absent,stale}" },
]

[help]
"action" = { "fg" = "${p.text}" }
"border" = { "fg" = "${p.primary}" }
"chord" = { "fg" = "${p.secondary}" }
"hovered" = { "bg" = "${p.visual}", "bold" = true, "fg" = "${p.text_bright}" }

[indicator]
"current" = { "bg" = "${p.surface}", "fg" = "${p.text_bright}" }
"parent" = { "bg" = "${p.surface}", "fg" = "${p.text_bright}" }
"preview" = { "underline" = true }

[input]
"border" = { "fg" = "${p.primary}" }
"selected" = { "bg" = "${p.visual}", "fg" = "${p.text_bright}" }
"title" = { "fg" = "${p.primary}" }
"value" = { "fg" = "${p.text}" }

[mgr]
"border_style" = { "fg" = "${p.overlay}" }
"count_copied" = { "bg" = "${p.secondary}", "fg" = "${p.background}" }
"count_cut" = { "bg" = "${p.error}", "fg" = "${p.background}" }
"count_selected" = { "bg" = "${p.warning}", "fg" = "${p.background}" }
"cwd" = { "fg" = "${p.secondary}" }
"find_keyword" = { "bold" = true, "fg" = "${p.warning}" }
"find_position" = { "bold" = true, "fg" = "${p.primary}" }
"marker_copied" = { "bg" = "${p.secondary}", "fg" = "${p.secondary}" }
"marker_cut" = { "bg" = "${p.error}", "fg" = "${p.error}" }
"marker_marked" = { "bg" = "${p.cyan}", "fg" = "${p.cyan}" }
"marker_selected" = { "bg" = "${p.warning}", "fg" = "${p.warning}" }
"syntect_theme" = "~/.config/yazi/cinder-muted.tmTheme"

[mode]
"normal_alt" = { "bg" = "${p.surface}", "fg" = "${p.text_bright}" }
"normal_main" = { "bg" = "${p.primary}", "bold" = true, "fg" = "${p.background}" }
"select_alt" = { "bg" = "${p.surface}", "fg" = "${p.text_bright}" }
"select_main" = { "bg" = "${p.secondary}", "bold" = true, "fg" = "${p.background}" }
"unset_alt" = { "bg" = "${p.surface}", "fg" = "${p.text_bright}" }
"unset_main" = { "bg" = "${p.error}", "bold" = true, "fg" = "${p.background}" }

[notify]
"title_error" = { "fg" = "${p.error}" }
"title_info" = { "fg" = "${p.secondary}" }
"title_warn" = { "fg" = "${p.warning}" }

[pick]
"active" = { "bg" = "${p.visual}", "fg" = "${p.text_bright}" }
"border" = { "fg" = "${p.primary}" }
"inactive" = { "fg" = "${p.text}" }

[spot]
"border" = { "fg" = "${p.primary}" }
"tbl_cell" = { "bg" = "${p.visual}", "fg" = "${p.text_bright}" }
"tbl_col" = { "fg" = "${p.secondary}" }
"title" = { "fg" = "${p.primary}" }

[status]
"overall" = { "bg" = "${p.container}", "fg" = "${p.text}" }
"perm_exec" = { "fg" = "${p.secondary}" }
"perm_read" = { "fg" = "${p.warning}" }
"perm_sep" = { "fg" = "${p.overlay}" }
"perm_type" = { "fg" = "${p.secondary}" }
"perm_write" = { "fg" = "${p.error}" }
"progress_error" = { "bg" = "${p.error}", "fg" = "${p.warning}" }
"progress_label" = { "bold" = true, "fg" = "${p.text_bright}" }
"progress_normal" = { "bg" = "${p.surface}", "fg" = "${p.secondary}" }

[tabs]
"active" = { "bg" = "${p.primary}", "bold" = true, "fg" = "${p.background}" }
"inactive" = { "bg" = "${p.container}", "fg" = "${p.text_subtle}" }

[tasks]
"border" = { "fg" = "${p.primary}" }
"hovered" = { "bg" = "${p.visual}", "fg" = "${p.text_bright}" }
"title" = { "fg" = "${p.primary}" }

[which]
"border" = { "fg" = "${p.primary}" }
"cand" = { "fg" = "${p.cyan}" }
"desc" = { "fg" = "${p.text}" }
"rest" = { "fg" = "${p.overlay}" }
"separator_style" = { "fg" = "${p.overlay}" }
`
}
