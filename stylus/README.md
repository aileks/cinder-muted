# Cinder Muted for Stylus

Per-site userstyles for the [Stylus extension](https://github.com/openstyles/stylus), plus a conservative global fallback.

| Style | Sites |
| --- | --- |
| [GitHub](github/cinder-muted.user.css) | github.com, gist.github.com |
| [DuckDuckGo](duckduckgo/cinder-muted.user.css) | duckduckgo.com, duck.ai, start.duckduckgo.com |
| [Wikipedia](wikipedia/cinder-muted.user.css) | wikipedia.org |
| [YouTube](youtube/cinder-muted.user.css) | youtube.com |
| [Reddit](reddit/cinder-muted.user.css) | reddit.com, old.reddit.com |
| [Hacker News](hacker-news/cinder-muted.user.css) | news.ycombinator.com |
| [Lobsters](lobsters/cinder-muted.user.css) | lobste.rs |
| [MDN](mdn/cinder-muted.user.css) | developer.mozilla.org |
| [Global fallback](global/cinder-muted.user.css) | everything else |

## Install

With Stylus installed, open a style's `cinder-muted.user.css` raw file and Stylus offers a one-click install; the styles update automatically from this repo afterwards. In Stylus you can also create a new style and paste the file contents.

The global fallback is deliberately conservative (`color-scheme: dark`, base surfaces, links, forms, code blocks) so sites that define their own colors mostly win; the per-site styles go much further. Global exposes `--cinder-*` variables for per-site extensions.

## Development

Each site style is generated: `templates/stylus/<slug>.css` holds the selector body written with Cinder Grove hexes, and `pnpm build` renders it through the same tone map as every other port, wrapped in a UserStyle header with `@updateURL` pointing at this repo's raw file.

The selector work is adapted from [catppuccin/userstyles](https://github.com/catppuccin/userstyles) (MIT): their Less flavor machinery is stripped, the dark-branch rules are kept, and their palette tokens resolve to Cinder Grove hexes before generation (`@base` -> `#131210`, `@text` -> `#BBB3A9`, `@accent` -> `#E17A3F`, and so on). Site-native colors that appear in selector attribute values stay verbatim via the site's `nativeColors` list in `src/render/stylus.ts`.

To add a site:

1. Add a `SITES` entry (slug, name, domains, description, native colors).
2. Fetch the site's `catppuccin.user.less`, strip the flavor machinery, resolve tokens to grove hexes, and save as `templates/stylus/<slug>.css`. Keep alpha overlays as `rgb(R G B / A%)` space syntax so the tone map converts them.
3. `pnpm build` renders `stylus/<slug>/cinder-muted.user.css`.
4. Bump `STYLUS_VERSION` in `src/render/stylus.ts` when changing any style so installed copies update.

The build fails on any color the tone map does not recognize, so a missed palette token cannot leak through silently.
