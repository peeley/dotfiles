;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Noah Snelson"
      user-mail-address "noah.snelson@protonmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "JuliaMono" :size 12 :weight 'regular))
(setq doom-variable-pitch-font (font-spec :family "JuliaMono" :size 12))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-nord)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
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
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; use tab for autocomplete
(map! (:after company
              (:map company-active-map
                    "TAB" #'company-complete-selection
                    [tab] #'company-complete-selection)))

;; set cursor color/shape defaults
(after! evil
  (setq evil-default-cursor '(t "#EBCB8B")
        evil-normal-state-cursor '("#EBCB8B" box)
        evil-insert-state-cursor '("#FFFFFF" bar)
        evil-visual-state-cursor '("#FFFFFF" hbar))
  (evil-ex-define-cmd "W" 'save-buffer))

;; enable language-aware word wrap in most buffers
(+global-word-wrap-mode t)

;; make Org auto-insert a timestamp when a task cycles to DONE
(after! org-mode
  (setq org-log-done 'time)
  (add-hook 'org-mode-hook #'auto-fill-mode))

;; change Git commit summary length
(after! magit
  (setq magit-commit-summary-max-length 72))

;; use `,' as localleader key instead of SPC-m
(setq doom-localleader-key ",")

(after! company
  (setq company-idle-delay 0.1
        company-minimum-prefix-length 1))

(setq lsp-enable-file-watchers nil)

(after! web-mode
  (setq web-mode-enable-current-element-highlight t)
  (setq web-mode-markup-indent-offset 2))

(map! :after smartparens
      :map smartparens-mode-map
      :localleader
      ">" #'sp-forward-slurp-sexp
      "<" #'sp-forward-barf-sexp)

(after! php-cs-fixer
  (setq php-cs-fixer-command "$HOME/.composer/vendor/bin/php-cs-fixer"
        php-cs-fixer-config-option "$HOME/php_cs.dist.php")
  (add-hook! php-mode #'php-cs-fixer-fix))

(after! markdown-mode
  ;; allow .mdx files to use markdown-mode
  (add-hook 'markdown-mode-hook #'auto-fill-mode))

(add-to-list 'auto-mode-alist '("\\.mdx\\'" . markdown-mode))

(setq
 projectile-project-root-functions '(projectile-root-marked
                                     projectile-root-local
                                     projectile-root-top-down
                                     projectile-root-top-down-recurring
                                     projectile-root-bottom-up))

(after! lsp-mode
  (setq lsp-clients-php-server-command "phpactor"))

;; turn off spellcheck for text-mode (and all derived modes)
(after! text-mode
  (remove-hook! 'text-mode-hook #'spell-fu-mode))

;; enable spellchecking in markdown mode
(after! markdown-mode
  (add-hook! 'markdown-mode-hook #'spell-fu-mode))

(use-package! gptel
  :config
  (setq gptel-prompt-prefix-alist '((markdown-mode . "### Prompt: \n")
                                    (org-mode . "*** ")
                                    (text-mode . "### ")))
  (setq gptel-response-prefix-alist '((markdown-mode . "### Response: \n")))
  (map! :leader
        (:prefix ("a" . "ai")
                 "i" #'gptel))
  (map! :nv "S-<return>" #'gptel-menu))

(use-package! aidermacs
  :config
  (map! :leader
        (:prefix ("a" . "ai")
                 "c" #'aidermacs-transient-menu)))
