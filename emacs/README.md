# Cinder Muted for Emacs

A single-file custom theme covering built-in faces plus corfu, vertico, magit, org, and more. The `cg-transparent` option from cinder-grove.el works unchanged.

## Doom Emacs

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

## straight.el

```elisp
(straight-use-package
 '(cinder-muted-theme :type git :host github :repo "aileks/cinder-muted"
   :files ("emacs/cinder-muted-theme.el")))
```

## Manual

Download `emacs/cinder-muted-theme.el` from the repo, then:

```elisp
(add-to-list 'custom-theme-load-path "/path/to/dir-containing-cinder-muted-theme-el")
(load-theme 'cinder-muted t)
```
