# Cinder Muted GTK theme

An adw-gtk3/libadwaita theme with the Cinder Muted palette. The stock base CSS is vendored from adw-gtk3 (see [VENDOR.txt](./VENDOR.txt)).

## Install

```sh
./install.sh
```

The script copies `Cinder-Muted-Dark` to `~/.local/share/themes/`, writes the libadwaita overlay to `~/.config/gtk-4.0/gtk.css` (existing files are backed up), and points gsettings at the theme. Restart GTK apps afterwards.

To remove it, delete `~/.local/share/themes/Cinder-Muted-Dark` and restore the `gtk.css.cinder-muted-backup` file if present.
