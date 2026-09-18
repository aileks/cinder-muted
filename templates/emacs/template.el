;;; cinder-grove-theme.el --- A warm, muted dark theme  -*- lexical-binding: t; -*-

;; Copyright (C) 2026 aileks

;; Author: aileks
;; URL: https://github.com/aileks/cinder-grove.el
;; Version: 1.0.0
;; Package-Requires: ((emacs "30.1"))
;; Keywords: faces, themes
;; SPDX-License-Identifier: GPL-3.0-or-later

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; A warm, muted dark theme that's easy on the eyes.  Ported from
;; cinder-grove.nvim (https://github.com/aileks/cinder-grove.nvim).

;; Covers built-in faces plus corfu, vertico, marginalia, orderless,
;; consult, embark, which-key, avy, ace-window, anzu, transient,
;; magit, diff-hl, ediff, smerge, flycheck, flymake, eglot, lsp-mode, org,
;; markdown, diredfl, dirvish, doom-modeline, solaire, evil
;; (goggles, snipe, traces), dashboard, vterm, term, and more.

;;; Code:

(deftheme cinder-grove
  "Cinder Muted: a Doom Emacs dark theme in muted ember tones."
  :background-mode 'dark
  :kind 'color-scheme)

(defgroup cinder-grove nil
  "Cinder Grove theme."
  :group 'faces
  :prefix "cinder-grove-")

(defconst cinder-grove-bg        "#131210")
(defconst cinder-grove-container "#1B1916")
(defconst cinder-grove-surface   "#23201C")
(defconst cinder-grove-visual    "#3E3A34")
(defconst cinder-grove-muted     "#58534C")
(defconst cinder-grove-subtle    "#9A938A")
(defconst cinder-grove-secondary "#ACA49B")
(defconst cinder-grove-fg        "#BBB3A9")
(defconst cinder-grove-bright    "#DDD5CA")
(defconst cinder-grove-orange    "#E17A3F")
(defconst cinder-grove-green     "#879B5C")
(defconst cinder-grove-red       "#B34A45")
(defconst cinder-grove-yellow    "#D9A441")
(defconst cinder-grove-blue      "#6785A1")
(defconst cinder-grove-purple    "#9A788F")
(defconst cinder-grove-cyan      "#58918C")

(defcustom cg-transparent nil
  "Use the terminal's default background when non-nil.
GUI frames always use the theme's dark canvas; set the frame
parameter `alpha-background' separately for GUI transparency.
Popup faces retain explicit backgrounds.  Reload the theme with
`load-theme' after changing this option."
  :type 'boolean
  :group 'cinder-grove)

;; Match the terminal canvas without changing frame defaults outside the theme.
(let ((tty-background (if cg-transparent "unspecified-bg" cinder-grove-bg)))
  (custom-theme-set-faces
   'cinder-grove
   `(default ((((type tty)) (:background ,tty-background
                            :foreground ,cinder-grove-fg))
              (t (:background ,cinder-grove-bg :foreground ,cinder-grove-fg))))
   `(fringe ((((type tty)) (:background ,tty-background
                           :foreground ,cinder-grove-muted))
             (t (:background ,cinder-grove-bg :foreground ,cinder-grove-muted))))))

(custom-theme-set-faces
 'cinder-grove

 ;; --- base -------------------------------------------------------------------
 `(cursor ((t (:background ,cinder-grove-orange))))
 `(region ((t (:background ,cinder-grove-visual))))
 `(highlight ((t (:background ,cinder-grove-surface))))
 `(hl-line ((t (:background ,cinder-grove-container))))
 `(secondary-selection ((t (:background ,cinder-grove-visual))))
 `(vertical-border ((t (:foreground ,cinder-grove-muted))))
 `(window-divider ((t (:foreground ,cinder-grove-visual))))
 `(shadow ((t (:foreground ,cinder-grove-subtle))))
 `(escape-glyph ((t (:foreground ,cinder-grove-muted))))
 `(nobreak-space ((t (:foreground ,cinder-grove-yellow :underline t))))
 `(file-name-shadow ((t (:inherit shadow))))
 `(fill-column-indicator ((t (:foreground ,cinder-grove-visual))))
 `(line-number ((t (:foreground ,cinder-grove-muted :background unspecified))))
 `(line-number-current-line ((t (:foreground ,cinder-grove-orange
                                             :background ,cinder-grove-surface
                                             :bold t))))
 `(minibuffer-prompt ((t (:foreground ,cinder-grove-orange :bold t))))
 `(trailing-whitespace ((t (:background ,cinder-grove-surface))))
 `(show-paren-match ((t (:background ,cinder-grove-visual :bold t))))
 `(show-paren-mismatch ((t (:foreground ,cinder-grove-bg
                                         :background ,cinder-grove-red))))
 `(match ((t (:background ,cinder-grove-surface
                          :foreground ,cinder-grove-orange))))

 ;; --- search -------------------------------------------------------------------
 `(isearch ((t (:background ,cinder-grove-orange :foreground ,cinder-grove-bg))))
 `(isearch-fail ((t (:foreground ,cinder-grove-red :underline t))))
 `(lazy-highlight ((t (:background ,cinder-grove-visual
                                   :foreground ,cinder-grove-bright))))
 `(query-replace ((t (:inherit isearch))))

 ;; --- mode-line, header-line, tab-bar ---------------------------------------------
 `(mode-line ((t (:background ,cinder-grove-container
                              :foreground ,cinder-grove-bright
                              :box (:color ,cinder-grove-muted)))))
 `(mode-line-inactive ((t (:background ,cinder-grove-surface
                                       :foreground ,cinder-grove-subtle
                                       :box (:color ,cinder-grove-container)))))
 `(mode-line-active ((t (:inherit mode-line))))
 `(mode-line-buffer-id ((t (:foreground ,cinder-grove-orange :bold t))))
 `(mode-line-highlight ((t (:foreground ,cinder-grove-orange))))
 `(mode-line-emphasis ((t (:foreground ,cinder-grove-bright :bold t))))
 `(header-line ((t (:inherit mode-line))))
 `(header-line-highlight ((t (:inherit mode-line-highlight))))
 `(tab-bar ((t (:background ,cinder-grove-container
                            :foreground ,cinder-grove-subtle))))
 `(tab-bar-tab ((t (:background ,cinder-grove-surface
                                :foreground ,cinder-grove-bright :weight bold))))
 `(tab-bar-tab-inactive ((t (:background ,cinder-grove-container
                                         :foreground ,cinder-grove-subtle))))
 `(tab-bar-tab-group-current ((t (:foreground ,cinder-grove-orange :bold t))))
 `(tab-bar-tab-group-inactive ((t (:inherit tab-bar-tab-inactive))))
 `(tab-line ((t (:inherit tab-bar))))
 `(tab-line-tab ((t (:inherit tab-bar-tab-inactive))))
 `(tab-line-tab-current ((t (:inherit tab-bar-tab))))
 `(tab-line-tab-inactive ((t (:inherit tab-bar-tab-inactive))))
 `(tab-line-tab-inactive-alternate ((t (:inherit tab-line-tab-inactive))))
 `(tab-line-highlight ((t (:background ,cinder-grove-visual
                                       :foreground ,cinder-grove-bright))))
 `(tab-line-close-highlight ((t (:foreground ,cinder-grove-orange))))

 ;; --- doom-modeline ---------------------------------------------------------------
 `(doom-modeline-bar ((t (:background ,cinder-grove-orange))))
 `(doom-modeline-bar-inactive ((t (:background ,cinder-grove-muted))))
 `(doom-modeline-buffer-file ((t (:foreground ,cinder-grove-bright))))
 `(doom-modeline-buffer-path ((t (:foreground ,cinder-grove-bright))))
 `(doom-modeline-buffer-major-mode ((t (:foreground ,cinder-grove-cyan))))
 `(doom-modeline-buffer-minor-mode ((t (:inherit shadow))))
 `(doom-modeline-buffer-modified ((t (:foreground ,cinder-grove-orange :bold t))))
 `(doom-modeline-emphasis ((t (:foreground ,cinder-grove-bright :bold t))))
 `(doom-modeline-highlight ((t (:foreground ,cinder-grove-orange))))
 `(doom-modeline-info ((t (:foreground ,cinder-grove-blue))))
 `(doom-modeline-warning ((t (:foreground ,cinder-grove-yellow))))
 `(doom-modeline-urgent ((t (:foreground ,cinder-grove-red :bold t))))
 `(doom-modeline-debug ((t (:foreground ,cinder-grove-purple))))
 `(doom-modeline-debug-visual ((t (:foreground ,cinder-grove-purple :bold t))))
 `(doom-modeline-vcs-default ((t (:foreground ,cinder-grove-green))))
 `(doom-modeline-lsp-error ((t (:foreground ,cinder-grove-red))))
 `(doom-modeline-lsp-warning ((t (:foreground ,cinder-grove-yellow))))
 `(doom-modeline-lsp-success ((t (:foreground ,cinder-grove-green))))
 `(doom-modeline-lsp-running ((t (:foreground ,cinder-grove-yellow))))
 `(doom-modeline-evil-normal-state ((t (:foreground ,cinder-grove-orange :bold t))))
 `(doom-modeline-evil-insert-state ((t (:foreground ,cinder-grove-green :bold t))))
 `(doom-modeline-evil-visual-state ((t (:foreground ,cinder-grove-purple :bold t))))
 `(doom-modeline-evil-replace-state ((t (:foreground ,cinder-grove-red :bold t))))
 `(doom-modeline-evil-emacs-state ((t (:foreground ,cinder-grove-cyan :bold t))))
 `(doom-modeline-evil-motion-state ((t (:foreground ,cinder-grove-blue :bold t))))
 `(doom-modeline-evil-operator-state ((t (:foreground ,cinder-grove-yellow :bold t))))
 `(doom-modeline-evil-user-state ((t (:foreground ,cinder-grove-blue :bold t))))
 `(doom-modeline-battery-critical ((t (:foreground ,cinder-grove-red :bold t))))
 `(doom-modeline-battery-error ((t (:foreground ,cinder-grove-red))))
 `(doom-modeline-battery-warning ((t (:foreground ,cinder-grove-yellow))))
 `(doom-modeline-battery-charging ((t (:foreground ,cinder-grove-green))))
 `(doom-modeline-battery-full ((t (:foreground ,cinder-grove-green))))
 `(doom-modeline-battery-normal ((t (:foreground ,cinder-grove-green))))
 `(doom-modeline-unread-number ((t (:foreground ,cinder-grove-orange :bold t))))
 `(doom-modeline-compilation ((t (:foreground ,cinder-grove-yellow))))
 `(doom-modeline-panel ((t (:background ,cinder-grove-orange
                                         :foreground ,cinder-grove-bg :bold t))))
 `(doom-modeline-persp-name ((t (:foreground ,cinder-grove-purple))))
 `(doom-modeline-workspace-name ((t (:foreground ,cinder-grove-orange :bold t))))
 `(doom-modeline-persp-buffer-not-in-persp
   ((t (:inherit shadow :italic t))))
 `(doom-modeline-project-dir ((t (:foreground ,cinder-grove-orange))))
 `(doom-modeline-project-name ((t (:foreground ,cinder-grove-orange))))
 `(doom-modeline-project-parent-dir ((t (:inherit shadow))))
 `(doom-modeline-project-root-dir ((t (:inherit shadow))))
 `(doom-modeline-repl-success ((t (:foreground ,cinder-grove-green))))
 `(doom-modeline-repl-warning ((t (:foreground ,cinder-grove-yellow))))
 `(doom-modeline-overwrite ((t (:foreground ,cinder-grove-red :bold t))))
 `(doom-modeline-time ((t (:foreground ,cinder-grove-subtle))))
 `(doom-modeline-host ((t (:foreground ,cinder-grove-subtle))))
 `(doom-modeline-input-method ((t (:foreground ,cinder-grove-subtle))))

 ;; --- solaire (secondary buffers) ---------------------------------------------------
 `(solaire-default-face ((t (:inherit default :background ,cinder-grove-surface))))
 `(solaire-fringe-face ((t (:inherit fringe :background ,cinder-grove-surface))))
 `(solaire-header-line-face ((t (:inherit header-line
                                :background ,cinder-grove-surface))))
 `(solaire-hl-line-face ((t (:inherit hl-line :background ,cinder-grove-visual))))
 `(solaire-line-number-face ((t (:inherit line-number
                                :background ,cinder-grove-surface))))
 `(solaire-mode-line-face ((t (:inherit mode-line))))
 `(solaire-mode-line-active-face ((t (:inherit mode-line-active))))
 `(solaire-mode-line-inactive-face ((t (:inherit mode-line-inactive))))
 `(solaire-region-face ((t (:inherit region))))
 `(solaire-org-hide-face ((t (:foreground ,cinder-grove-surface))))

 ;; --- font lock --------------------------------------------------------------------
 `(font-lock-comment-face ((t (:foreground ,cinder-grove-muted :italic t))))
 `(font-lock-comment-delimiter-face ((t (:inherit font-lock-comment-face))))
 `(font-lock-doc-face ((t (:foreground ,cinder-grove-subtle :italic t))))
 `(font-lock-doc-markup-face ((t (:foreground ,cinder-grove-yellow))))
 `(font-lock-string-face ((t (:foreground ,cinder-grove-green))))
 `(font-lock-keyword-face ((t (:foreground ,cinder-grove-orange))))
 `(font-lock-builtin-face ((t (:foreground ,cinder-grove-blue))))
 `(font-lock-function-name-face ((t (:foreground ,cinder-grove-cyan))))
 `(font-lock-function-call-face ((t (:inherit font-lock-function-name-face))))
 `(font-lock-variable-name-face ((t (:foreground ,cinder-grove-fg))))
 `(font-lock-variable-use-face ((t (:inherit font-lock-variable-name-face))))
 `(font-lock-constant-face ((t (:foreground ,cinder-grove-purple))))
 `(font-lock-type-face ((t (:foreground ,cinder-grove-yellow))))
 `(font-lock-property-name-face ((t (:foreground ,cinder-grove-secondary))))
 `(font-lock-property-use-face ((t (:inherit font-lock-property-name-face))))
 `(font-lock-regexp-face ((t (:inherit font-lock-string-face))))
 `(font-lock-number-face ((t (:foreground ,cinder-grove-purple))))
 `(font-lock-operator-face ((t (:foreground ,cinder-grove-secondary))))
 `(font-lock-punctuation-face ((t (:foreground ,cinder-grove-secondary))))
 `(font-lock-bracket-face ((t (:inherit font-lock-punctuation-face))))
 `(font-lock-delimiter-face ((t (:inherit font-lock-punctuation-face))))
 `(font-lock-misc-punctuation-face ((t (:inherit font-lock-punctuation-face))))
 `(font-lock-preprocessor-face ((t (:foreground ,cinder-grove-orange :italic t))))
 `(font-lock-negation-char-face ((t (:foreground ,cinder-grove-red))))
 `(font-lock-warning-face ((t (:foreground ,cinder-grove-yellow))))
 `(font-lock-escape-face ((t (:foreground ,cinder-grove-bright))))
 `(font-lock-regexp-grouping-backslash ((t (:inherit bold))))
 `(font-lock-regexp-grouping-construct ((t (:inherit bold))))

 ;; --- diagnostics (restrained: colored text, no noisy backgrounds) ----------------
 `(error ((t (:foreground ,cinder-grove-red))))
 `(warning ((t (:foreground ,cinder-grove-yellow))))
 `(success ((t (:foreground ,cinder-grove-green))))
 `(flycheck-error ((t (:underline (:style wave :color ,cinder-grove-red)))))
 `(flycheck-warning ((t (:underline (:style wave :color ,cinder-grove-yellow)))))
 `(flycheck-info ((t (:underline (:style wave :color ,cinder-grove-blue)))))
 `(flycheck-fringe-error ((t (:inherit error))))
 `(flycheck-fringe-warning ((t (:inherit warning))))
 `(flycheck-fringe-info ((t (:inherit compilation-info))))
 `(flycheck-error-list-error ((t (:foreground ,cinder-grove-red :bold t))))
 `(flycheck-error-list-warning ((t (:foreground ,cinder-grove-yellow :bold t))))
 `(flycheck-error-list-info ((t (:foreground ,cinder-grove-blue :bold t))))
 `(flycheck-error-list-line-number ((t (:inherit shadow))))
 `(flycheck-error-list-column-number ((t (:inherit shadow))))
 `(flycheck-error-list-id ((t (:foreground ,cinder-grove-subtle))))
 `(flycheck-error-list-filename ((t (:foreground ,cinder-grove-cyan))))
 `(flymake-error ((t (:underline (:style wave :color ,cinder-grove-red)))))
 `(flymake-warning ((t (:underline (:style wave :color ,cinder-grove-yellow)))))
 `(flymake-note ((t (:underline (:style wave :color ,cinder-grove-blue)))))

 ;; --- eglot ------------------------------------------------------------------------
 `(eglot-highlight-symbol-face ((t (:background ,cinder-grove-visual))))
 `(eglot-diagnostic-tag-unnecessary-face ((t (:inherit shadow))))
 `(eglot-diagnostic-tag-deprecated-face ((t (:strike-through t))))
 `(eglot-inlay-hint-face ((t (:inherit shadow :height 0.8 :slant italic))))
 `(eglot-type-hint-face ((t (:inherit eglot-inlay-hint-face
                           :foreground ,cinder-grove-yellow))))
 `(eglot-parameter-hint-face ((t (:inherit eglot-inlay-hint-face
                                :foreground ,cinder-grove-orange))))

 ;; --- completions ---------------------------------------------------------------------
 `(completions-common-part ((t (:foreground ,cinder-grove-orange :bold t))))
 `(completions-first-difference ((t (:foreground ,cinder-grove-orange :bold t))))
 `(completions-annotations ((t (:inherit shadow :slant italic))))
 `(completions-highlight ((t (:background ,cinder-grove-visual
                             :foreground ,cinder-grove-bright))))
 `(completions-group-title ((t (:foreground ,cinder-grove-purple :weight bold))))
 `(completions-group-separator ((t (:foreground ,cinder-grove-muted
                                   :strike-through t))))
 `(corfu-default ((t (:background ,cinder-grove-container
                                  :foreground ,cinder-grove-fg))))
 `(corfu-current ((t (:background ,cinder-grove-visual
                                  :foreground ,cinder-grove-bright))))
 `(corfu-annotations ((t (:inherit completions-annotations))))
 `(corfu-deprecated ((t (:inherit shadow :strike-through t))))
 `(corfu-bar ((t (:background ,cinder-grove-muted))))
 `(corfu-border ((t (:background ,cinder-grove-orange))))
 `(corfu-echo ((t (:inherit completions-annotations))))
 `(corfu-popupinfo ((t (:background ,cinder-grove-container
                                    :foreground ,cinder-grove-secondary))))
 `(corfu-quick1 ((t (:foreground ,cinder-grove-orange :bold t))))
 `(corfu-quick2 ((t (:foreground ,cinder-grove-yellow :bold t))))
 `(vertico-current ((t (:background ,cinder-grove-visual
                                    :foreground ,cinder-grove-bright))))
 `(vertico-group-title ((t (:inherit completions-group-title))))
 `(vertico-group-separator ((t (:foreground ,cinder-grove-muted))))
 `(orderless-match-face-0 ((t (:foreground ,cinder-grove-orange :bold t))))
 `(orderless-match-face-1 ((t (:foreground ,cinder-grove-yellow :bold t))))
 `(orderless-match-face-2 ((t (:foreground ,cinder-grove-green :bold t))))
 `(orderless-match-face-3 ((t (:foreground ,cinder-grove-cyan :bold t))))
 `(marginalia-documentation ((t (:inherit completions-annotations))))
 `(marginalia-key ((t (:foreground ,cinder-grove-orange :bold t))))
 `(marginalia-value ((t (:foreground ,cinder-grove-green))))
 `(marginalia-lighter ((t (:inherit shadow))))
 `(marginalia-modified ((t (:foreground ,cinder-grove-yellow))))
 `(marginalia-date ((t (:foreground ,cinder-grove-blue))))
 `(marginalia-type ((t (:foreground ,cinder-grove-cyan))))
 `(marginalia-on ((t (:foreground ,cinder-grove-green))))
 `(marginalia-off ((t (:inherit shadow))))
 `(marginalia-installed ((t (:foreground ,cinder-grove-green))))
 `(marginalia-archive ((t (:inherit shadow))))
 `(marginalia-null ((t (:inherit shadow))))
 `(marginalia-number ((t (:foreground ,cinder-grove-purple))))
 `(marginalia-function ((t (:foreground ,cinder-grove-cyan))))
 `(marginalia-symbol ((t (:foreground ,cinder-grove-purple))))
 `(consult-help ((t (:foreground ,cinder-grove-orange))))
 `(consult-key ((t (:foreground ,cinder-grove-orange :bold t))))
 `(consult-grep-context ((t (:inherit completions-annotations))))
 `(consult-preview-line ((t (:background ,cinder-grove-surface))))
 `(consult-preview-insertion ((t (:background ,cinder-grove-surface))))
 `(consult-preview-match ((t (:foreground ,cinder-grove-orange :bold t))))
 `(consult-highlight-match ((t (:foreground ,cinder-grove-orange :bold t))))
 `(consult-highlight-mark ((t (:background ,cinder-grove-visual))))
 `(consult-async-split ((t (:foreground ,cinder-grove-yellow :bold t))))
 `(consult-async-running ((t (:foreground ,cinder-grove-yellow))))
 `(consult-async-failed ((t (:foreground ,cinder-grove-red))))
 `(consult-async-finished ((t (:foreground ,cinder-grove-green))))
 `(consult-async-option ((t (:foreground ,cinder-grove-cyan))))
 `(consult-narrow-indicator ((t (:foreground ,cinder-grove-muted))))
 `(consult-imenu-prefix ((t (:inherit shadow))))
 `(consult-line-number ((t (:inherit shadow))))
 `(embark-keybinding ((t (:foreground ,cinder-grove-orange :bold t))))
 `(embark-keybinding-repeat ((t (:foreground ,cinder-grove-orange :bold t
                                              :underline t))))
 `(embark-keymap ((t (:foreground ,cinder-grove-purple :bold t))))
 `(embark-target ((t (:foreground ,cinder-grove-yellow))))
 `(embark-selected ((t (:foreground ,cinder-grove-green :bold t))))
 `(embark-collect-group-title ((t (:foreground ,cinder-grove-purple :bold t))))
 `(embark-collect-group-separator ((t (:foreground ,cinder-grove-muted))))
 `(embark-collect-candidate ((t (:foreground ,cinder-grove-fg))))
 `(embark-collect-annotation ((t (:inherit completions-annotations))))
 `(embark-verbose-indicator-title ((t (:foreground ,cinder-grove-orange :bold t))))
 `(embark-verbose-indicator-documentation
   ((t (:inherit completions-annotations))))
 `(embark-verbose-indicator-shadowed ((t (:foreground ,cinder-grove-muted))))

 ;; --- dired, diredfl, dirvish -------------------------------------------------------
 `(dired-directory ((t (:foreground ,cinder-grove-blue))))
 `(dired-symlink ((t (:foreground ,cinder-grove-cyan))))
 `(dired-broken-symlink ((t (:foreground ,cinder-grove-red :bold t))))
 `(dired-flagged ((t (:foreground ,cinder-grove-red
                                  :background ,cinder-grove-surface))))
 `(dired-marked ((t (:foreground ,cinder-grove-green
                                 :background ,cinder-grove-surface))))
 `(dired-mark ((t (:foreground ,cinder-grove-orange :bold t))))
 `(dired-header ((t (:foreground ,cinder-grove-purple :bold t))))
 `(dired-special ((t (:foreground ,cinder-grove-yellow))))
 `(dired-ignored ((t (:foreground ,cinder-grove-muted))))
 `(dired-warning ((t (:foreground ,cinder-grove-yellow))))
 `(diredfl-dir-heading ((t (:foreground ,cinder-grove-purple :bold t))))
 `(diredfl-dir-name ((t (:foreground ,cinder-grove-blue :bold t))))
 `(diredfl-dir-priv ((t (:foreground ,cinder-grove-blue))))
 `(diredfl-file-name ((t (:foreground ,cinder-grove-fg))))
 `(diredfl-file-suffix ((t (:foreground ,cinder-grove-subtle))))
 `(diredfl-date-time ((t (:inherit shadow))))
 `(diredfl-number ((t (:inherit shadow))))
 `(diredfl-symlink ((t (:foreground ,cinder-grove-cyan))))
 `(diredfl-executable-tag ((t (:foreground ,cinder-grove-green))))
 `(diredfl-compressed-file-name ((t (:foreground ,cinder-grove-fg))))
 `(diredfl-compressed-file-suffix ((t (:foreground ,cinder-grove-yellow))))
 `(diredfl-ignored-file-name ((t (:foreground ,cinder-grove-muted))))
 `(diredfl-flag-mark ((t (:foreground ,cinder-grove-bg
                                       :background ,cinder-grove-orange :bold t))))
 `(diredfl-flag-mark-line ((t (:background ,cinder-grove-orange
                                           :foreground ,cinder-grove-bg))))
 `(diredfl-deletion ((t (:foreground ,cinder-grove-bg
                                      :background ,cinder-grove-red :bold t))))
 `(diredfl-deletion-file-name ((t (:foreground ,cinder-grove-red))))
 `(diredfl-read-priv ((t (:inherit shadow))))
 `(diredfl-write-priv ((t (:inherit shadow))))
 `(diredfl-exec-priv ((t (:foreground ,cinder-grove-green))))
 `(diredfl-no-priv ((t (:foreground ,cinder-grove-muted))))
 `(diredfl-link-priv ((t (:foreground ,cinder-grove-cyan))))
 `(diredfl-other-priv ((t (:foreground ,cinder-grove-muted))))
 `(diredfl-rare-priv ((t (:foreground ,cinder-grove-yellow))))
 `(dirvish-hl-line ((t (:background ,cinder-grove-surface))))
 `(dirvish-hl-line-inactive ((t (:background ,cinder-grove-container))))
 `(dirvish-inactive ((t (:inherit shadow))))
 `(dirvish-subtree-guide ((t (:foreground ,cinder-grove-visual))))
 `(dirvish-emerge-group-title ((t (:foreground ,cinder-grove-purple :bold t))))
 `(dirvish-narrow-match-face-0 ((t (:foreground ,cinder-grove-orange :bold t))))
 `(dirvish-narrow-match-face-1 ((t (:foreground ,cinder-grove-yellow :bold t))))
 `(dirvish-narrow-match-face-2 ((t (:foreground ,cinder-grove-green :bold t))))
 `(dirvish-narrow-match-face-3 ((t (:foreground ,cinder-grove-cyan :bold t))))
 `(dirvish-narrow-split ((t (:foreground ,cinder-grove-muted))))
 `(dirvish-vc-added-state ((t (:foreground ,cinder-grove-green))))
 `(dirvish-vc-edited-state ((t (:foreground ,cinder-grove-yellow))))
 `(dirvish-vc-conflict-state ((t (:foreground ,cinder-grove-red :bold t))))
 `(dirvish-vc-removed-state ((t (:foreground ,cinder-grove-muted))))
 `(dirvish-vc-unregistered-face ((t (:foreground ,cinder-grove-muted))))
 `(dirvish-proc-failed ((t (:foreground ,cinder-grove-red))))
 `(dirvish-proc-finished ((t (:foreground ,cinder-grove-green))))
 `(dirvish-proc-running ((t (:foreground ,cinder-grove-yellow))))
 `(dirvish-free-space ((t (:inherit shadow))))
 `(dirvish-file-device-number ((t (:inherit shadow))))
 `(dirvish-file-group-id ((t (:inherit shadow))))
 `(dirvish-file-inode-number ((t (:inherit shadow))))
 `(dirvish-file-link-number ((t (:inherit shadow))))
 `(dirvish-file-modes ((t (:inherit shadow))))
 `(dirvish-file-size ((t (:inherit shadow))))
 `(dirvish-file-time ((t (:inherit shadow))))
 `(dirvish-file-user-id ((t (:inherit shadow))))
 `(dirvish-git-commit-message-face ((t (:foreground ,cinder-grove-fg))))
 `(dirvish-collapse-dir-face ((t (:foreground ,cinder-grove-blue))))
 `(dirvish-collapse-file-face ((t (:foreground ,cinder-grove-fg))))
 `(dirvish-collapse-empty-dir-face ((t (:foreground ,cinder-grove-muted))))
 `(dirvish-media-info-heading ((t (:foreground ,cinder-grove-orange :bold t))))

 ;; --- diff, magit, vc ------------------------------------------------------------------
 `(diff-hl-change ((t (:foreground ,cinder-grove-yellow))))
 `(diff-hl-delete ((t (:foreground ,cinder-grove-red))))
 `(diff-hl-insert ((t (:foreground ,cinder-grove-green))))
 `(diff-added ((t (:foreground ,cinder-grove-green
                               :background ,cinder-grove-container))))
 `(diff-removed ((t (:foreground ,cinder-grove-red
                                 :background ,cinder-grove-container))))
 `(diff-changed ((t (:foreground ,cinder-grove-yellow))))
 `(diff-refine-added ((t (:foreground ,cinder-grove-green :bold t))))
 `(diff-refine-removed ((t (:foreground ,cinder-grove-red :bold t))))
 `(diff-refine-changed ((t (:foreground ,cinder-grove-yellow :bold t))))
 `(diff-header ((t (:foreground ,cinder-grove-subtle))))
 `(diff-hunk-header ((t (:foreground ,cinder-grove-subtle
                                     :background ,cinder-grove-surface))))
 `(diff-file-header ((t (:foreground ,cinder-grove-orange :bold t))))
 `(magit-section-highlight ((t (:background ,cinder-grove-surface))))
 `(magit-section-heading ((t (:foreground ,cinder-grove-orange :bold t))))
 `(magit-section-heading-selection ((t (:foreground ,cinder-grove-yellow))))
 `(magit-dimmed ((t (:foreground ,cinder-grove-muted))))
 `(magit-hash ((t (:inherit shadow))))
 `(magit-header-line ((t (:foreground ,cinder-grove-orange :bold t))))
 `(magit-branch-local ((t (:foreground ,cinder-grove-cyan))))
 `(magit-branch-remote ((t (:foreground ,cinder-grove-green))))
 `(magit-branch-current ((t (:foreground ,cinder-grove-orange :bold t))))
 `(magit-tag ((t (:foreground ,cinder-grove-yellow))))
 `(magit-refname ((t (:foreground ,cinder-grove-secondary))))
 `(magit-log-author ((t (:foreground ,cinder-grove-blue))))
 `(magit-log-date ((t (:inherit shadow))))
 `(magit-diff-hunk-heading ((t (:foreground ,cinder-grove-subtle
                                            :background ,cinder-grove-container))))
 `(magit-diff-hunk-heading-highlight ((t (:foreground ,cinder-grove-subtle
                                                      :background
                                                      ,cinder-grove-surface))))
 `(magit-diff-added ((t (:foreground ,cinder-grove-green))))
 `(magit-diff-added-highlight ((t (:foreground ,cinder-grove-green
                                               :background ,cinder-grove-surface))))
 `(magit-diff-removed ((t (:foreground ,cinder-grove-red))))
 `(magit-diff-removed-highlight ((t (:foreground ,cinder-grove-red
                                                 :background
                                                 ,cinder-grove-surface))))
 `(magit-diff-context ((t (:foreground ,cinder-grove-secondary))))
 `(magit-diff-context-highlight ((t (:foreground ,cinder-grove-fg
                                                 :background
                                                 ,cinder-grove-surface))))
 `(magit-diff-our ((t (:foreground ,cinder-grove-red))))
 `(magit-diff-their ((t (:foreground ,cinder-grove-green))))
 `(magit-diff-base ((t (:foreground ,cinder-grove-purple))))
 `(magit-diff-base-highlight ((t (:foreground ,cinder-grove-purple
                                              :background
                                              ,cinder-grove-surface))))
 `(magit-diffstat-added ((t (:foreground ,cinder-grove-green))))
 `(magit-diffstat-removed ((t (:foreground ,cinder-grove-red))))
 `(git-commit-summary ((t (:foreground ,cinder-grove-bright))))
 `(ediff-current-diff-A ((t (:foreground ,cinder-grove-red
                                         :background ,cinder-grove-visual))))
 `(ediff-current-diff-B ((t (:foreground ,cinder-grove-green
                                         :background ,cinder-grove-visual))))
 `(ediff-current-diff-C ((t (:foreground ,cinder-grove-yellow
                                         :background ,cinder-grove-visual))))
 `(ediff-current-diff-Ancestor ((t (:foreground ,cinder-grove-subtle
                                                :background
                                                ,cinder-grove-visual))))
 `(ediff-fine-diff-A ((t (:foreground ,cinder-grove-red :bold t
                                      :background ,cinder-grove-surface))))
 `(ediff-fine-diff-B ((t (:foreground ,cinder-grove-green :bold t
                                      :background ,cinder-grove-surface))))
 `(ediff-fine-diff-C ((t (:foreground ,cinder-grove-yellow :bold t
                                      :background ,cinder-grove-surface))))
 `(ediff-fine-diff-Ancestor ((t (:foreground ,cinder-grove-subtle
                                             :background
                                             ,cinder-grove-surface))))
 `(ediff-even-diff-A ((t (:foreground ,cinder-grove-secondary
                                      :background ,cinder-grove-container))))
 `(ediff-even-diff-B ((t (:foreground ,cinder-grove-secondary
                                      :background ,cinder-grove-container))))
 `(ediff-even-diff-C ((t (:foreground ,cinder-grove-secondary
                                      :background ,cinder-grove-container))))
 `(ediff-even-diff-Ancestor ((t (:foreground ,cinder-grove-secondary
                                             :background
                                             ,cinder-grove-container))))
 `(ediff-odd-diff-A ((t (:foreground ,cinder-grove-fg
                                     :background ,cinder-grove-surface))))
 `(ediff-odd-diff-B ((t (:foreground ,cinder-grove-fg
                                     :background ,cinder-grove-surface))))
 `(ediff-odd-diff-C ((t (:foreground ,cinder-grove-fg
                                     :background ,cinder-grove-surface))))
 `(ediff-odd-diff-Ancestor ((t (:foreground ,cinder-grove-fg
                                            :background
                                            ,cinder-grove-surface))))
 `(smerge-upper ((t (:foreground ,cinder-grove-red
                                 :background ,cinder-grove-container))))
 `(smerge-lower ((t (:foreground ,cinder-grove-green
                                 :background ,cinder-grove-container))))
 `(smerge-base ((t (:foreground ,cinder-grove-purple
                                :background ,cinder-grove-container))))
 `(smerge-markers ((t (:foreground ,cinder-grove-subtle
                                   :background ,cinder-grove-surface))))
 `(smerge-refined-added ((t (:foreground ,cinder-grove-green :bold t))))
 `(smerge-refined-removed ((t (:foreground ,cinder-grove-red :bold t))))
 `(smerge-refined-changed ((t (:foreground ,cinder-grove-yellow :bold t))))
 `(git-timemachine-commit ((t (:foreground ,cinder-grove-bright :bold t))))
 `(git-timemachine-minibuffer-author-face ((t (:foreground ,cinder-grove-yellow))))
 `(git-timemachine-minibuffer-detail-face ((t (:foreground ,cinder-grove-fg))))

 ;; --- org ---------------------------------------------------------------------------
 ;; Includes the +org-todo-* faces Doom's org module declares dynamically.
 ;; A TTY cannot use its unknown default background as an invisible foreground.
 `(org-hide ((t (:foreground ,cinder-grove-bg))))
 `(org-document-title ((t (:foreground ,cinder-grove-orange :bold t :height 1.2))))
 `(org-document-info ((t (:foreground ,cinder-grove-subtle))))
 `(org-level-1 ((t (:foreground ,cinder-grove-orange :bold t))))
 `(org-level-2 ((t (:foreground ,cinder-grove-green :bold t))))
 `(org-level-3 ((t (:foreground ,cinder-grove-yellow))))
 `(org-level-4 ((t (:foreground ,cinder-grove-blue))))
 `(org-level-5 ((t (:foreground ,cinder-grove-purple))))
 `(org-level-6 ((t (:foreground ,cinder-grove-cyan))))
 `(org-level-7 ((t (:foreground ,cinder-grove-secondary))))
 `(org-level-8 ((t (:foreground ,cinder-grove-subtle))))
 `(org-todo ((t (:foreground ,cinder-grove-orange :bold t))))
 `(org-done ((t (:foreground ,cinder-grove-green :bold t))))
 `(+org-todo-active ((t (:foreground ,cinder-grove-yellow :bold t))))
 `(+org-todo-onhold ((t (:foreground ,cinder-grove-blue :bold t))))
 `(+org-todo-cancel ((t (:foreground ,cinder-grove-muted :strike-through t))))
 `(+org-todo-project ((t (:foreground ,cinder-grove-purple :bold t))))
 `(org-priority ((t (:foreground ,cinder-grove-yellow))))
 `(org-tag ((t (:inherit shadow))))
 `(org-date ((t (:foreground ,cinder-grove-blue :underline t))))
 `(org-special-keyword ((t (:inherit shadow))))
 `(org-meta-line ((t (:inherit shadow))))
 `(org-drawer ((t (:inherit shadow))))
 `(org-property-value ((t (:foreground ,cinder-grove-secondary))))
 `(org-table ((t (:foreground ,cinder-grove-secondary))))
 `(org-formula ((t (:foreground ,cinder-grove-purple))))
 `(org-block ((t (:background ,cinder-grove-container :extend t))))
 `(org-block-begin-line ((t (:foreground ,cinder-grove-subtle
                                          :background ,cinder-grove-container
                                          :extend t))))
 `(org-block-end-line ((t (:inherit org-block-begin-line))))
 `(org-code ((t (:foreground ,cinder-grove-green
                             :background ,cinder-grove-container :extend nil))))
 `(org-inline-src-block ((t (:inherit org-block :extend nil))))
 `(org-verbatim ((t (:foreground ,cinder-grove-secondary))))
 `(org-quote ((t (:inherit org-block :slant italic :extend t))))
 `(org-headline-done ((t (:foreground ,cinder-grove-muted))))
 `(org-checkbox ((t (:foreground ,cinder-grove-orange :bold t))))
 `(org-link ((t (:foreground ,cinder-grove-blue :underline t))))
 `(org-footnote ((t (:foreground ,cinder-grove-subtle))))
 `(org-ellipsis ((t (:foreground ,cinder-grove-muted))))
 `(org-column ((t (:background ,cinder-grove-surface))))
 `(org-column-title ((t (:foreground ,cinder-grove-orange :bold t
                                      :background ,cinder-grove-surface))))
 `(org-clock-overlay ((t (:background ,cinder-grove-visual))))
 `(org-agenda-clocking ((t (:background ,cinder-grove-visual))))
 `(org-agenda-structure ((t (:foreground ,cinder-grove-purple :bold t))))
 `(org-agenda-date ((t (:foreground ,cinder-grove-blue))))
 `(org-agenda-date-today ((t (:foreground ,cinder-grove-orange :bold t))))
 `(org-agenda-date-weekend ((t (:foreground ,cinder-grove-yellow))))
 `(org-agenda-done ((t (:foreground ,cinder-grove-muted))))
 `(org-scheduled ((t (:foreground ,cinder-grove-fg))))
 `(org-scheduled-today ((t (:foreground ,cinder-grove-green))))
 `(org-imminent-deadline ((t (:inherit org-warning))))
 `(org-upcoming-deadline ((t (:foreground ,cinder-grove-yellow))))
 `(org-time-grid ((t (:inherit shadow))))
 `(org-warning ((t (:foreground ,cinder-grove-red :bold t))))

 ;; --- markdown -------------------------------------------------------------------------
 `(markdown-header-face-1 ((t (:foreground ,cinder-grove-orange :bold t))))
 `(markdown-header-face-2 ((t (:foreground ,cinder-grove-green :bold t))))
 `(markdown-header-face-3 ((t (:foreground ,cinder-grove-yellow))))
 `(markdown-header-face-4 ((t (:foreground ,cinder-grove-blue))))
 `(markdown-header-face-5 ((t (:foreground ,cinder-grove-purple))))
 `(markdown-header-face-6 ((t (:foreground ,cinder-grove-cyan))))
 `(markdown-header-delimiter-face ((t (:foreground ,cinder-grove-muted))))
 `(markdown-header-rule-face ((t (:foreground ,cinder-grove-muted))))
 `(markdown-hr-face ((t (:foreground ,cinder-grove-muted))))
 `(markdown-blockquote-face ((t (:foreground ,cinder-grove-yellow :italic t))))
 `(markdown-code-face ((t (:background ,cinder-grove-container
                                       :foreground ,cinder-grove-bright
                                       :inherit fixed-pitch :extend nil))))
 `(markdown-pre-face ((t (:inherit markdown-code-face :extend t))))
 `(markdown-inline-code-face ((t (:inherit markdown-code-face
                                 :foreground ,cinder-grove-green :extend nil))))
 `(markdown-language-keyword-face ((t (:foreground ,cinder-grove-purple))))
 `(markdown-markup-face ((t (:foreground ,cinder-grove-muted))))
 `(markdown-list-face ((t (:foreground ,cinder-grove-green))))
 `(markdown-link-face ((t (:foreground ,cinder-grove-blue))))
 `(markdown-url-face ((t (:foreground ,cinder-grove-blue :underline t))))
 `(markdown-plain-url-face ((t (:foreground ,cinder-grove-blue :underline t))))
 `(markdown-reference-face ((t (:foreground ,cinder-grove-blue))))
 `(markdown-footnote-marker-face ((t (:foreground ,cinder-grove-subtle))))
 `(markdown-metadata-key-face ((t (:foreground ,cinder-grove-purple))))
 `(markdown-metadata-value-face ((t (:foreground ,cinder-grove-secondary))))
 `(markdown-gfm-checkbox-face ((t (:foreground ,cinder-grove-orange :bold t))))
 `(markdown-math-face ((t (:foreground ,cinder-grove-blue))))
 `(markdown-missing-link-face ((t (:foreground ,cinder-grove-red))))
 `(markdown-comment-face ((t (:inherit font-lock-comment-face))))
 `(markdown-strike-through-face ((t (:foreground ,cinder-grove-muted
                                                 :strike-through t))))

 ;; --- info, help, custom, compilation --------------------------------------------------
 `(info-title-1 ((t (:foreground ,cinder-grove-purple :bold t))))
 `(info-title-2 ((t (:foreground ,cinder-grove-purple))))
 `(info-title-3 ((t (:foreground ,cinder-grove-orange))))
 `(info-title-4 ((t (:foreground ,cinder-grove-orange))))
 `(info-menu-header ((t (:foreground ,cinder-grove-orange :bold t))))
 `(info-menu-star ((t (:foreground ,cinder-grove-orange))))
 `(info-node ((t (:foreground ,cinder-grove-orange :bold t))))
 `(info-header-node ((t (:foreground ,cinder-grove-subtle))))
 `(info-header-xref ((t (:foreground ,cinder-grove-blue))))
 `(info-xref ((t (:foreground ,cinder-grove-blue :underline t))))
 `(info-xref-visited ((t (:foreground ,cinder-grove-purple :underline t))))
 `(info-index-match ((t (:inherit isearch))))
 `(help-argument-name ((t (:foreground ,cinder-grove-cyan :italic t))))
 `(help-key-binding ((t (:background ,cinder-grove-container
                                      :foreground ,cinder-grove-bright :bold t))))
 `(widget-field ((t (:background ,cinder-grove-container
                                 :foreground ,cinder-grove-fg))))
 `(widget-single-line-field ((t (:background ,cinder-grove-container
                                             :foreground ,cinder-grove-fg))))
 `(widget-button ((t (:foreground ,cinder-grove-orange :bold t))))
 `(custom-variable-tag ((t (:foreground ,cinder-grove-orange :bold t))))
 `(custom-face-tag ((t (:foreground ,cinder-grove-yellow))))
 `(custom-group-tag ((t (:foreground ,cinder-grove-purple :bold t))))
 `(custom-state ((t (:foreground ,cinder-grove-green))))
 `(custom-comment ((t (:inherit font-lock-comment-face))))
 `(custom-comment-tag ((t (:foreground ,cinder-grove-subtle))))
 `(custom-documentation ((t (:foreground ,cinder-grove-secondary))))
 `(compilation-error ((t (:inherit error))))
 `(compilation-warning ((t (:inherit warning))))
 `(compilation-info ((t (:foreground ,cinder-grove-blue))))
 `(compilation-line-number ((t (:inherit shadow))))
 `(compilation-column-number ((t (:inherit shadow))))
 `(compilation-mode-line-fail ((t (:foreground ,cinder-grove-red :bold t))))
 `(compilation-mode-line-exit ((t (:foreground ,cinder-grove-green :bold t))))
 `(compilation-mode-line-run ((t (:foreground ,cinder-grove-yellow :bold t))))
 `(whitespace-trailing ((t (:background ,cinder-grove-surface))))
 `(whitespace-line ((t (:background ,cinder-grove-surface
                                    :foreground ,cinder-grove-yellow))))
 `(whitespace-space ((t (:foreground ,cinder-grove-visual))))
 `(whitespace-hspace ((t (:foreground ,cinder-grove-visual))))
 `(whitespace-tab ((t (:foreground ,cinder-grove-visual))))
 `(whitespace-newline ((t (:foreground ,cinder-grove-visual))))
 `(whitespace-indentation ((t (:foreground ,cinder-grove-visual))))
 `(whitespace-empty ((t (:foreground ,cinder-grove-visual))))

 ;; --- evil, search previews -----------------------------------------------------------
 `(evil-ex-substitute-matches ((t (:background ,cinder-grove-surface
                                               :strike-through t))))
 `(evil-ex-substitute-replacement ((t (:foreground ,cinder-grove-green))))
 `(evil-search-highlight-persist-highlight-face
   ((t (:background ,cinder-grove-visual))))
 `(evil-traces-default ((t (:background ,cinder-grove-surface
                                        :foreground ,cinder-grove-fg))))
 `(evil-traces-global-match ((t (:background ,cinder-grove-surface
                                             :foreground ,cinder-grove-bright
                                             :strike-through t))))
 `(evil-traces-global-range ((t (:background ,cinder-grove-visual
                                             :foreground ,cinder-grove-bright))))
 `(evil-traces-substitute-range ((t (:background ,cinder-grove-visual
                                                 :foreground
                                                 ,cinder-grove-bright))))
 `(evil-traces-delete ((t (:background ,cinder-grove-red
                                       :foreground ,cinder-grove-bg :bold t))))
 `(evil-traces-change ((t (:background ,cinder-grove-orange
                                       :foreground ,cinder-grove-bg :bold t))))
 `(evil-traces-yank ((t (:background ,cinder-grove-green
                                     :foreground ,cinder-grove-bg :bold t))))
 `(evil-traces-copy-preview ((t (:background ,cinder-grove-surface
                                             :foreground ,cinder-grove-bright))))
 `(evil-traces-copy-range ((t (:background ,cinder-grove-visual
                                           :foreground ,cinder-grove-bright))))
 `(evil-traces-move-preview ((t (:background ,cinder-grove-surface))))
 `(evil-traces-move-range ((t (:background ,cinder-grove-visual))))
 `(evil-traces-normal ((t (:foreground ,cinder-grove-fg))))
 `(evil-goggles-default-face ((t (:background ,cinder-grove-visual
                                              :foreground ,cinder-grove-bright))))
 `(evil-goggles-delete-face ((t (:background ,cinder-grove-red
                                             :foreground ,cinder-grove-bg))))
 `(evil-goggles-change-face ((t (:background ,cinder-grove-orange
                                             :foreground ,cinder-grove-bg))))
 `(evil-goggles-yank-face ((t (:background ,cinder-grove-green
                                           :foreground ,cinder-grove-bg))))
 `(evil-goggles-paste-face ((t (:background ,cinder-grove-blue
                                            :foreground ,cinder-grove-bg))))
 `(evil-goggles-replace-with-register-face ((t (:background ,cinder-grove-purple
                                                           :foreground
                                                           ,cinder-grove-bg))))
 `(evil-goggles-surround-face ((t (:background ,cinder-grove-cyan
                                               :foreground ,cinder-grove-bg))))
 `(evil-snipe-first-match-face ((t (:background ,cinder-grove-orange
                                                :foreground ,cinder-grove-bg
                                                :bold t))))
 `(evil-snipe-matches-face ((t (:background ,cinder-grove-surface
                                            :foreground ,cinder-grove-bright))))
 `(anzu-mode-line ((t (:foreground ,cinder-grove-orange :bold t))))
 `(anzu-mode-line-no-match ((t (:foreground ,cinder-grove-red :bold t))))
 `(anzu-replace-highlight ((t (:background ,cinder-grove-surface
                                           :foreground ,cinder-grove-bright))))
 `(anzu-replace-to ((t (:foreground ,cinder-grove-green :bold t))))
 `(anzu-match-1 ((t (:foreground ,cinder-grove-orange))))
 `(anzu-match-2 ((t (:foreground ,cinder-grove-yellow))))
 `(anzu-match-3 ((t (:foreground ,cinder-grove-green))))
 `(iedit-occurrence ((t (:background ,cinder-grove-surface
                                     :foreground ,cinder-grove-bright :bold t))))
 `(iedit-read-only-occurrence ((t (:background ,cinder-grove-visual
                                               :foreground ,cinder-grove-muted
                                               :italic t))))

 ;; --- navigation -------------------------------------------------------------------------
 `(avy-lead-face ((t (:background ,cinder-grove-orange
                                  :foreground ,cinder-grove-bg :bold t))))
 `(avy-lead-face-0 ((t (:background ,cinder-grove-green
                                    :foreground ,cinder-grove-bg :bold t))))
 `(avy-lead-face-1 ((t (:background ,cinder-grove-yellow
                                    :foreground ,cinder-grove-bg :bold t))))
 `(avy-lead-face-2 ((t (:background ,cinder-grove-blue
                                    :foreground ,cinder-grove-bg :bold t))))
 `(avy-background-face ((t (:foreground ,cinder-grove-muted))))
 `(avy-goto-char-timer-face ((t (:background ,cinder-grove-surface
                                             :foreground
                                             ,cinder-grove-bright :bold t))))
 `(aw-leading-char-face ((t (:foreground ,cinder-grove-orange :bold t))))
 `(aw-background-face ((t (:foreground ,cinder-grove-muted))))
 `(aw-mode-line-face ((t (:foreground ,cinder-grove-orange :bold t))))
 `(aw-minibuffer-leading-char-face ((t (:foreground ,cinder-grove-orange
                                                    :bold t))))

 ;; --- misc ui ------------------------------------------------------------------------------
 `(hl-todo ((t (:foreground ,cinder-grove-orange :bold t))))
 `(link ((t (:foreground ,cinder-grove-blue :underline t))))
 `(link-visited ((t (:foreground ,cinder-grove-purple :underline t))))
 `(tooltip ((t (:background ,cinder-grove-container
                            :foreground ,cinder-grove-fg))))
 `(popup-face ((t (:background ,cinder-grove-container
                               :foreground ,cinder-grove-fg))))
 `(popup-tip-face ((t (:background ,cinder-grove-surface
                                   :foreground ,cinder-grove-orange))))
 `(popup-menu-selection-face ((t (:background ,cinder-grove-orange
                                              :foreground ,cinder-grove-bg))))
 `(popup-menu-summary-face ((t (:inherit shadow))))
 `(child-frame-border ((t (:background ,cinder-grove-muted))))
 `(nav-flash-face ((t (:background ,cinder-grove-visual
                                   :foreground ,cinder-grove-orange))))
 `(which-key-key-face ((t (:foreground ,cinder-grove-orange :bold t))))
 `(which-key-command-description-face ((t (:foreground ,cinder-grove-fg))))
 `(which-key-group-description-face ((t (:foreground ,cinder-grove-subtle))))
 `(which-key-special-key-face ((t (:foreground ,cinder-grove-orange :bold t))))
 `(which-key-separator-face ((t (:foreground ,cinder-grove-muted))))
 `(which-key-note-face ((t (:inherit shadow :italic t))))
 `(dashboard-banner-logo-title ((t (:foreground ,cinder-grove-orange :bold t))))
 `(doom-dashboard-default ((t (:background ,cinder-grove-bg :foreground ,cinder-grove-fg))))
 `(dashboard-items-face ((t (:foreground ,cinder-grove-fg))))
 `(dashboard-heading ((t (:foreground ,cinder-grove-orange :bold t))))
 `(dashboard-navigator-face ((t (:foreground ,cinder-grove-blue))))
 `(transient-key ((t (:foreground ,cinder-grove-orange :bold t))))
 `(transient-heading ((t (:foreground ,cinder-grove-purple :bold t))))
 `(transient-argument ((t (:foreground ,cinder-grove-cyan))))
 `(transient-value ((t (:foreground ,cinder-grove-yellow))))
 `(transient-inactive-argument ((t (:inherit shadow))))
 `(transient-inactive-value ((t (:inherit shadow))))
 `(transient-unreachable ((t (:foreground ,cinder-grove-muted :strike-through t))))
 `(transient-unreachable-key ((t (:foreground ,cinder-grove-muted))))
 `(vundo-default ((t (:foreground ,cinder-grove-fg))))
 `(vundo-highlight ((t (:foreground ,cinder-grove-orange :bold t))))
 `(vundo-stem ((t (:foreground ,cinder-grove-visual))))
 `(vundo-saved ((t (:foreground ,cinder-grove-green))))
 `(vundo-last-saved ((t (:foreground ,cinder-grove-green :bold t))))
 `(treesit-fold-fringe-face ((t (:foreground ,cinder-grove-muted))))
 `(treesit-fold-replacement-face ((t (:foreground ,cinder-grove-yellow))))
 `(macrostep-expansion-highlight-face ((t (:background ,cinder-grove-surface))))
 `(macrostep-macro-face ((t (:foreground ,cinder-grove-orange :bold t))))
 `(macrostep-compiler-macro-face ((t (:foreground ,cinder-grove-orange :bold t))))
 `(macrostep-gensym-1 ((t (:foreground ,cinder-grove-orange))))
 `(macrostep-gensym-2 ((t (:foreground ,cinder-grove-yellow))))
 `(macrostep-gensym-3 ((t (:foreground ,cinder-grove-green))))
 `(macrostep-gensym-4 ((t (:foreground ,cinder-grove-blue))))
 `(macrostep-gensym-5 ((t (:foreground ,cinder-grove-purple))))
 `(wgrep-face ((t (:foreground ,cinder-grove-yellow))))
 `(wgrep-done-face ((t (:foreground ,cinder-grove-green))))
 `(wgrep-delete-face ((t (:foreground ,cinder-grove-red :strike-through t))))
 `(wgrep-file-face ((t (:foreground ,cinder-grove-fg))))
 `(wgrep-reject-face ((t (:foreground ,cinder-grove-red :bold t))))
 `(highlight-quoted-quote ((t (:foreground ,cinder-grove-purple))))
 `(highlight-quoted-symbol ((t (:foreground ,cinder-grove-cyan))))
 `(eros-result-overlay-face ((t (:background ,cinder-grove-container
                                             :foreground ,cinder-grove-green))))
 `(yas-field-highlight-face ((t (:background ,cinder-grove-visual))))
 `(dape-breakpoint-face ((t (:background ,cinder-grove-red
                                         :foreground ,cinder-grove-bright))))
 `(dape-breakpoint-until-face ((t (:background ,cinder-grove-purple
                                               :foreground
                                               ,cinder-grove-bright))))
 `(dape-source-line-face ((t (:background ,cinder-grove-visual
                                          :foreground ,cinder-grove-bright))))
 `(dape-expression-face ((t (:foreground ,cinder-grove-yellow))))
 `(dape-inlay-hint-face ((t (:foreground ,cinder-grove-subtle
                                         :background ,cinder-grove-surface
                                         :italic t))))
 `(dape-repl-error-face ((t (:foreground ,cinder-grove-red))))
 `(dape-log-face ((t (:inherit shadow))))
 `(dape-header-line-active-face ((t (:background ,cinder-grove-orange
                                                 :foreground ,cinder-grove-bg))))
 `(dape-header-line-inactive-face ((t (:background ,cinder-grove-container
                                                   :foreground
                                                   ,cinder-grove-muted))))
 `(dape-hits-face ((t (:foreground ,cinder-grove-green))))

 ;; --- nerd-icons -------------------------------------------------------------------------------
 `(nerd-icons-blue ((t (:foreground ,cinder-grove-blue))))
 `(nerd-icons-blue-alt ((t (:foreground ,cinder-grove-cyan))))
 `(nerd-icons-cyan ((t (:foreground ,cinder-grove-cyan))))
 `(nerd-icons-cyan-alt ((t (:foreground ,cinder-grove-cyan))))
 `(nerd-icons-green ((t (:foreground ,cinder-grove-green))))
 `(nerd-icons-orange ((t (:foreground ,cinder-grove-orange))))
 `(nerd-icons-purple ((t (:foreground ,cinder-grove-purple))))
 `(nerd-icons-purple-alt ((t (:foreground ,cinder-grove-purple))))
 `(nerd-icons-red ((t (:foreground ,cinder-grove-red))))
 `(nerd-icons-red-alt ((t (:foreground ,cinder-grove-red))))
 `(nerd-icons-yellow ((t (:foreground ,cinder-grove-yellow))))
 `(nerd-icons-pink ((t (:foreground ,cinder-grove-purple))))
 `(nerd-icons-maroon ((t (:foreground ,cinder-grove-red))))
 `(nerd-icons-silver ((t (:foreground ,cinder-grove-subtle))))
 `(nerd-icons-dblue ((t (:foreground ,cinder-grove-blue))))
 `(nerd-icons-dcyan ((t (:foreground ,cinder-grove-cyan))))
 `(nerd-icons-dgreen ((t (:foreground ,cinder-grove-green))))
 `(nerd-icons-dorange ((t (:foreground ,cinder-grove-orange))))
 `(nerd-icons-dpurple ((t (:foreground ,cinder-grove-purple))))
 `(nerd-icons-dpink ((t (:foreground ,cinder-grove-purple))))
 `(nerd-icons-dred ((t (:foreground ,cinder-grove-red))))
 `(nerd-icons-dyellow ((t (:foreground ,cinder-grove-yellow))))
 `(nerd-icons-dsilver ((t (:foreground ,cinder-grove-subtle))))
 `(nerd-icons-lblue ((t (:foreground ,cinder-grove-blue))))
 `(nerd-icons-lcyan ((t (:foreground ,cinder-grove-cyan))))
 `(nerd-icons-lgreen ((t (:foreground ,cinder-grove-green))))
 `(nerd-icons-lorange ((t (:foreground ,cinder-grove-orange))))
 `(nerd-icons-lpurple ((t (:foreground ,cinder-grove-purple))))
 `(nerd-icons-lpink ((t (:foreground ,cinder-grove-purple))))
 `(nerd-icons-lred ((t (:foreground ,cinder-grove-red))))
 `(nerd-icons-lyellow ((t (:foreground ,cinder-grove-yellow))))
 `(nerd-icons-lsilver ((t (:foreground ,cinder-grove-bright))))

 ;; --- lsp-mode -----------------------------------------------------------------------------------
 `(lsp-face-highlight-read ((t (:background ,cinder-grove-visual))))
 `(lsp-face-highlight-textual ((t (:background ,cinder-grove-surface))))
 `(lsp-face-highlight-write ((t (:background ,cinder-grove-visual
                                             :box (:color ,cinder-grove-orange)))))
 `(lsp-face-rename ((t (:background ,cinder-grove-surface))))
 `(lsp-ui-doc-background ((t (:background ,cinder-grove-container))))
 `(lsp-inlay-hint-face ((t (:foreground ,cinder-grove-subtle
                                        :background ,cinder-grove-surface
                                        :italic t))))
 `(lsp-inlay-hint-parameter-face ((t (:foreground ,cinder-grove-orange
                                                 :background
                                                 ,cinder-grove-surface
                                                 :italic t))))
 `(lsp-inlay-hint-type-face ((t (:foreground ,cinder-grove-yellow
                                             :background ,cinder-grove-surface
                                             :italic t))))
 `(lsp-lens-face ((t (:inherit shadow))))
 `(lsp-details-face ((t (:inherit shadow :italic t))))
 `(lsp-modeline-code-actions-face ((t (:foreground ,cinder-grove-yellow))))
 `(lsp-signature-face ((t (:foreground ,cinder-grove-secondary :italic t))))
 `(lsp-signature-highlight-function-argument ((t (:foreground
                                                  ,cinder-grove-orange :bold t))))
 `(lsp-signature-posframe ((t (:background ,cinder-grove-container
                                           :foreground ,cinder-grove-fg))))
 `(lsp-headerline-breadcrumb-path-face ((t (:foreground ,cinder-grove-subtle))))
 `(lsp-headerline-breadcrumb-symbols-face ((t (:foreground ,cinder-grove-orange))))
 `(lsp-headerline-breadcrumb-separator-face ((t (:foreground ,cinder-grove-muted))))
 `(lsp-headerline-breadcrumb-project-prefix-face ((t (:foreground
                                                     ,cinder-grove-yellow))))
 `(lsp-headerline-breadcrumb-path-error-face ((t (:foreground ,cinder-grove-red))))
 `(lsp-headerline-breadcrumb-path-warning-face ((t (:foreground
                                                   ,cinder-grove-yellow))))
 `(lsp-headerline-breadcrumb-path-info-face ((t (:foreground ,cinder-grove-blue))))
 `(lsp-headerline-breadcrumb-path-hint-face ((t (:foreground ,cinder-grove-cyan))))
 `(lsp-headerline-breadcrumb-symbols-error-face ((t (:foreground
                                                     ,cinder-grove-red))))
 `(lsp-headerline-breadcrumb-symbols-warning-face ((t (:foreground
                                                      ,cinder-grove-yellow))))
 `(lsp-headerline-breadcrumb-symbols-info-face ((t (:foreground
                                                   ,cinder-grove-blue))))
 `(lsp-headerline-breadcrumb-symbols-hint-face ((t (:foreground
                                                   ,cinder-grove-cyan))))
 `(lsp-headerline-breadcrumb-deprecated-face ((t (:foreground ,cinder-grove-muted
                                                              :strike-through t))))
 `(lsp-face-semhl-keyword ((t (:foreground ,cinder-grove-orange))))
 `(lsp-face-semhl-string ((t (:foreground ,cinder-grove-green))))
 `(lsp-face-semhl-number ((t (:foreground ,cinder-grove-purple))))
 `(lsp-face-semhl-constant ((t (:foreground ,cinder-grove-purple))))
 `(lsp-face-semhl-enum-member ((t (:foreground ,cinder-grove-orange))))
 `(lsp-face-semhl-function ((t (:foreground ,cinder-grove-cyan))))
 `(lsp-face-semhl-method ((t (:foreground ,cinder-grove-cyan))))
 `(lsp-face-semhl-macro ((t (:foreground ,cinder-grove-purple))))
 `(lsp-face-semhl-variable ((t (:foreground ,cinder-grove-fg))))
 `(lsp-face-semhl-parameter ((t (:foreground ,cinder-grove-bright :italic t))))
 `(lsp-face-semhl-property ((t (:foreground ,cinder-grove-secondary))))
 `(lsp-face-semhl-member ((t (:foreground ,cinder-grove-secondary))))
 `(lsp-face-semhl-class ((t (:foreground ,cinder-grove-yellow))))
 `(lsp-face-semhl-struct ((t (:foreground ,cinder-grove-yellow))))
 `(lsp-face-semhl-interface ((t (:foreground ,cinder-grove-yellow))))
 `(lsp-face-semhl-enum ((t (:foreground ,cinder-grove-yellow))))
 `(lsp-face-semhl-event ((t (:foreground ,cinder-grove-yellow))))
 `(lsp-face-semhl-type-parameter ((t (:foreground ,cinder-grove-yellow :italic t))))
 `(lsp-face-semhl-decorator ((t (:foreground ,cinder-grove-orange))))
 `(lsp-face-semhl-namespace ((t (:foreground ,cinder-grove-blue :bold t))))
 `(lsp-face-semhl-label ((t (:foreground ,cinder-grove-purple))))
 `(lsp-face-semhl-operator ((t (:foreground ,cinder-grove-secondary))))
 `(lsp-face-semhl-regexp ((t (:foreground ,cinder-grove-green))))
 `(lsp-face-semhl-default-library ((t (:foreground ,cinder-grove-purple
                                                  :italic t))))
 `(lsp-face-semhl-deprecated ((t (:strike-through t))))

 ;; --- terminals (ANSI palette from terminal_colors upstream) -------------------------------
 `(ansi-color-black ((t (:foreground ,cinder-grove-bg
                        :background ,cinder-grove-bg))))
 `(ansi-color-red ((t (:foreground ,cinder-grove-red
                      :background ,cinder-grove-red))))
 `(ansi-color-green ((t (:foreground ,cinder-grove-green
                        :background ,cinder-grove-green))))
 `(ansi-color-yellow ((t (:foreground ,cinder-grove-yellow
                         :background ,cinder-grove-yellow))))
 `(ansi-color-blue ((t (:foreground ,cinder-grove-blue
                       :background ,cinder-grove-blue))))
 `(ansi-color-magenta ((t (:foreground ,cinder-grove-purple
                          :background ,cinder-grove-purple))))
 `(ansi-color-cyan ((t (:foreground ,cinder-grove-cyan
                       :background ,cinder-grove-cyan))))
 `(ansi-color-white ((t (:foreground ,cinder-grove-secondary
                        :background ,cinder-grove-secondary))))
 `(ansi-color-bright-black ((t (:foreground ,cinder-grove-muted
                               :background ,cinder-grove-muted))))
 `(ansi-color-bright-red ((t (:inherit ansi-color-red))))
 `(ansi-color-bright-green ((t (:inherit ansi-color-green))))
 `(ansi-color-bright-yellow ((t (:inherit ansi-color-yellow))))
 `(ansi-color-bright-blue ((t (:inherit ansi-color-blue))))
 `(ansi-color-bright-magenta ((t (:inherit ansi-color-magenta))))
 `(ansi-color-bright-cyan ((t (:inherit ansi-color-cyan))))
 `(ansi-color-bright-white ((t (:foreground ,cinder-grove-bright
                               :background ,cinder-grove-bright))))
 `(term-color-black ((t (:foreground ,cinder-grove-bg
                                     :background ,cinder-grove-bg))))
 `(term-color-red ((t (:foreground ,cinder-grove-red
                                   :background ,cinder-grove-red))))
 `(term-color-green ((t (:foreground ,cinder-grove-green
                                     :background ,cinder-grove-green))))
 `(term-color-yellow ((t (:foreground ,cinder-grove-yellow
                                      :background ,cinder-grove-yellow))))
 `(term-color-blue ((t (:foreground ,cinder-grove-blue
                                    :background ,cinder-grove-blue))))
 `(term-color-magenta ((t (:foreground ,cinder-grove-purple
                                       :background ,cinder-grove-purple))))
 `(term-color-cyan ((t (:foreground ,cinder-grove-cyan
                                    :background ,cinder-grove-cyan))))
 `(term-color-white ((t (:foreground ,cinder-grove-secondary
                                     :background ,cinder-grove-secondary))))
 `(vterm-color-black ((t (:foreground ,cinder-grove-bg
                                      :background ,cinder-grove-bg))))
 `(vterm-color-red ((t (:foreground ,cinder-grove-red
                                    :background ,cinder-grove-red))))
 `(vterm-color-green ((t (:foreground ,cinder-grove-green
                                      :background ,cinder-grove-green))))
 `(vterm-color-yellow ((t (:foreground ,cinder-grove-yellow
                                       :background ,cinder-grove-yellow))))
 `(vterm-color-blue ((t (:foreground ,cinder-grove-blue
                                     :background ,cinder-grove-blue))))
 `(vterm-color-magenta ((t (:foreground ,cinder-grove-purple
                                        :background ,cinder-grove-purple))))
 `(vterm-color-cyan ((t (:foreground ,cinder-grove-cyan
                                     :background ,cinder-grove-cyan))))
 `(vterm-color-white ((t (:foreground ,cinder-grove-secondary
                                      :background ,cinder-grove-secondary))))
 `(vterm-color-bright-black ((t (:foreground ,cinder-grove-muted
                                             :background ,cinder-grove-muted))))
 `(vterm-color-bright-red ((t (:foreground ,cinder-grove-red
                                           :background ,cinder-grove-red))))
 `(vterm-color-bright-green ((t (:foreground ,cinder-grove-green
                                             :background ,cinder-grove-green))))
 `(vterm-color-bright-yellow ((t (:foreground ,cinder-grove-yellow
                                              :background
                                              ,cinder-grove-yellow))))
 `(vterm-color-bright-blue ((t (:foreground ,cinder-grove-blue
                                            :background ,cinder-grove-blue))))
 `(vterm-color-bright-magenta ((t (:foreground ,cinder-grove-purple
                                               :background
                                               ,cinder-grove-purple))))
 `(vterm-color-bright-cyan ((t (:foreground ,cinder-grove-cyan
                                            :background ,cinder-grove-cyan))))
 `(vterm-color-bright-white ((t (:foreground ,cinder-grove-bright
                                             :background ,cinder-grove-bright)))))

;;;###autoload
(and load-file-name
     (boundp 'custom-theme-load-path)
     (add-to-list 'custom-theme-load-path
                  (file-name-as-directory
                   (file-name-directory load-file-name))))

(provide 'cinder-grove-theme)
(provide-theme 'cinder-grove)
;;; cinder-grove-theme.el ends here
