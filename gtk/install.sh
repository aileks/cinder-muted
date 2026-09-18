#!/bin/sh

set -eu

theme_name=Cinder-Muted-Dark
script_dir=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd)
theme_source=$script_dir/Cinder-Muted-Dark
data_home=${XDG_DATA_HOME:-$HOME/.local/share}
config_home=${XDG_CONFIG_HOME:-$HOME/.config}
theme_dest=$data_home/themes/$theme_name
gtk4_dir=$config_home/gtk-4.0
gtk4_css=$gtk4_dir/gtk.css

[ -f "$theme_source/.cinder-muted-theme" ] || {
  printf 'error: theme package missing at %s\n' "$theme_source" >&2
  exit 1
}

if [ -e "$theme_dest" ] || [ -L "$theme_dest" ]; then
  [ -f "$theme_dest/.cinder-muted-theme" ] || {
    printf 'error: %s exists and is not %s; refusing to replace\n' "$theme_dest" "$theme_name" >&2
    exit 1
  }
  rm -rf "$theme_dest"
fi

# libadwaita apps ignore ~/.themes; feed them the overlay through the user css.
if [ -e "$gtk4_css" ] || [ -L "$gtk4_css" ]; then
  mv "$gtk4_css" "$gtk4_css.cinder-muted-backup"
  printf 'backed up previous gtk.css to %s.cinder-muted-backup\n' "$gtk4_css"
fi

mkdir -p "$data_home/themes" "$gtk4_dir"
cp -R "$theme_source" "$theme_dest"

{
  cat "$theme_dest/gtk-4.0/cinder-muted.css"
  printf '\n'
  cat "$theme_dest/gtk-4.0/accent.css"
} > "$gtk4_css"

if command -v gsettings >/dev/null 2>&1; then
  gsettings set org.gnome.desktop.interface gtk-theme "$theme_name"
  gsettings set org.gnome.desktop.interface color-scheme prefer-dark
fi

printf 'installed %s; restart GTK apps (nautilus --quit)\n' "$theme_name"
