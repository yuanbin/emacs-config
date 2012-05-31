;; ===== Config that can be set with default emacs installation =====

;; do not load system wide init file
;; ie: /usr/share/emacs/site-lisp/default.el
(setq inhibit-default-init 1)

;;start emacs in server mode
(server-start)
;; use tcp instead of default unix socket
(setq server-use-tcp t)

;; no blinking
(blink-cursor-mode -1) 
(setq-default cursor-type 'bar)
(set-cursor-color "deeppink") 

;; show parenthesis
(show-paren-mode 1)
(setq show-paren-delay 0)

;; disable toolbar
(tool-bar-mode -1)

;; disable scrollbar
(toggle-scroll-bar -1)

;; disable menu bar
;; (menu-bar-mode -1)

;; turn on auto-fill-mode for all major modes
(setq-default default-fill-column 120)
(setq-default auto-fill-function 'do-auto-fill)
;;(setq auto-fill-mode 1)

;; turn of tab character   
(setq-default indent-tabs-mode nil) 

;; Show line-number and column-number in the mode line
(line-number-mode 1)
(column-number-mode 1)

;; enable narrowing
(put 'narrow-to-region 'disabled nil)

(setq mouse-avoidance-mode 'animate) 
(fset 'yes-or-no-p 'y-or-n-p)
(setq x-select-enable-clipboard t) ; enable system clipboard
(setq frame-title-format '("" buffer-file-name "@" server-name))
;; (setq frame-title-format (concat buffer-file-name "@" server-name))
(setq default-directory "~/")
(setq-default kill-whole-line t)
(setq show-paren-style 'parenthesis)
(setq auto-image-file-mode t)
(setq track-eol t)

(require 'ido)
(ido-mode 'both) ;; for buffers and files
(setq ido-case-fold  t) ; be case-insensitive

(require 'uniquify) ; uniquify buffer name
(setq uniquify-buffer-name-style 'forward)

(require 'tramp)
(setq tramp-default-method "ssh")

;; ===== the following config requires third party plugins ====
;; ===== run the install script to install the plugins ====

;; extended c/c++/elisp highlights
(require 'zjl-hl)
(zjl-hl-enable-global-all-modes)

;;font
(set-default-font "Inconsolata-14")

;; window-numbering
(require 'window-numbering)
(window-numbering-mode 1)

;; enable autopair in all buffers 
(require 'autopair)
(autopair-global-mode t) 
;; conflict between autopair and graphviz/slime mode, so disable it for now
(set-default 'autopair-dont-activate #'(lambda () (eq major-mode 'graphviz-dot-mode)))
(add-hook 'sldb-mode-hook #'(lambda () (setq autopair-dont-activate t)))

;; linum+
(require 'linum+)
(global-linum-mode 1)

;; quick jump
(require 'quick-jump)
(quick-jump-default-keybinding)

(require 'hideshow-org)
(add-hook 'c-mode-hook 'hs-org/minor-mode)
(add-hook 'c++-mode-hook 'hs-org/minor-mode)

;; log4j
(autoload 'log4j-mode "log4j-mode" "Major mode for viewing log files." t)
(add-to-list 'auto-mode-alist '("\\.log\\'" . log4j-mode))

;; workgroups
(require 'workgroups)
(workgroups-mode 1)
(setq wg-prefix-key (kbd "C-c w"))
(setq wg-morph-hsteps 35)
(setq wg-morph-vsteps 35)
(wg-load "~/.emacs.d/wg-save/wg-save")