;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Evan Stokdyk"
      user-mail-address "evan.stokdyk@gmail.com"
      ;;+doom-dashboard-banner-file "family-photo.jpg"
      )

;; Turn on pixel scrolling
(pixel-scroll-precision-mode t)

;; Turn on abbrev mode
(add-to-list 'default-frame-alist '(width . 144))
(add-to-list 'default-frame-alist '(height . 50))

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
(setq doom-font (font-spec :family "Hack Nerd Font" :size 21 :weight 'semi-light)
      ;;doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13)
      )

;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; see `load-theme' function
(setq doom-theme 'doom-outrun-electric)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/dox/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; (use-package! obsidian
;;   :ensure t
;;   :demand t
;;   :config
;;   (obsidian-specify-path "~/dox/dnd")
;;   ;;(global-obsidian-mode t)
;;   :custom
;;   ;; This directory will be used for `obsidian-capture' if set.
;;   (obsidian-inbox-directory "inbox")
;;   ;; The directory for daily notes (file name is YYYY-MM-DD.md)
;;                                         ;(obsidian-daily-notes-directory "daily")
;;   :bind (:map obsidian-mode-map
;;               ;; Replace C-c C-o with Obsidian.el's implementation. It's ok to use another key binding.
;;               ("C-c C-o" . obsidian-follow-link-at-point)
;;               ;; Jump to backlinks
;;               ("C-c C-b" . obsidian-backlink-jump)
;;               ;; If you prefer you can use `obsidian-insert-link'
;;               ("C-c C-l" . obsidian-insert-wikilink)))

(use-package! org-roam
  :config
  (setq org-roam-directory (file-truename "~/dox")
        org-roam-db-update-on-save t)
  (require 'org-roam-export))

(use-package! websocket
  :after org-roam)

(use-package! org-roam-ui
  :after org-roam ;; or :after org
  ;;         normally we'd recommend hooking orui after org-roam, but since org-roam does not have
  ;;         a hookable mode anymore, you're advised to pick something yourself
  ;;         if you don't care about startup time, use
  ;;  :hook (after-init . org-roam-ui-mode)
  :config
  (setq org-roam-ui-sync-theme t
        org-roam-ui-follow nil
        org-roam-ui-update-on-save t
        org-roam-ui-open-on-start t))
