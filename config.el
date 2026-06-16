;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

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
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)
(setq doom-font (font-spec :family "JetBrains Mono" :size 15))

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `with-eval-after-load' block, otherwise Doom's defaults may override your
;; settings. E.g.
;;
;;   (with-eval-after-load 'PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
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

;; Make vterm behave like a normal window (not popup)
(after! vterm
  (set-popup-rule! "*vterm*" :ignore t))

(setq org-directory "~/org/")
(setq org-roam-directory (file-truename "~/org/roam/"))

(after! org-roam
  (org-roam-db-autosync-mode))

(setq ispell-program-name "aspell")
(setq ispell-extra-args '("--sug-mode=ultra"))

(setq ispell-program-name "/opt/homebrew/bin/aspell")

;; PDF Tools Configuration
(after! pdf-tools
  ;; Enable pdf-tools for PDF files
  (pdf-tools-install-noverify)
  
  ;; Set default PDF viewer settings
  (setq-default pdf-view-display-size 'fit-page)
  (setq pdf-view-use-scaling t)
  (setq pdf-view-use-imagemagick nil)
  
  ;; Key bindings for PDF mode
  (map! :map pdf-view-mode-map
        :n "j" #'pdf-view-next-line-or-next-page
        :n "k" #'pdf-view-previous-line-or-previous-page
        :n "g" #'pdf-view-goto-page
        :n "G" #'pdf-view-last-page
        :n "0" #'pdf-view-first-page
        :n "+" #'pdf-view-enlarge
        :n "-" #'pdf-view-shrink
        :n "=" #'pdf-view-scale-reset
        :n "w" #'pdf-view-fit-width-to-window
        :n "h" #'pdf-view-fit-height-to-window
        :n "p" #'pdf-view-fit-page-to-window
        :n "s" #'pdf-occur))

