;;; cinder-muted-theme.el --- A warm, muted dark theme  -*- lexical-binding: t; -*-

;; Author: Kieran Pedrick <kieran@aileks.dev>
;; URL: https://github.com/aileks/cinder-muted
;; Version: 1.0.0
;; Package-Requires: ((emacs "30.1"))
;; Keywords: faces, themes
;; SPDX-License-Identifier: GPL-3.0-or-later

;;; Commentary:

;; Auto-generated file. Do not edit!
;; Derived from cinder-grove.el.

;; A warm, muted dark theme that's easy on the eyes.

;; Covers built-in faces plus corfu, vertico, marginalia, orderless,
;; consult, embark, which-key, avy, ace-window, anzu, transient,
;; magit, diff-hl, ediff, smerge, flycheck, flymake, eglot, lsp-mode, org,
;; markdown, diredfl, dirvish, doom-modeline, solaire, evil
;; (goggles, snipe, traces), dashboard, vterm, term, and more.

;;; Code:

(deftheme cinder-muted
  "Cinder Muted: a Doom Emacs dark theme in muted ember tones."
  :background-mode 'dark
  :kind 'color-scheme)

(defgroup cinder-muted nil
  "Cinder Muted theme."
  :group 'faces
  :prefix "cinder-muted-")

(defconst cinder-muted-bg        "#15110f")
(defconst cinder-muted-container "#1e1815")
(defconst cinder-muted-surface   "#271e1a")
(defconst cinder-muted-visual    "#443831")
(defconst cinder-muted-muted     "#5f5049")
(defconst cinder-muted-subtle    "#a39086")
(defconst cinder-muted-secondary "#b5a196")
(defconst cinder-muted-fg        "#c5afa4")
(defconst cinder-muted-bright    "#e9d1c5")
(defconst cinder-muted-orange    "#f1a278")
(defconst cinder-muted-green     "#d98c63")
(defconst cinder-muted-red       "#a45751")
(defconst cinder-muted-yellow    "#ffbd9b")
(defconst cinder-muted-blue      "#944d24")
(defconst cinder-muted-purple    "#ab6139")
(defconst cinder-muted-cyan      "#c2764e")

(defcustom cm-transparent nil
  "Use the terminal's default background when non-nil.
GUI frames always use the theme's dark canvas; set the frame
parameter `alpha-background' separately for GUI transparency.
Popup faces retain explicit backgrounds.  Reload the theme with
`load-theme' after changing this option."
  :type 'boolean
  :group 'cinder-muted)

;; Match the terminal canvas without changing frame defaults outside the theme.
(let ((tty-background (if cm-transparent "unspecified-bg" cinder-muted-bg)))
  (custom-theme-set-faces
   'cinder-muted
   `(default ((((type tty)) (:background ,tty-background
                             :foreground ,cinder-muted-fg))
              (t (:background ,cinder-muted-bg :foreground ,cinder-muted-fg))))
   `(fringe ((((type tty)) (:background ,tty-background
                            :foreground ,cinder-muted-muted))
             (t (:background ,cinder-muted-bg :foreground ,cinder-muted-muted))))))

(custom-theme-set-faces
 'cinder-muted

 ;; --- base -------------------------------------------------------------------
 `(cursor ((t (:background ,cinder-muted-orange))))
 `(region ((t (:background ,cinder-muted-visual))))
 `(highlight ((t (:background ,cinder-muted-surface))))
 `(hl-line ((t (:background ,cinder-muted-container))))
 `(secondary-selection ((t (:background ,cinder-muted-visual))))
 `(vertical-border ((t (:foreground ,cinder-muted-muted))))
 `(window-divider ((t (:foreground ,cinder-muted-visual))))
 `(shadow ((t (:foreground ,cinder-muted-subtle))))
 `(escape-glyph ((t (:foreground ,cinder-muted-muted))))
 `(nobreak-space ((t (:foreground ,cinder-muted-yellow :underline t))))
 `(file-name-shadow ((t (:inherit shadow))))
 `(fill-column-indicator ((t (:foreground ,cinder-muted-visual))))
 `(line-number ((t (:foreground ,cinder-muted-muted :background unspecified))))
 `(line-number-current-line ((t (:foreground ,cinder-muted-orange
                                 :background ,cinder-muted-surface
                                 :bold t))))
 `(minibuffer-prompt ((t (:foreground ,cinder-muted-orange :bold t))))
 `(trailing-whitespace ((t (:background ,cinder-muted-surface))))
 `(show-paren-match ((t (:background ,cinder-muted-visual :bold t))))
 `(show-paren-mismatch ((t (:foreground ,cinder-muted-bg
                            :background ,cinder-muted-red))))
 `(match ((t (:background ,cinder-muted-surface
              :foreground ,cinder-muted-orange))))

 ;; --- search -------------------------------------------------------------------
 `(isearch ((t (:background ,cinder-muted-orange :foreground ,cinder-muted-bg))))
 `(isearch-fail ((t (:foreground ,cinder-muted-red :underline t))))
 `(lazy-highlight ((t (:background ,cinder-muted-visual
                       :foreground ,cinder-muted-bright))))
 `(query-replace ((t (:inherit isearch))))

 ;; --- mode-line, header-line, tab-bar ---------------------------------------------
 `(mode-line ((t (:background ,cinder-muted-container
                  :foreground ,cinder-muted-bright
                  :box (:color ,cinder-muted-muted)))))
 `(mode-line-inactive ((t (:background ,cinder-muted-surface
                           :foreground ,cinder-muted-subtle
                           :box (:color ,cinder-muted-container)))))
 `(mode-line-active ((t (:inherit mode-line))))
 `(mode-line-buffer-id ((t (:foreground ,cinder-muted-orange :bold t))))
 `(mode-line-highlight ((t (:foreground ,cinder-muted-orange))))
 `(mode-line-emphasis ((t (:foreground ,cinder-muted-bright :bold t))))
 `(header-line ((t (:inherit mode-line))))
 `(header-line-highlight ((t (:inherit mode-line-highlight))))
 `(tab-bar ((t (:background ,cinder-muted-container
                :foreground ,cinder-muted-subtle))))
 `(tab-bar-tab ((t (:background ,cinder-muted-surface
                    :foreground ,cinder-muted-bright :weight bold))))
 `(tab-bar-tab-inactive ((t (:background ,cinder-muted-container
                             :foreground ,cinder-muted-subtle))))
 `(tab-bar-tab-group-current ((t (:foreground ,cinder-muted-orange :bold t))))
 `(tab-bar-tab-group-inactive ((t (:inherit tab-bar-tab-inactive))))
 `(tab-line ((t (:inherit tab-bar))))
 `(tab-line-tab ((t (:inherit tab-bar-tab-inactive))))
 `(tab-line-tab-current ((t (:inherit tab-bar-tab))))
 `(tab-line-tab-inactive ((t (:inherit tab-bar-tab-inactive))))
 `(tab-line-tab-inactive-alternate ((t (:inherit tab-line-tab-inactive))))
 `(tab-line-highlight ((t (:background ,cinder-muted-visual
                           :foreground ,cinder-muted-bright))))
 `(tab-line-close-highlight ((t (:foreground ,cinder-muted-orange))))

 ;; --- doom-modeline ---------------------------------------------------------------
 `(doom-modeline-bar ((t (:background ,cinder-muted-orange))))
 `(doom-modeline-bar-inactive ((t (:background ,cinder-muted-muted))))
 `(doom-modeline-buffer-file ((t (:foreground ,cinder-muted-bright))))
 `(doom-modeline-buffer-path ((t (:foreground ,cinder-muted-bright))))
 `(doom-modeline-buffer-major-mode ((t (:foreground ,cinder-muted-cyan))))
 `(doom-modeline-buffer-minor-mode ((t (:inherit shadow))))
 `(doom-modeline-buffer-modified ((t (:foreground ,cinder-muted-orange :bold t))))
 `(doom-modeline-emphasis ((t (:foreground ,cinder-muted-bright :bold t))))
 `(doom-modeline-highlight ((t (:foreground ,cinder-muted-orange))))
 `(doom-modeline-info ((t (:foreground ,cinder-muted-blue))))
 `(doom-modeline-warning ((t (:foreground ,cinder-muted-yellow))))
 `(doom-modeline-urgent ((t (:foreground ,cinder-muted-red :bold t))))
 `(doom-modeline-debug ((t (:foreground ,cinder-muted-purple))))
 `(doom-modeline-debug-visual ((t (:foreground ,cinder-muted-purple :bold t))))
 `(doom-modeline-vcs-default ((t (:foreground ,cinder-muted-green))))
 `(doom-modeline-lsp-error ((t (:foreground ,cinder-muted-red))))
 `(doom-modeline-lsp-warning ((t (:foreground ,cinder-muted-yellow))))
 `(doom-modeline-lsp-success ((t (:foreground ,cinder-muted-green))))
 `(doom-modeline-lsp-running ((t (:foreground ,cinder-muted-yellow))))
 `(doom-modeline-evil-normal-state ((t (:foreground ,cinder-muted-orange :bold t))))
 `(doom-modeline-evil-insert-state ((t (:foreground ,cinder-muted-green :bold t))))
 `(doom-modeline-evil-visual-state ((t (:foreground ,cinder-muted-purple :bold t))))
 `(doom-modeline-evil-replace-state ((t (:foreground ,cinder-muted-red :bold t))))
 `(doom-modeline-evil-emacs-state ((t (:foreground ,cinder-muted-cyan :bold t))))
 `(doom-modeline-evil-motion-state ((t (:foreground ,cinder-muted-blue :bold t))))
 `(doom-modeline-evil-operator-state ((t (:foreground ,cinder-muted-yellow :bold t))))
 `(doom-modeline-evil-user-state ((t (:foreground ,cinder-muted-blue :bold t))))
 `(doom-modeline-battery-critical ((t (:foreground ,cinder-muted-red :bold t))))
 `(doom-modeline-battery-error ((t (:foreground ,cinder-muted-red))))
 `(doom-modeline-battery-warning ((t (:foreground ,cinder-muted-yellow))))
 `(doom-modeline-battery-charging ((t (:foreground ,cinder-muted-green))))
 `(doom-modeline-battery-full ((t (:foreground ,cinder-muted-green))))
 `(doom-modeline-battery-normal ((t (:foreground ,cinder-muted-green))))
 `(doom-modeline-unread-number ((t (:foreground ,cinder-muted-orange :bold t))))
 `(doom-modeline-compilation ((t (:foreground ,cinder-muted-yellow))))
 `(doom-modeline-panel ((t (:background ,cinder-muted-orange
                            :foreground ,cinder-muted-bg :bold t))))
 `(doom-modeline-persp-name ((t (:foreground ,cinder-muted-purple))))
 `(doom-modeline-workspace-name ((t (:foreground ,cinder-muted-orange :bold t))))
 `(doom-modeline-persp-buffer-not-in-persp
   ((t (:inherit shadow :italic t))))
 `(doom-modeline-project-dir ((t (:foreground ,cinder-muted-orange))))
 `(doom-modeline-project-name ((t (:foreground ,cinder-muted-orange))))
 `(doom-modeline-project-parent-dir ((t (:inherit shadow))))
 `(doom-modeline-project-root-dir ((t (:inherit shadow))))
 `(doom-modeline-repl-success ((t (:foreground ,cinder-muted-green))))
 `(doom-modeline-repl-warning ((t (:foreground ,cinder-muted-yellow))))
 `(doom-modeline-overwrite ((t (:foreground ,cinder-muted-red :bold t))))
 `(doom-modeline-time ((t (:foreground ,cinder-muted-subtle))))
 `(doom-modeline-host ((t (:foreground ,cinder-muted-subtle))))
 `(doom-modeline-input-method ((t (:foreground ,cinder-muted-subtle))))

 ;; --- solaire (secondary buffers) ---------------------------------------------------
 `(solaire-default-face ((t (:inherit default :background ,cinder-muted-surface))))
 `(solaire-fringe-face ((t (:inherit fringe :background ,cinder-muted-surface))))
 `(solaire-header-line-face ((t (:inherit header-line
                                 :background ,cinder-muted-surface))))
 `(solaire-hl-line-face ((t (:inherit hl-line :background ,cinder-muted-visual))))
 `(solaire-line-number-face ((t (:inherit line-number
                                 :background ,cinder-muted-surface))))
 `(solaire-mode-line-face ((t (:inherit mode-line))))
 `(solaire-mode-line-active-face ((t (:inherit mode-line-active))))
 `(solaire-mode-line-inactive-face ((t (:inherit mode-line-inactive))))
 `(solaire-region-face ((t (:inherit region))))
 `(solaire-org-hide-face ((t (:foreground ,cinder-muted-surface))))

 ;; --- font lock --------------------------------------------------------------------
 `(font-lock-comment-face ((t (:foreground ,cinder-muted-muted :italic t))))
 `(font-lock-comment-delimiter-face ((t (:inherit font-lock-comment-face))))
 `(font-lock-doc-face ((t (:foreground ,cinder-muted-subtle :italic t))))
 `(font-lock-doc-markup-face ((t (:foreground ,cinder-muted-yellow))))
 `(font-lock-string-face ((t (:foreground ,cinder-muted-green))))
 `(font-lock-keyword-face ((t (:foreground ,cinder-muted-orange))))
 `(font-lock-builtin-face ((t (:foreground ,cinder-muted-blue))))
 `(font-lock-function-name-face ((t (:foreground ,cinder-muted-cyan))))
 `(font-lock-function-call-face ((t (:inherit font-lock-function-name-face))))
 `(font-lock-variable-name-face ((t (:foreground ,cinder-muted-fg))))
 `(font-lock-variable-use-face ((t (:inherit font-lock-variable-name-face))))
 `(font-lock-constant-face ((t (:foreground ,cinder-muted-purple))))
 `(font-lock-type-face ((t (:foreground ,cinder-muted-yellow))))
 `(font-lock-property-name-face ((t (:foreground ,cinder-muted-secondary))))
 `(font-lock-property-use-face ((t (:inherit font-lock-property-name-face))))
 `(font-lock-regexp-face ((t (:inherit font-lock-string-face))))
 `(font-lock-number-face ((t (:foreground ,cinder-muted-purple))))
 `(font-lock-operator-face ((t (:foreground ,cinder-muted-secondary))))
 `(font-lock-punctuation-face ((t (:foreground ,cinder-muted-secondary))))
 `(font-lock-bracket-face ((t (:inherit font-lock-punctuation-face))))
 `(font-lock-delimiter-face ((t (:inherit font-lock-punctuation-face))))
 `(font-lock-misc-punctuation-face ((t (:inherit font-lock-punctuation-face))))
 `(font-lock-preprocessor-face ((t (:foreground ,cinder-muted-orange :italic t))))
 `(font-lock-negation-char-face ((t (:foreground ,cinder-muted-red))))
 `(font-lock-warning-face ((t (:foreground ,cinder-muted-yellow))))
 `(font-lock-escape-face ((t (:foreground ,cinder-muted-bright))))
 `(font-lock-regexp-grouping-backslash ((t (:inherit bold))))
 `(font-lock-regexp-grouping-construct ((t (:inherit bold))))

 ;; --- diagnostics (restrained: colored text, no noisy backgrounds) ----------------
 `(error ((t (:foreground ,cinder-muted-red))))
 `(warning ((t (:foreground ,cinder-muted-yellow))))
 `(success ((t (:foreground ,cinder-muted-green))))
 `(flycheck-error ((t (:underline (:style wave :color ,cinder-muted-red)))))
 `(flycheck-warning ((t (:underline (:style wave :color ,cinder-muted-yellow)))))
 `(flycheck-info ((t (:underline (:style wave :color ,cinder-muted-blue)))))
 `(flycheck-fringe-error ((t (:inherit error))))
 `(flycheck-fringe-warning ((t (:inherit warning))))
 `(flycheck-fringe-info ((t (:inherit compilation-info))))
 `(flycheck-error-list-error ((t (:foreground ,cinder-muted-red :bold t))))
 `(flycheck-error-list-warning ((t (:foreground ,cinder-muted-yellow :bold t))))
 `(flycheck-error-list-info ((t (:foreground ,cinder-muted-blue :bold t))))
 `(flycheck-error-list-line-number ((t (:inherit shadow))))
 `(flycheck-error-list-column-number ((t (:inherit shadow))))
 `(flycheck-error-list-id ((t (:foreground ,cinder-muted-subtle))))
 `(flycheck-error-list-filename ((t (:foreground ,cinder-muted-cyan))))
 `(flymake-error ((t (:underline (:style wave :color ,cinder-muted-red)))))
 `(flymake-warning ((t (:underline (:style wave :color ,cinder-muted-yellow)))))
 `(flymake-note ((t (:underline (:style wave :color ,cinder-muted-blue)))))

 ;; --- eglot ------------------------------------------------------------------------
 `(eglot-highlight-symbol-face ((t (:background ,cinder-muted-visual))))
 `(eglot-diagnostic-tag-unnecessary-face ((t (:inherit shadow))))
 `(eglot-diagnostic-tag-deprecated-face ((t (:strike-through t))))
 `(eglot-inlay-hint-face ((t (:inherit shadow :height 0.8 :slant italic))))
 `(eglot-type-hint-face ((t (:inherit eglot-inlay-hint-face
                             :foreground ,cinder-muted-yellow))))
 `(eglot-parameter-hint-face ((t (:inherit eglot-inlay-hint-face
                                  :foreground ,cinder-muted-orange))))

 ;; --- completions ---------------------------------------------------------------------
 `(completions-common-part ((t (:foreground ,cinder-muted-orange :bold t))))
 `(completions-first-difference ((t (:foreground ,cinder-muted-orange :bold t))))
 `(completions-annotations ((t (:inherit shadow :slant italic))))
 `(completions-highlight ((t (:background ,cinder-muted-visual
                              :foreground ,cinder-muted-bright))))
 `(completions-group-title ((t (:foreground ,cinder-muted-purple :weight bold))))
 `(completions-group-separator ((t (:foreground ,cinder-muted-muted
                                    :strike-through t))))
 `(corfu-default ((t (:background ,cinder-muted-container
                      :foreground ,cinder-muted-fg))))
 `(corfu-current ((t (:background ,cinder-muted-visual
                      :foreground ,cinder-muted-bright))))
 `(corfu-annotations ((t (:inherit completions-annotations))))
 `(corfu-deprecated ((t (:inherit shadow :strike-through t))))
 `(corfu-bar ((t (:background ,cinder-muted-muted))))
 `(corfu-border ((t (:background ,cinder-muted-orange))))
 `(corfu-echo ((t (:inherit completions-annotations))))
 `(corfu-popupinfo ((t (:background ,cinder-muted-container
                        :foreground ,cinder-muted-secondary))))
 `(corfu-quick1 ((t (:foreground ,cinder-muted-orange :bold t))))
 `(corfu-quick2 ((t (:foreground ,cinder-muted-yellow :bold t))))
 `(vertico-current ((t (:background ,cinder-muted-visual
                        :foreground ,cinder-muted-bright))))
 `(vertico-group-title ((t (:inherit completions-group-title))))
 `(vertico-group-separator ((t (:foreground ,cinder-muted-muted))))
 `(orderless-match-face-0 ((t (:foreground ,cinder-muted-orange :bold t))))
 `(orderless-match-face-1 ((t (:foreground ,cinder-muted-yellow :bold t))))
 `(orderless-match-face-2 ((t (:foreground ,cinder-muted-green :bold t))))
 `(orderless-match-face-3 ((t (:foreground ,cinder-muted-cyan :bold t))))
 `(marginalia-documentation ((t (:inherit completions-annotations))))
 `(marginalia-key ((t (:foreground ,cinder-muted-orange :bold t))))
 `(marginalia-value ((t (:foreground ,cinder-muted-green))))
 `(marginalia-lighter ((t (:inherit shadow))))
 `(marginalia-modified ((t (:foreground ,cinder-muted-yellow))))
 `(marginalia-date ((t (:foreground ,cinder-muted-blue))))
 `(marginalia-type ((t (:foreground ,cinder-muted-cyan))))
 `(marginalia-on ((t (:foreground ,cinder-muted-green))))
 `(marginalia-off ((t (:inherit shadow))))
 `(marginalia-installed ((t (:foreground ,cinder-muted-green))))
 `(marginalia-archive ((t (:inherit shadow))))
 `(marginalia-null ((t (:inherit shadow))))
 `(marginalia-number ((t (:foreground ,cinder-muted-purple))))
 `(marginalia-function ((t (:foreground ,cinder-muted-cyan))))
 `(marginalia-symbol ((t (:foreground ,cinder-muted-purple))))
 `(consult-help ((t (:foreground ,cinder-muted-orange))))
 `(consult-key ((t (:foreground ,cinder-muted-orange :bold t))))
 `(consult-grep-context ((t (:inherit completions-annotations))))
 `(consult-preview-line ((t (:background ,cinder-muted-surface))))
 `(consult-preview-insertion ((t (:background ,cinder-muted-surface))))
 `(consult-preview-match ((t (:foreground ,cinder-muted-orange :bold t))))
 `(consult-highlight-match ((t (:foreground ,cinder-muted-orange :bold t))))
 `(consult-highlight-mark ((t (:background ,cinder-muted-visual))))
 `(consult-async-split ((t (:foreground ,cinder-muted-yellow :bold t))))
 `(consult-async-running ((t (:foreground ,cinder-muted-yellow))))
 `(consult-async-failed ((t (:foreground ,cinder-muted-red))))
 `(consult-async-finished ((t (:foreground ,cinder-muted-green))))
 `(consult-async-option ((t (:foreground ,cinder-muted-cyan))))
 `(consult-narrow-indicator ((t (:foreground ,cinder-muted-muted))))
 `(consult-imenu-prefix ((t (:inherit shadow))))
 `(consult-line-number ((t (:inherit shadow))))
 `(embark-keybinding ((t (:foreground ,cinder-muted-orange :bold t))))
 `(embark-keybinding-repeat ((t (:foreground ,cinder-muted-orange :bold t
                                 :underline t))))
 `(embark-keymap ((t (:foreground ,cinder-muted-purple :bold t))))
 `(embark-target ((t (:foreground ,cinder-muted-yellow))))
 `(embark-selected ((t (:foreground ,cinder-muted-green :bold t))))
 `(embark-collect-group-title ((t (:foreground ,cinder-muted-purple :bold t))))
 `(embark-collect-group-separator ((t (:foreground ,cinder-muted-muted))))
 `(embark-collect-candidate ((t (:foreground ,cinder-muted-fg))))
 `(embark-collect-annotation ((t (:inherit completions-annotations))))
 `(embark-verbose-indicator-title ((t (:foreground ,cinder-muted-orange :bold t))))
 `(embark-verbose-indicator-documentation
   ((t (:inherit completions-annotations))))
 `(embark-verbose-indicator-shadowed ((t (:foreground ,cinder-muted-muted))))

 ;; --- dired, diredfl, dirvish -------------------------------------------------------
 `(dired-directory ((t (:foreground ,cinder-muted-blue))))
 `(dired-symlink ((t (:foreground ,cinder-muted-cyan))))
 `(dired-broken-symlink ((t (:foreground ,cinder-muted-red :bold t))))
 `(dired-flagged ((t (:foreground ,cinder-muted-red
                      :background ,cinder-muted-surface))))
 `(dired-marked ((t (:foreground ,cinder-muted-green
                     :background ,cinder-muted-surface))))
 `(dired-mark ((t (:foreground ,cinder-muted-orange :bold t))))
 `(dired-header ((t (:foreground ,cinder-muted-purple :bold t))))
 `(dired-special ((t (:foreground ,cinder-muted-yellow))))
 `(dired-ignored ((t (:foreground ,cinder-muted-muted))))
 `(dired-warning ((t (:foreground ,cinder-muted-yellow))))
 `(diredfl-dir-heading ((t (:foreground ,cinder-muted-purple :bold t))))
 `(diredfl-dir-name ((t (:foreground ,cinder-muted-blue :bold t))))
 `(diredfl-dir-priv ((t (:foreground ,cinder-muted-blue))))
 `(diredfl-file-name ((t (:foreground ,cinder-muted-fg))))
 `(diredfl-file-suffix ((t (:foreground ,cinder-muted-subtle))))
 `(diredfl-date-time ((t (:inherit shadow))))
 `(diredfl-number ((t (:inherit shadow))))
 `(diredfl-symlink ((t (:foreground ,cinder-muted-cyan))))
 `(diredfl-executable-tag ((t (:foreground ,cinder-muted-green))))
 `(diredfl-compressed-file-name ((t (:foreground ,cinder-muted-fg))))
 `(diredfl-compressed-file-suffix ((t (:foreground ,cinder-muted-yellow))))
 `(diredfl-ignored-file-name ((t (:foreground ,cinder-muted-muted))))
 `(diredfl-flag-mark ((t (:foreground ,cinder-muted-bg
                          :background ,cinder-muted-orange :bold t))))
 `(diredfl-flag-mark-line ((t (:background ,cinder-muted-orange
                               :foreground ,cinder-muted-bg))))
 `(diredfl-deletion ((t (:foreground ,cinder-muted-bg
                         :background ,cinder-muted-red :bold t))))
 `(diredfl-deletion-file-name ((t (:foreground ,cinder-muted-red))))
 `(diredfl-read-priv ((t (:inherit shadow))))
 `(diredfl-write-priv ((t (:inherit shadow))))
 `(diredfl-exec-priv ((t (:foreground ,cinder-muted-green))))
 `(diredfl-no-priv ((t (:foreground ,cinder-muted-muted))))
 `(diredfl-link-priv ((t (:foreground ,cinder-muted-cyan))))
 `(diredfl-other-priv ((t (:foreground ,cinder-muted-muted))))
 `(diredfl-rare-priv ((t (:foreground ,cinder-muted-yellow))))
 `(dirvish-hl-line ((t (:background ,cinder-muted-surface))))
 `(dirvish-hl-line-inactive ((t (:background ,cinder-muted-container))))
 `(dirvish-inactive ((t (:inherit shadow))))
 `(dirvish-subtree-guide ((t (:foreground ,cinder-muted-visual))))
 `(dirvish-emerge-group-title ((t (:foreground ,cinder-muted-purple :bold t))))
 `(dirvish-narrow-match-face-0 ((t (:foreground ,cinder-muted-orange :bold t))))
 `(dirvish-narrow-match-face-1 ((t (:foreground ,cinder-muted-yellow :bold t))))
 `(dirvish-narrow-match-face-2 ((t (:foreground ,cinder-muted-green :bold t))))
 `(dirvish-narrow-match-face-3 ((t (:foreground ,cinder-muted-cyan :bold t))))
 `(dirvish-narrow-split ((t (:foreground ,cinder-muted-muted))))
 `(dirvish-vc-added-state ((t (:foreground ,cinder-muted-green))))
 `(dirvish-vc-edited-state ((t (:foreground ,cinder-muted-yellow))))
 `(dirvish-vc-conflict-state ((t (:foreground ,cinder-muted-red :bold t))))
 `(dirvish-vc-removed-state ((t (:foreground ,cinder-muted-muted))))
 `(dirvish-vc-unregistered-face ((t (:foreground ,cinder-muted-muted))))
 `(dirvish-proc-failed ((t (:foreground ,cinder-muted-red))))
 `(dirvish-proc-finished ((t (:foreground ,cinder-muted-green))))
 `(dirvish-proc-running ((t (:foreground ,cinder-muted-yellow))))
 `(dirvish-free-space ((t (:inherit shadow))))
 `(dirvish-file-device-number ((t (:inherit shadow))))
 `(dirvish-file-group-id ((t (:inherit shadow))))
 `(dirvish-file-inode-number ((t (:inherit shadow))))
 `(dirvish-file-link-number ((t (:inherit shadow))))
 `(dirvish-file-modes ((t (:inherit shadow))))
 `(dirvish-file-size ((t (:inherit shadow))))
 `(dirvish-file-time ((t (:inherit shadow))))
 `(dirvish-file-user-id ((t (:inherit shadow))))
 `(dirvish-git-commit-message-face ((t (:foreground ,cinder-muted-fg))))
 `(dirvish-collapse-dir-face ((t (:foreground ,cinder-muted-blue))))
 `(dirvish-collapse-file-face ((t (:foreground ,cinder-muted-fg))))
 `(dirvish-collapse-empty-dir-face ((t (:foreground ,cinder-muted-muted))))
 `(dirvish-media-info-heading ((t (:foreground ,cinder-muted-orange :bold t))))

 ;; --- diff, magit, vc ------------------------------------------------------------------
 `(diff-hl-change ((t (:foreground ,cinder-muted-yellow))))
 `(diff-hl-delete ((t (:foreground ,cinder-muted-red))))
 `(diff-hl-insert ((t (:foreground ,cinder-muted-green))))
 `(diff-added ((t (:foreground ,cinder-muted-green
                   :background ,cinder-muted-container))))
 `(diff-removed ((t (:foreground ,cinder-muted-red
                     :background ,cinder-muted-container))))
 `(diff-changed ((t (:foreground ,cinder-muted-yellow))))
 `(diff-refine-added ((t (:foreground ,cinder-muted-green :bold t))))
 `(diff-refine-removed ((t (:foreground ,cinder-muted-red :bold t))))
 `(diff-refine-changed ((t (:foreground ,cinder-muted-yellow :bold t))))
 `(diff-header ((t (:foreground ,cinder-muted-subtle))))
 `(diff-hunk-header ((t (:foreground ,cinder-muted-subtle
                         :background ,cinder-muted-surface))))
 `(diff-file-header ((t (:foreground ,cinder-muted-orange :bold t))))
 `(magit-section-highlight ((t (:background ,cinder-muted-surface))))
 `(magit-section-heading ((t (:foreground ,cinder-muted-orange :bold t))))
 `(magit-section-heading-selection ((t (:foreground ,cinder-muted-yellow))))
 `(magit-dimmed ((t (:foreground ,cinder-muted-muted))))
 `(magit-hash ((t (:inherit shadow))))
 `(magit-header-line ((t (:foreground ,cinder-muted-orange :bold t))))
 `(magit-branch-local ((t (:foreground ,cinder-muted-cyan))))
 `(magit-branch-remote ((t (:foreground ,cinder-muted-green))))
 `(magit-branch-current ((t (:foreground ,cinder-muted-orange :bold t))))
 `(magit-tag ((t (:foreground ,cinder-muted-yellow))))
 `(magit-refname ((t (:foreground ,cinder-muted-secondary))))
 `(magit-log-author ((t (:foreground ,cinder-muted-blue))))
 `(magit-log-date ((t (:inherit shadow))))
 `(magit-diff-hunk-heading ((t (:foreground ,cinder-muted-subtle
                                :background ,cinder-muted-container))))
 `(magit-diff-hunk-heading-highlight ((t (:foreground ,cinder-muted-subtle
                                          :background
                                          ,cinder-muted-surface))))
 `(magit-diff-added ((t (:foreground ,cinder-muted-green))))
 `(magit-diff-added-highlight ((t (:foreground ,cinder-muted-green
                                   :background ,cinder-muted-surface))))
 `(magit-diff-removed ((t (:foreground ,cinder-muted-red))))
 `(magit-diff-removed-highlight ((t (:foreground ,cinder-muted-red
                                     :background
                                     ,cinder-muted-surface))))
 `(magit-diff-context ((t (:foreground ,cinder-muted-secondary))))
 `(magit-diff-context-highlight ((t (:foreground ,cinder-muted-fg
                                     :background
                                     ,cinder-muted-surface))))
 `(magit-diff-our ((t (:foreground ,cinder-muted-red))))
 `(magit-diff-their ((t (:foreground ,cinder-muted-green))))
 `(magit-diff-base ((t (:foreground ,cinder-muted-purple))))
 `(magit-diff-base-highlight ((t (:foreground ,cinder-muted-purple
                                  :background
                                  ,cinder-muted-surface))))
 `(magit-diffstat-added ((t (:foreground ,cinder-muted-green))))
 `(magit-diffstat-removed ((t (:foreground ,cinder-muted-red))))
 `(git-commit-summary ((t (:foreground ,cinder-muted-bright))))
 `(ediff-current-diff-A ((t (:foreground ,cinder-muted-red
                             :background ,cinder-muted-visual))))
 `(ediff-current-diff-B ((t (:foreground ,cinder-muted-green
                             :background ,cinder-muted-visual))))
 `(ediff-current-diff-C ((t (:foreground ,cinder-muted-yellow
                             :background ,cinder-muted-visual))))
 `(ediff-current-diff-Ancestor ((t (:foreground ,cinder-muted-subtle
                                    :background
                                    ,cinder-muted-visual))))
 `(ediff-fine-diff-A ((t (:foreground ,cinder-muted-red :bold t
                          :background ,cinder-muted-surface))))
 `(ediff-fine-diff-B ((t (:foreground ,cinder-muted-green :bold t
                          :background ,cinder-muted-surface))))
 `(ediff-fine-diff-C ((t (:foreground ,cinder-muted-yellow :bold t
                          :background ,cinder-muted-surface))))
 `(ediff-fine-diff-Ancestor ((t (:foreground ,cinder-muted-subtle
                                 :background
                                 ,cinder-muted-surface))))
 `(ediff-even-diff-A ((t (:foreground ,cinder-muted-secondary
                          :background ,cinder-muted-container))))
 `(ediff-even-diff-B ((t (:foreground ,cinder-muted-secondary
                          :background ,cinder-muted-container))))
 `(ediff-even-diff-C ((t (:foreground ,cinder-muted-secondary
                          :background ,cinder-muted-container))))
 `(ediff-even-diff-Ancestor ((t (:foreground ,cinder-muted-secondary
                                 :background
                                 ,cinder-muted-container))))
 `(ediff-odd-diff-A ((t (:foreground ,cinder-muted-fg
                         :background ,cinder-muted-surface))))
 `(ediff-odd-diff-B ((t (:foreground ,cinder-muted-fg
                         :background ,cinder-muted-surface))))
 `(ediff-odd-diff-C ((t (:foreground ,cinder-muted-fg
                         :background ,cinder-muted-surface))))
 `(ediff-odd-diff-Ancestor ((t (:foreground ,cinder-muted-fg
                                :background
                                ,cinder-muted-surface))))
 `(smerge-upper ((t (:foreground ,cinder-muted-red
                     :background ,cinder-muted-container))))
 `(smerge-lower ((t (:foreground ,cinder-muted-green
                     :background ,cinder-muted-container))))
 `(smerge-base ((t (:foreground ,cinder-muted-purple
                    :background ,cinder-muted-container))))
 `(smerge-markers ((t (:foreground ,cinder-muted-subtle
                       :background ,cinder-muted-surface))))
 `(smerge-refined-added ((t (:foreground ,cinder-muted-green :bold t))))
 `(smerge-refined-removed ((t (:foreground ,cinder-muted-red :bold t))))
 `(smerge-refined-changed ((t (:foreground ,cinder-muted-yellow :bold t))))
 `(git-timemachine-commit ((t (:foreground ,cinder-muted-bright :bold t))))
 `(git-timemachine-minibuffer-author-face ((t (:foreground ,cinder-muted-yellow))))
 `(git-timemachine-minibuffer-detail-face ((t (:foreground ,cinder-muted-fg))))

 ;; --- org ---------------------------------------------------------------------------
 ;; Includes the +org-todo-* faces Doom's org module declares dynamically.
 ;; A TTY cannot use its unknown default background as an invisible foreground.
 `(org-hide ((t (:foreground ,cinder-muted-bg))))
 `(org-document-title ((t (:foreground ,cinder-muted-orange :bold t :height 1.2))))
 `(org-document-info ((t (:foreground ,cinder-muted-subtle))))
 `(org-level-1 ((t (:foreground ,cinder-muted-orange :bold t))))
 `(org-level-2 ((t (:foreground ,cinder-muted-green :bold t))))
 `(org-level-3 ((t (:foreground ,cinder-muted-yellow))))
 `(org-level-4 ((t (:foreground ,cinder-muted-blue))))
 `(org-level-5 ((t (:foreground ,cinder-muted-purple))))
 `(org-level-6 ((t (:foreground ,cinder-muted-cyan))))
 `(org-level-7 ((t (:foreground ,cinder-muted-secondary))))
 `(org-level-8 ((t (:foreground ,cinder-muted-subtle))))
 `(org-todo ((t (:foreground ,cinder-muted-orange :bold t))))
 `(org-done ((t (:foreground ,cinder-muted-green :bold t))))
 `(+org-todo-active ((t (:foreground ,cinder-muted-yellow :bold t))))
 `(+org-todo-onhold ((t (:foreground ,cinder-muted-blue :bold t))))
 `(+org-todo-cancel ((t (:foreground ,cinder-muted-muted :strike-through t))))
 `(+org-todo-project ((t (:foreground ,cinder-muted-purple :bold t))))
 `(org-priority ((t (:foreground ,cinder-muted-yellow))))
 `(org-tag ((t (:inherit shadow))))
 `(org-date ((t (:foreground ,cinder-muted-blue :underline t))))
 `(org-special-keyword ((t (:inherit shadow))))
 `(org-meta-line ((t (:inherit shadow))))
 `(org-drawer ((t (:inherit shadow))))
 `(org-property-value ((t (:foreground ,cinder-muted-secondary))))
 `(org-table ((t (:foreground ,cinder-muted-secondary))))
 `(org-formula ((t (:foreground ,cinder-muted-purple))))
 `(org-block ((t (:background ,cinder-muted-container :extend t))))
 `(org-block-begin-line ((t (:foreground ,cinder-muted-subtle
                             :background ,cinder-muted-container
                             :extend t))))
 `(org-block-end-line ((t (:inherit org-block-begin-line))))
 `(org-code ((t (:foreground ,cinder-muted-green
                 :background ,cinder-muted-container :extend nil))))
 `(org-inline-src-block ((t (:inherit org-block :extend nil))))
 `(org-verbatim ((t (:foreground ,cinder-muted-secondary))))
 `(org-quote ((t (:inherit org-block :slant italic :extend t))))
 `(org-headline-done ((t (:foreground ,cinder-muted-muted))))
 `(org-checkbox ((t (:foreground ,cinder-muted-orange :bold t))))
 `(org-link ((t (:foreground ,cinder-muted-blue :underline t))))
 `(org-footnote ((t (:foreground ,cinder-muted-subtle))))
 `(org-ellipsis ((t (:foreground ,cinder-muted-muted))))
 `(org-column ((t (:background ,cinder-muted-surface))))
 `(org-column-title ((t (:foreground ,cinder-muted-orange :bold t
                         :background ,cinder-muted-surface))))
 `(org-clock-overlay ((t (:background ,cinder-muted-visual))))
 `(org-agenda-clocking ((t (:background ,cinder-muted-visual))))
 `(org-agenda-structure ((t (:foreground ,cinder-muted-purple :bold t))))
 `(org-agenda-date ((t (:foreground ,cinder-muted-blue))))
 `(org-agenda-date-today ((t (:foreground ,cinder-muted-orange :bold t))))
 `(org-agenda-date-weekend ((t (:foreground ,cinder-muted-yellow))))
 `(org-agenda-done ((t (:foreground ,cinder-muted-muted))))
 `(org-scheduled ((t (:foreground ,cinder-muted-fg))))
 `(org-scheduled-today ((t (:foreground ,cinder-muted-green))))
 `(org-imminent-deadline ((t (:inherit org-warning))))
 `(org-upcoming-deadline ((t (:foreground ,cinder-muted-yellow))))
 `(org-time-grid ((t (:inherit shadow))))
 `(org-warning ((t (:foreground ,cinder-muted-red :bold t))))

 ;; --- markdown -------------------------------------------------------------------------
 `(markdown-header-face-1 ((t (:foreground ,cinder-muted-orange :bold t))))
 `(markdown-header-face-2 ((t (:foreground ,cinder-muted-green :bold t))))
 `(markdown-header-face-3 ((t (:foreground ,cinder-muted-yellow))))
 `(markdown-header-face-4 ((t (:foreground ,cinder-muted-blue))))
 `(markdown-header-face-5 ((t (:foreground ,cinder-muted-purple))))
 `(markdown-header-face-6 ((t (:foreground ,cinder-muted-cyan))))
 `(markdown-header-delimiter-face ((t (:foreground ,cinder-muted-muted))))
 `(markdown-header-rule-face ((t (:foreground ,cinder-muted-muted))))
 `(markdown-hr-face ((t (:foreground ,cinder-muted-muted))))
 `(markdown-blockquote-face ((t (:foreground ,cinder-muted-yellow :italic t))))
 `(markdown-code-face ((t (:background ,cinder-muted-container
                           :foreground ,cinder-muted-bright
                           :inherit fixed-pitch :extend nil))))
 `(markdown-pre-face ((t (:inherit markdown-code-face :extend t))))
 `(markdown-inline-code-face ((t (:inherit markdown-code-face
                                  :foreground ,cinder-muted-green :extend nil))))
 `(markdown-language-keyword-face ((t (:foreground ,cinder-muted-purple))))
 `(markdown-markup-face ((t (:foreground ,cinder-muted-muted))))
 `(markdown-list-face ((t (:foreground ,cinder-muted-green))))
 `(markdown-link-face ((t (:foreground ,cinder-muted-blue))))
 `(markdown-url-face ((t (:foreground ,cinder-muted-blue :underline t))))
 `(markdown-plain-url-face ((t (:foreground ,cinder-muted-blue :underline t))))
 `(markdown-reference-face ((t (:foreground ,cinder-muted-blue))))
 `(markdown-footnote-marker-face ((t (:foreground ,cinder-muted-subtle))))
 `(markdown-metadata-key-face ((t (:foreground ,cinder-muted-purple))))
 `(markdown-metadata-value-face ((t (:foreground ,cinder-muted-secondary))))
 `(markdown-gfm-checkbox-face ((t (:foreground ,cinder-muted-orange :bold t))))
 `(markdown-math-face ((t (:foreground ,cinder-muted-blue))))
 `(markdown-missing-link-face ((t (:foreground ,cinder-muted-red))))
 `(markdown-comment-face ((t (:inherit font-lock-comment-face))))
 `(markdown-strike-through-face ((t (:foreground ,cinder-muted-muted
                                     :strike-through t))))

 ;; --- info, help, custom, compilation --------------------------------------------------
 `(info-title-1 ((t (:foreground ,cinder-muted-purple :bold t))))
 `(info-title-2 ((t (:foreground ,cinder-muted-purple))))
 `(info-title-3 ((t (:foreground ,cinder-muted-orange))))
 `(info-title-4 ((t (:foreground ,cinder-muted-orange))))
 `(info-menu-header ((t (:foreground ,cinder-muted-orange :bold t))))
 `(info-menu-star ((t (:foreground ,cinder-muted-orange))))
 `(info-node ((t (:foreground ,cinder-muted-orange :bold t))))
 `(info-header-node ((t (:foreground ,cinder-muted-subtle))))
 `(info-header-xref ((t (:foreground ,cinder-muted-blue))))
 `(info-xref ((t (:foreground ,cinder-muted-blue :underline t))))
 `(info-xref-visited ((t (:foreground ,cinder-muted-purple :underline t))))
 `(info-index-match ((t (:inherit isearch))))
 `(help-argument-name ((t (:foreground ,cinder-muted-cyan :italic t))))
 `(help-key-binding ((t (:background ,cinder-muted-container
                         :foreground ,cinder-muted-bright :bold t))))
 `(widget-field ((t (:background ,cinder-muted-container
                     :foreground ,cinder-muted-fg))))
 `(widget-single-line-field ((t (:background ,cinder-muted-container
                                 :foreground ,cinder-muted-fg))))
 `(widget-button ((t (:foreground ,cinder-muted-orange :bold t))))
 `(custom-variable-tag ((t (:foreground ,cinder-muted-orange :bold t))))
 `(custom-face-tag ((t (:foreground ,cinder-muted-yellow))))
 `(custom-group-tag ((t (:foreground ,cinder-muted-purple :bold t))))
 `(custom-state ((t (:foreground ,cinder-muted-green))))
 `(custom-comment ((t (:inherit font-lock-comment-face))))
 `(custom-comment-tag ((t (:foreground ,cinder-muted-subtle))))
 `(custom-documentation ((t (:foreground ,cinder-muted-secondary))))
 `(compilation-error ((t (:inherit error))))
 `(compilation-warning ((t (:inherit warning))))
 `(compilation-info ((t (:foreground ,cinder-muted-blue))))
 `(compilation-line-number ((t (:inherit shadow))))
 `(compilation-column-number ((t (:inherit shadow))))
 `(compilation-mode-line-fail ((t (:foreground ,cinder-muted-red :bold t))))
 `(compilation-mode-line-exit ((t (:foreground ,cinder-muted-green :bold t))))
 `(compilation-mode-line-run ((t (:foreground ,cinder-muted-yellow :bold t))))
 `(whitespace-trailing ((t (:background ,cinder-muted-surface))))
 `(whitespace-line ((t (:background ,cinder-muted-surface
                        :foreground ,cinder-muted-yellow))))
 `(whitespace-space ((t (:foreground ,cinder-muted-visual))))
 `(whitespace-hspace ((t (:foreground ,cinder-muted-visual))))
 `(whitespace-tab ((t (:foreground ,cinder-muted-visual))))
 `(whitespace-newline ((t (:foreground ,cinder-muted-visual))))
 `(whitespace-indentation ((t (:foreground ,cinder-muted-visual))))
 `(whitespace-empty ((t (:foreground ,cinder-muted-visual))))

 ;; --- evil, search previews -----------------------------------------------------------
 `(evil-ex-substitute-matches ((t (:background ,cinder-muted-surface
                                   :strike-through t))))
 `(evil-ex-substitute-replacement ((t (:foreground ,cinder-muted-green))))
 `(evil-search-highlight-persist-highlight-face
   ((t (:background ,cinder-muted-visual))))
 `(evil-traces-default ((t (:background ,cinder-muted-surface
                            :foreground ,cinder-muted-fg))))
 `(evil-traces-global-match ((t (:background ,cinder-muted-surface
                                 :foreground ,cinder-muted-bright
                                 :strike-through t))))
 `(evil-traces-global-range ((t (:background ,cinder-muted-visual
                                 :foreground ,cinder-muted-bright))))
 `(evil-traces-substitute-range ((t (:background ,cinder-muted-visual
                                     :foreground
                                     ,cinder-muted-bright))))
 `(evil-traces-delete ((t (:background ,cinder-muted-red
                           :foreground ,cinder-muted-bg :bold t))))
 `(evil-traces-change ((t (:background ,cinder-muted-orange
                           :foreground ,cinder-muted-bg :bold t))))
 `(evil-traces-yank ((t (:background ,cinder-muted-green
                         :foreground ,cinder-muted-bg :bold t))))
 `(evil-traces-copy-preview ((t (:background ,cinder-muted-surface
                                 :foreground ,cinder-muted-bright))))
 `(evil-traces-copy-range ((t (:background ,cinder-muted-visual
                               :foreground ,cinder-muted-bright))))
 `(evil-traces-move-preview ((t (:background ,cinder-muted-surface))))
 `(evil-traces-move-range ((t (:background ,cinder-muted-visual))))
 `(evil-traces-normal ((t (:foreground ,cinder-muted-fg))))
 `(evil-goggles-default-face ((t (:background ,cinder-muted-visual
                                  :foreground ,cinder-muted-bright))))
 `(evil-goggles-delete-face ((t (:background ,cinder-muted-red
                                 :foreground ,cinder-muted-bg))))
 `(evil-goggles-change-face ((t (:background ,cinder-muted-orange
                                 :foreground ,cinder-muted-bg))))
 `(evil-goggles-yank-face ((t (:background ,cinder-muted-green
                               :foreground ,cinder-muted-bg))))
 `(evil-goggles-paste-face ((t (:background ,cinder-muted-blue
                                :foreground ,cinder-muted-bg))))
 `(evil-goggles-replace-with-register-face ((t (:background ,cinder-muted-purple
                                                :foreground
                                                ,cinder-muted-bg))))
 `(evil-goggles-surround-face ((t (:background ,cinder-muted-cyan
                                   :foreground ,cinder-muted-bg))))
 `(evil-snipe-first-match-face ((t (:background ,cinder-muted-orange
                                    :foreground ,cinder-muted-bg
                                    :bold t))))
 `(evil-snipe-matches-face ((t (:background ,cinder-muted-surface
                                :foreground ,cinder-muted-bright))))
 `(anzu-mode-line ((t (:foreground ,cinder-muted-orange :bold t))))
 `(anzu-mode-line-no-match ((t (:foreground ,cinder-muted-red :bold t))))
 `(anzu-replace-highlight ((t (:background ,cinder-muted-surface
                               :foreground ,cinder-muted-bright))))
 `(anzu-replace-to ((t (:foreground ,cinder-muted-green :bold t))))
 `(anzu-match-1 ((t (:foreground ,cinder-muted-orange))))
 `(anzu-match-2 ((t (:foreground ,cinder-muted-yellow))))
 `(anzu-match-3 ((t (:foreground ,cinder-muted-green))))
 `(iedit-occurrence ((t (:background ,cinder-muted-surface
                         :foreground ,cinder-muted-bright :bold t))))
 `(iedit-read-only-occurrence ((t (:background ,cinder-muted-visual
                                   :foreground ,cinder-muted-muted
                                   :italic t))))

 ;; --- navigation -------------------------------------------------------------------------
 `(avy-lead-face ((t (:background ,cinder-muted-orange
                      :foreground ,cinder-muted-bg :bold t))))
 `(avy-lead-face-0 ((t (:background ,cinder-muted-green
                        :foreground ,cinder-muted-bg :bold t))))
 `(avy-lead-face-1 ((t (:background ,cinder-muted-yellow
                        :foreground ,cinder-muted-bg :bold t))))
 `(avy-lead-face-2 ((t (:background ,cinder-muted-blue
                        :foreground ,cinder-muted-bg :bold t))))
 `(avy-background-face ((t (:foreground ,cinder-muted-muted))))
 `(avy-goto-char-timer-face ((t (:background ,cinder-muted-surface
                                 :foreground
                                 ,cinder-muted-bright :bold t))))
 `(aw-leading-char-face ((t (:foreground ,cinder-muted-orange :bold t))))
 `(aw-background-face ((t (:foreground ,cinder-muted-muted))))
 `(aw-mode-line-face ((t (:foreground ,cinder-muted-orange :bold t))))
 `(aw-minibuffer-leading-char-face ((t (:foreground ,cinder-muted-orange
                                        :bold t))))

 ;; --- misc ui ------------------------------------------------------------------------------
 `(hl-todo ((t (:foreground ,cinder-muted-orange :bold t))))
 `(link ((t (:foreground ,cinder-muted-blue :underline t))))
 `(link-visited ((t (:foreground ,cinder-muted-purple :underline t))))
 `(tooltip ((t (:background ,cinder-muted-container
                :foreground ,cinder-muted-fg))))
 `(popup-face ((t (:background ,cinder-muted-container
                   :foreground ,cinder-muted-fg))))
 `(popup-tip-face ((t (:background ,cinder-muted-surface
                       :foreground ,cinder-muted-orange))))
 `(popup-menu-selection-face ((t (:background ,cinder-muted-orange
                                  :foreground ,cinder-muted-bg))))
 `(popup-menu-summary-face ((t (:inherit shadow))))
 `(child-frame-border ((t (:background ,cinder-muted-muted))))
 `(nav-flash-face ((t (:background ,cinder-muted-visual
                       :foreground ,cinder-muted-orange))))
 `(which-key-key-face ((t (:foreground ,cinder-muted-orange :bold t))))
 `(which-key-command-description-face ((t (:foreground ,cinder-muted-fg))))
 `(which-key-group-description-face ((t (:foreground ,cinder-muted-subtle))))
 `(which-key-special-key-face ((t (:foreground ,cinder-muted-orange :bold t))))
 `(which-key-separator-face ((t (:foreground ,cinder-muted-muted))))
 `(which-key-note-face ((t (:inherit shadow :italic t))))
 `(dashboard-banner-logo-title ((t (:foreground ,cinder-muted-orange :bold t))))
 `(doom-dashboard-default ((t (:background ,cinder-muted-bg :foreground ,cinder-muted-fg))))
 `(dashboard-items-face ((t (:foreground ,cinder-muted-fg))))
 `(dashboard-heading ((t (:foreground ,cinder-muted-orange :bold t))))
 `(dashboard-navigator-face ((t (:foreground ,cinder-muted-blue))))
 `(transient-key ((t (:foreground ,cinder-muted-orange :bold t))))
 `(transient-heading ((t (:foreground ,cinder-muted-purple :bold t))))
 `(transient-argument ((t (:foreground ,cinder-muted-cyan))))
 `(transient-value ((t (:foreground ,cinder-muted-yellow))))
 `(transient-inactive-argument ((t (:inherit shadow))))
 `(transient-inactive-value ((t (:inherit shadow))))
 `(transient-unreachable ((t (:foreground ,cinder-muted-muted :strike-through t))))
 `(transient-unreachable-key ((t (:foreground ,cinder-muted-muted))))
 `(vundo-default ((t (:foreground ,cinder-muted-fg))))
 `(vundo-highlight ((t (:foreground ,cinder-muted-orange :bold t))))
 `(vundo-stem ((t (:foreground ,cinder-muted-visual))))
 `(vundo-saved ((t (:foreground ,cinder-muted-green))))
 `(vundo-last-saved ((t (:foreground ,cinder-muted-green :bold t))))
 `(treesit-fold-fringe-face ((t (:foreground ,cinder-muted-muted))))
 `(treesit-fold-replacement-face ((t (:foreground ,cinder-muted-yellow))))
 `(macrostep-expansion-highlight-face ((t (:background ,cinder-muted-surface))))
 `(macrostep-macro-face ((t (:foreground ,cinder-muted-orange :bold t))))
 `(macrostep-compiler-macro-face ((t (:foreground ,cinder-muted-orange :bold t))))
 `(macrostep-gensym-1 ((t (:foreground ,cinder-muted-orange))))
 `(macrostep-gensym-2 ((t (:foreground ,cinder-muted-yellow))))
 `(macrostep-gensym-3 ((t (:foreground ,cinder-muted-green))))
 `(macrostep-gensym-4 ((t (:foreground ,cinder-muted-blue))))
 `(macrostep-gensym-5 ((t (:foreground ,cinder-muted-purple))))
 `(wgrep-face ((t (:foreground ,cinder-muted-yellow))))
 `(wgrep-done-face ((t (:foreground ,cinder-muted-green))))
 `(wgrep-delete-face ((t (:foreground ,cinder-muted-red :strike-through t))))
 `(wgrep-file-face ((t (:foreground ,cinder-muted-fg))))
 `(wgrep-reject-face ((t (:foreground ,cinder-muted-red :bold t))))
 `(highlight-quoted-quote ((t (:foreground ,cinder-muted-purple))))
 `(highlight-quoted-symbol ((t (:foreground ,cinder-muted-cyan))))
 `(eros-result-overlay-face ((t (:background ,cinder-muted-container
                                 :foreground ,cinder-muted-green))))
 `(yas-field-highlight-face ((t (:background ,cinder-muted-visual))))
 `(dape-breakpoint-face ((t (:background ,cinder-muted-red
                             :foreground ,cinder-muted-bright))))
 `(dape-breakpoint-until-face ((t (:background ,cinder-muted-purple
                                   :foreground
                                   ,cinder-muted-bright))))
 `(dape-source-line-face ((t (:background ,cinder-muted-visual
                              :foreground ,cinder-muted-bright))))
 `(dape-expression-face ((t (:foreground ,cinder-muted-yellow))))
 `(dape-inlay-hint-face ((t (:foreground ,cinder-muted-subtle
                             :background ,cinder-muted-surface
                             :italic t))))
 `(dape-repl-error-face ((t (:foreground ,cinder-muted-red))))
 `(dape-log-face ((t (:inherit shadow))))
 `(dape-header-line-active-face ((t (:background ,cinder-muted-orange
                                     :foreground ,cinder-muted-bg))))
 `(dape-header-line-inactive-face ((t (:background ,cinder-muted-container
                                       :foreground
                                       ,cinder-muted-muted))))
 `(dape-hits-face ((t (:foreground ,cinder-muted-green))))

 ;; --- nerd-icons -------------------------------------------------------------------------------
 `(nerd-icons-blue ((t (:foreground ,cinder-muted-blue))))
 `(nerd-icons-blue-alt ((t (:foreground ,cinder-muted-cyan))))
 `(nerd-icons-cyan ((t (:foreground ,cinder-muted-cyan))))
 `(nerd-icons-cyan-alt ((t (:foreground ,cinder-muted-cyan))))
 `(nerd-icons-green ((t (:foreground ,cinder-muted-green))))
 `(nerd-icons-orange ((t (:foreground ,cinder-muted-orange))))
 `(nerd-icons-purple ((t (:foreground ,cinder-muted-purple))))
 `(nerd-icons-purple-alt ((t (:foreground ,cinder-muted-purple))))
 `(nerd-icons-red ((t (:foreground ,cinder-muted-red))))
 `(nerd-icons-red-alt ((t (:foreground ,cinder-muted-red))))
 `(nerd-icons-yellow ((t (:foreground ,cinder-muted-yellow))))
 `(nerd-icons-pink ((t (:foreground ,cinder-muted-purple))))
 `(nerd-icons-maroon ((t (:foreground ,cinder-muted-red))))
 `(nerd-icons-silver ((t (:foreground ,cinder-muted-subtle))))
 `(nerd-icons-dblue ((t (:foreground ,cinder-muted-blue))))
 `(nerd-icons-dcyan ((t (:foreground ,cinder-muted-cyan))))
 `(nerd-icons-dgreen ((t (:foreground ,cinder-muted-green))))
 `(nerd-icons-dorange ((t (:foreground ,cinder-muted-orange))))
 `(nerd-icons-dpurple ((t (:foreground ,cinder-muted-purple))))
 `(nerd-icons-dpink ((t (:foreground ,cinder-muted-purple))))
 `(nerd-icons-dred ((t (:foreground ,cinder-muted-red))))
 `(nerd-icons-dyellow ((t (:foreground ,cinder-muted-yellow))))
 `(nerd-icons-dsilver ((t (:foreground ,cinder-muted-subtle))))
 `(nerd-icons-lblue ((t (:foreground ,cinder-muted-blue))))
 `(nerd-icons-lcyan ((t (:foreground ,cinder-muted-cyan))))
 `(nerd-icons-lgreen ((t (:foreground ,cinder-muted-green))))
 `(nerd-icons-lorange ((t (:foreground ,cinder-muted-orange))))
 `(nerd-icons-lpurple ((t (:foreground ,cinder-muted-purple))))
 `(nerd-icons-lpink ((t (:foreground ,cinder-muted-purple))))
 `(nerd-icons-lred ((t (:foreground ,cinder-muted-red))))
 `(nerd-icons-lyellow ((t (:foreground ,cinder-muted-yellow))))
 `(nerd-icons-lsilver ((t (:foreground ,cinder-muted-bright))))

 ;; --- lsp-mode -----------------------------------------------------------------------------------
 `(lsp-face-highlight-read ((t (:background ,cinder-muted-visual))))
 `(lsp-face-highlight-textual ((t (:background ,cinder-muted-surface))))
 `(lsp-face-highlight-write ((t (:background ,cinder-muted-visual
                                 :box (:color ,cinder-muted-orange)))))
 `(lsp-face-rename ((t (:background ,cinder-muted-surface))))
 `(lsp-ui-doc-background ((t (:background ,cinder-muted-container))))
 `(lsp-inlay-hint-face ((t (:foreground ,cinder-muted-subtle
                            :background ,cinder-muted-surface
                            :italic t))))
 `(lsp-inlay-hint-parameter-face ((t (:foreground ,cinder-muted-orange
                                      :background
                                      ,cinder-muted-surface
                                      :italic t))))
 `(lsp-inlay-hint-type-face ((t (:foreground ,cinder-muted-yellow
                                 :background ,cinder-muted-surface
                                 :italic t))))
 `(lsp-lens-face ((t (:inherit shadow))))
 `(lsp-details-face ((t (:inherit shadow :italic t))))
 `(lsp-modeline-code-actions-face ((t (:foreground ,cinder-muted-yellow))))
 `(lsp-signature-face ((t (:foreground ,cinder-muted-secondary :italic t))))
 `(lsp-signature-highlight-function-argument ((t (:foreground
                                                  ,cinder-muted-orange :bold t))))
 `(lsp-signature-posframe ((t (:background ,cinder-muted-container
                               :foreground ,cinder-muted-fg))))
 `(lsp-headerline-breadcrumb-path-face ((t (:foreground ,cinder-muted-subtle))))
 `(lsp-headerline-breadcrumb-symbols-face ((t (:foreground ,cinder-muted-orange))))
 `(lsp-headerline-breadcrumb-separator-face ((t (:foreground ,cinder-muted-muted))))
 `(lsp-headerline-breadcrumb-project-prefix-face ((t (:foreground
                                                      ,cinder-muted-yellow))))
 `(lsp-headerline-breadcrumb-path-error-face ((t (:foreground ,cinder-muted-red))))
 `(lsp-headerline-breadcrumb-path-warning-face ((t (:foreground
                                                    ,cinder-muted-yellow))))
 `(lsp-headerline-breadcrumb-path-info-face ((t (:foreground ,cinder-muted-blue))))
 `(lsp-headerline-breadcrumb-path-hint-face ((t (:foreground ,cinder-muted-cyan))))
 `(lsp-headerline-breadcrumb-symbols-error-face ((t (:foreground
                                                     ,cinder-muted-red))))
 `(lsp-headerline-breadcrumb-symbols-warning-face ((t (:foreground
                                                       ,cinder-muted-yellow))))
 `(lsp-headerline-breadcrumb-symbols-info-face ((t (:foreground
                                                    ,cinder-muted-blue))))
 `(lsp-headerline-breadcrumb-symbols-hint-face ((t (:foreground
                                                    ,cinder-muted-cyan))))
 `(lsp-headerline-breadcrumb-deprecated-face ((t (:foreground ,cinder-muted-muted
                                                  :strike-through t))))
 `(lsp-face-semhl-keyword ((t (:foreground ,cinder-muted-orange))))
 `(lsp-face-semhl-string ((t (:foreground ,cinder-muted-green))))
 `(lsp-face-semhl-number ((t (:foreground ,cinder-muted-purple))))
 `(lsp-face-semhl-constant ((t (:foreground ,cinder-muted-purple))))
 `(lsp-face-semhl-enum-member ((t (:foreground ,cinder-muted-orange))))
 `(lsp-face-semhl-function ((t (:foreground ,cinder-muted-cyan))))
 `(lsp-face-semhl-method ((t (:foreground ,cinder-muted-cyan))))
 `(lsp-face-semhl-macro ((t (:foreground ,cinder-muted-purple))))
 `(lsp-face-semhl-variable ((t (:foreground ,cinder-muted-fg))))
 `(lsp-face-semhl-parameter ((t (:foreground ,cinder-muted-bright :italic t))))
 `(lsp-face-semhl-property ((t (:foreground ,cinder-muted-secondary))))
 `(lsp-face-semhl-member ((t (:foreground ,cinder-muted-secondary))))
 `(lsp-face-semhl-class ((t (:foreground ,cinder-muted-yellow))))
 `(lsp-face-semhl-struct ((t (:foreground ,cinder-muted-yellow))))
 `(lsp-face-semhl-interface ((t (:foreground ,cinder-muted-yellow))))
 `(lsp-face-semhl-enum ((t (:foreground ,cinder-muted-yellow))))
 `(lsp-face-semhl-event ((t (:foreground ,cinder-muted-yellow))))
 `(lsp-face-semhl-type-parameter ((t (:foreground ,cinder-muted-yellow :italic t))))
 `(lsp-face-semhl-decorator ((t (:foreground ,cinder-muted-orange))))
 `(lsp-face-semhl-namespace ((t (:foreground ,cinder-muted-blue :bold t))))
 `(lsp-face-semhl-label ((t (:foreground ,cinder-muted-purple))))
 `(lsp-face-semhl-operator ((t (:foreground ,cinder-muted-secondary))))
 `(lsp-face-semhl-regexp ((t (:foreground ,cinder-muted-green))))
 `(lsp-face-semhl-default-library ((t (:foreground ,cinder-muted-purple
                                       :italic t))))
 `(lsp-face-semhl-deprecated ((t (:strike-through t))))

 ;; --- terminals (ANSI palette from terminal_colors upstream) -------------------------------
 `(ansi-color-black ((t (:foreground ,cinder-muted-bg
                         :background ,cinder-muted-bg))))
 `(ansi-color-red ((t (:foreground ,cinder-muted-red
                       :background ,cinder-muted-red))))
 `(ansi-color-green ((t (:foreground ,cinder-muted-green
                         :background ,cinder-muted-green))))
 `(ansi-color-yellow ((t (:foreground ,cinder-muted-yellow
                          :background ,cinder-muted-yellow))))
 `(ansi-color-blue ((t (:foreground ,cinder-muted-blue
                        :background ,cinder-muted-blue))))
 `(ansi-color-magenta ((t (:foreground ,cinder-muted-purple
                           :background ,cinder-muted-purple))))
 `(ansi-color-cyan ((t (:foreground ,cinder-muted-cyan
                        :background ,cinder-muted-cyan))))
 `(ansi-color-white ((t (:foreground ,cinder-muted-secondary
                         :background ,cinder-muted-secondary))))
 `(ansi-color-bright-black ((t (:foreground ,cinder-muted-muted
                                :background ,cinder-muted-muted))))
 `(ansi-color-bright-red ((t (:inherit ansi-color-red))))
 `(ansi-color-bright-green ((t (:inherit ansi-color-green))))
 `(ansi-color-bright-yellow ((t (:inherit ansi-color-yellow))))
 `(ansi-color-bright-blue ((t (:inherit ansi-color-blue))))
 `(ansi-color-bright-magenta ((t (:inherit ansi-color-magenta))))
 `(ansi-color-bright-cyan ((t (:inherit ansi-color-cyan))))
 `(ansi-color-bright-white ((t (:foreground ,cinder-muted-bright
                                :background ,cinder-muted-bright))))
 `(term-color-black ((t (:foreground ,cinder-muted-bg
                         :background ,cinder-muted-bg))))
 `(term-color-red ((t (:foreground ,cinder-muted-red
                       :background ,cinder-muted-red))))
 `(term-color-green ((t (:foreground ,cinder-muted-green
                         :background ,cinder-muted-green))))
 `(term-color-yellow ((t (:foreground ,cinder-muted-yellow
                          :background ,cinder-muted-yellow))))
 `(term-color-blue ((t (:foreground ,cinder-muted-blue
                        :background ,cinder-muted-blue))))
 `(term-color-magenta ((t (:foreground ,cinder-muted-purple
                           :background ,cinder-muted-purple))))
 `(term-color-cyan ((t (:foreground ,cinder-muted-cyan
                        :background ,cinder-muted-cyan))))
 `(term-color-white ((t (:foreground ,cinder-muted-secondary
                         :background ,cinder-muted-secondary))))
 `(vterm-color-black ((t (:foreground ,cinder-muted-bg
                          :background ,cinder-muted-bg))))
 `(vterm-color-red ((t (:foreground ,cinder-muted-red
                        :background ,cinder-muted-red))))
 `(vterm-color-green ((t (:foreground ,cinder-muted-green
                          :background ,cinder-muted-green))))
 `(vterm-color-yellow ((t (:foreground ,cinder-muted-yellow
                           :background ,cinder-muted-yellow))))
 `(vterm-color-blue ((t (:foreground ,cinder-muted-blue
                         :background ,cinder-muted-blue))))
 `(vterm-color-magenta ((t (:foreground ,cinder-muted-purple
                            :background ,cinder-muted-purple))))
 `(vterm-color-cyan ((t (:foreground ,cinder-muted-cyan
                         :background ,cinder-muted-cyan))))
 `(vterm-color-white ((t (:foreground ,cinder-muted-secondary
                          :background ,cinder-muted-secondary))))
 `(vterm-color-bright-black ((t (:foreground ,cinder-muted-muted
                                 :background ,cinder-muted-muted))))
 `(vterm-color-bright-red ((t (:foreground ,cinder-muted-red
                               :background ,cinder-muted-red))))
 `(vterm-color-bright-green ((t (:foreground ,cinder-muted-green
                                 :background ,cinder-muted-green))))
 `(vterm-color-bright-yellow ((t (:foreground ,cinder-muted-yellow
                                  :background
                                  ,cinder-muted-yellow))))
 `(vterm-color-bright-blue ((t (:foreground ,cinder-muted-blue
                                :background ,cinder-muted-blue))))
 `(vterm-color-bright-magenta ((t (:foreground ,cinder-muted-purple
                                   :background
                                   ,cinder-muted-purple))))
 `(vterm-color-bright-cyan ((t (:foreground ,cinder-muted-cyan
                                :background ,cinder-muted-cyan))))
 `(vterm-color-bright-white ((t (:foreground ,cinder-muted-bright
                                 :background ,cinder-muted-bright)))))

;;;###autoload
(and load-file-name
     (boundp 'custom-theme-load-path)
     (add-to-list 'custom-theme-load-path
                  (file-name-as-directory
                   (file-name-directory load-file-name))))

(provide 'cinder-muted-theme)
(provide-theme 'cinder-muted)
;;; cinder-muted-theme.el ends here
