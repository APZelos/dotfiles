;;; init.el --- Emacs configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(add-to-list 'load-path (concat user-emacs-directory "apz/"))

;; Package manager
(setq package-archives '(("org"       . "http://orgmode.org/elpa/")
                         ("gnu"       . "http://elpa.gnu.org/packages/")
                         ("melpa"     . "https://melpa.org/packages/")))
(package-initialize)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

;; Defaults
(setq-default
	delete-old-versions -1                           ; delete excess backup versions silently
	version-control t                      	        ; use version control
	vc-make-backup-files t                           ; make backups file even when in version controlled dir
	backup-directory-alist `(("." . "~/.emacs.d/backups")) ; which directory to put backups file
	auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list/" t)) ;transform backups file name
  create-lockfiles nil
	ad-redefinition-action 'accept                   ; Silence warnings for redefinition
	ring-bell-function 'ignore 	                    ; silent bell when you make a mistake
	display-time-default-load-average nil            ; Don't display load average
	sentence-end-double-space nil	                  ; sentence SHOULD end with only a point.
	gc-cons-threshold (eval-when-compile (* 1024 1024 100)) ; sets garbace collection limit to 100mb
	read-process-output-max (* 1024 1024)            ; 
	fill-column 80                                   ; Set width for automatic line breaks
	help-window-select t                             ; Focus new help windows when opened
	kill-ring-max 128                                ; Maximum length of kill ring
	load-prefer-newer t                              ; Prefers the newest version of a file
	mark-ring-max 128                                ; Maximum length of mark ring
	scroll-conservatively most-positive-fixnum       ; Always scroll by one line
	select-enable-clipboard t                        ; Merge system's and Emacs' clipboard
	tab-width 2                                      ; Set width for tabs
	indent-tabs-mode nil                             ; Use spaces instead of tabs for indentation
	user-full-name "Zelos - Prapas Alkiviadis"       ; Set the full name of the current user
	user-mail-address "a.p.zelos@gmail.com"          ; Set the email address of the current user
	vc-follow-symlinks t                             ; Always follow the symlinks
	view-read-only t)                                ; Always open read-only buffers in view-mode

;; Enable current line highlight
(global-hl-line-mode)
(show-paren-mode)
;; Enable column number in mode line
(column-number-mode)
;; Enable line numbers
(global-display-line-numbers-mode t)

;; Enabling diminish
(use-package diminish
  :ensure t
  :after use-package)

;; Fixing PATH in unix
(use-package exec-path-from-shell
  :if (memq window-system '(mac ns x))
  :ensure t
  :config
  (exec-path-from-shell-initialize))

;; Fonts
(set-face-attribute 'default nil :font "CaskaydiaCove Nerd Font-10")
(set-face-attribute 'fixed-pitch nil :font "CaskaydiaCove Nerd Font-10")

;; Themes and styling
(use-package modus-themes
  :ensure t
	:init
	(modus-themes-load-themes)
	;; org
	(setq modus-themes-org-blocks 'grayscale)
	(setq modus-themes-headings
				'((1 . rainbow-section)
					(2 . section)
					(3 . bold)
					(t . no-bold)))
	(setq modus-themes-scale-headings t)
	(setq modus-themes-variable-pitch-ui t)
	(setq modus-themes-variable-pitch-headings t)
	:config
	(modus-themes-load-operandi))

(use-package rainbow-delimiters
  :ensure t
	:hook
	(prog-mode . rainbow-delimiters-mode))

;; Keybindings
(use-package apz-keybinding
  :config
  (apz-keybinding-global "<escape>" 'keyboard-escape-quit)
  (apz-keybinding-global "C-SPC" nil)
  (apz-keybinding-global "C-SPC u" 'universal-argument "Universal Argument")
  (apz-keybinding-global "C-SPC f" nil "Find")
  (apz-keybinding-global "C-SPC f b" 'switch-to-buffer "Find Buffer"))

(use-package which-key
  :ensure t
	:init (which-key-mode)
	:diminish which-key-mode
	:config
	(setq which-key-add-column-padding 2)
	(setq which-key-show-prefix 'echo)
	(setq which-key-idle-delay 1.0)
	(setq which-key-idle-secondary-delay 0.05))

(use-package evil
  :ensure t
	:init
	(setq evil-want-integration t
				evil-want-keybinding nil
				evil-want-C-u-scroll t
				evil-want-Y-yank-to-eol t
				evil-normal-state-tag "NORMAL"
				evil-insert-state-tag "INSERT"
				evil-visual-state-tag "VISUAL")
	:config
	(evil-mode 1))

(use-package evil-collection
  :ensure t
	:after evil
	:config
	(evil-collection-init))

;; File and directory managing
(use-package dired
	:hook
	(dired-mode . dired-hide-details-mode)
	:config
	(setq dired-listing-switches "-AGFhlv --group-directories-first --time-style=long-iso")
	(setq dired-dwim-target nil))

(use-package apz-dired
  :config
  (apz-keybinding-global "C-SPC d" 'apz-dired-open-dir "Dired"))

;; Project
(use-package project
  :ensure t
	:config
  (setq project-switch-commands '((?f "Find file" consult-find)
                                  (?s "Search" consult-ripgrep)
                                  (?d "Dired" project-dired)
                                  (?g "Git" magit))))

(use-package apz-project
  :config
	(add-hook 'project-find-functions #'apz-project-try-init-vim 90)
	(add-hook 'project-find-functions #'apz-project-try-init-el 90)
	(add-hook 'project-find-functions #'apz-project-try-package-json 90)
  (apz-keybinding-global "C-SPC f p" 'project-switch-project "Find Project")
  (apz-keybinding-global "C-SPC p" nil "Project")
  (apz-keybinding-global "C-SPC p d" 'project-dired "Project Root Directory"))

;; Minibuffer and completion
(use-package wgrep
  :ensure t)

(use-package selectrum
  :ensure t
  :config
  (selectrum-mode +1))
  
(use-package consult
  :ensure t
  :config
  (setq consult-find-command "fd -H --ignore-file=~/.ignore --no-ignore-vcs ARG OPTS")
  (setq consult-ripgrep-command "rg --ignore-file ~/.ignore --no-ignore-vcs --hidden --null --line-buffered --color=always --max-columns=250 --no-heading --line-number . -e ARG OPTS"))

(use-package apz-consult
  :config
  (setq consult-project-root-function #'apz-project-find-current-root)
  (apz-keybinding-global "C-SPC f f" 'apz-consult-find-file "Find File")
  (apz-keybinding-global "C-SPC f s" 'apz-consult-ripgrep "Search")
  (apz-keybinding-global "C-SPC f l" 'consult-line "Find Line"))

(use-package marginalia
  :ensure t
  :config
  (marginalia-mode))

(use-package embark
  :ensure t
  :bind
  ("C-SPC e a" . embark-act)
  ("C-SPC e e" . embark-export))

(use-package embark-consult
  :ensure t
  :after (embark consult)
  :demand t
  :hook
  (embark-collect-mode . embark-consult-preview-minor-mode))

(use-package orderless
  :ensure t
  :config
  (setq completion-styles '(orderless)))

;; Version control
(use-package magit
  :ensure t)

(apz-keybinding-global "C-SPC g" nil "Git")
(apz-keybinding-global "C-SPC g g" 'magit "Magit")
(apz-keybinding-global "C-SPC g l" 'magit-log "Git Log")

(use-package git-gutter
  :ensure t
  :config
  (global-git-gutter-mode +1))

;; Coding
(use-package js
  :ensure t
  :hook (js-mode . eglot-ensure)
  :config
  (setq js-indent-level 2)
  (apz-keybinding-define-map js-mode-map "C-SPC C-f" 'prettier-prettify "Format (prettier)"))

(apz-keybinding-global "C-SPC j" nil "Javascript")

(use-package flycheck
  :ensure t
	:init
	(global-flycheck-mode)
	:config
  (setq-default flycheck-disabled-checkers (append
																						flycheck-disabled-checkers
																						'(json-jsonlist javascript-jshint javascript-standard)))
  ;; Workaround for eslint slow loading when opening a new buffer.
  ;; https://github.com/flycheck/flycheck/issues/1129#issuecomment-319600923
  (advice-add 'flycheck-eslint-config-exists-p :override (lambda() t)))

(use-package apz-flycheck
  :config
  (add-hook 'flycheck-mode-hook #'apz-flycheck-set-local-eslint-executable))

(use-package company
  :ensure t)

(use-package prettier
  :ensure t)

(use-package eglot
  :ensure t
	:config
	;; Disable hover messages
	(setq eglot-ignored-server-capabilites '(:documentHighlightProvider :hoverProvider :signatureHelpProvider)))

;; Org
(use-package org
  :ensure t
	:hook (org-mode . (lambda ()
                      (setq evil-auto-indent nil)
                      (display-line-numbers-mode 0)
                      (visual-line-mode)))
	:init
	(setq org-directory "~/repos/org"
				org-hide-emphasis-markers t))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(wgrep embark-consult embark marginalia git-gutter selectrum orderless consult dired company lsp-mode eglot prettier format-all flycheck magit evil-collection evil which-key rainbow-delimiters modus-themes exec-path-from-shell diminish use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;;; init.el ends here
