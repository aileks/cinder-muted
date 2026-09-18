# Cinder Muted for Emacs

A single-file custom theme covering built-in faces plus corfu, vertico, magit, org, and more. The `cg-transparent` option from cinder-grove.el works unchanged.

## Doom Emacs

```elisp
;; packages.el
(package! cinder-muted
  :recipe (:host github :repo "aileks/cinder-muted"))
```

```elisp
;; config.el
(setq doom-theme 'cinder-muted)
```

Run `doom sync` after adding the recipe.

## straight.el

```elisp
(straight-use-package
 '(cinder-muted :type git :host github :repo "aileks/cinder-muted"))

(setq doom-theme 'cinder-muted)
```

## Manual

Download `cinder-muted-theme.el` from the repo root, then:

```elisp
(add-to-list 'custom-theme-load-path "/path/to/dir-with-cinder-muted-theme-el")
(load-theme 'cinder-muted t)
```
