# Cinder Muted for Doom Emacs

A Doom Emacs dark theme in muted ember tones. Set `cm-transparent` to true for a transparent background.

## Install

```elisp
;; packages.el
(package! cinder-muted
  :recipe (:host github :repo "aileks/cinder-muted"
           :files ("emacs/cinder-muted-theme.el")))
```

```elisp
;; config.el
(setq doom-theme 'cinder-muted)
```

Run `doom sync` after adding the recipe.

The theme overrides `doom-dashboard-default` so the dashboard canvas matches editing buffers.
