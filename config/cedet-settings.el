;; ref: http://alexott.net/en/writings/emacs-devenv/EmacsCedet.html

(require 'cedet)
(require 'semantic-ia) 

;; ========== semantic ==========
;; (semantic-load-enable-minimum-features)
;; (semantic-load-enable-code-helpers)
;; (semantic-load-enable-guady-code-helpers)
(semantic-load-enable-excessive-code-helpers)
(semantic-load-enable-semantic-debugging-helpers)
(require 'semantic-gcc)
(defun my-semantic-hook ()
  (imenu-add-to-menubar "TAGS"))
(add-hook 'semantic-init-hooks 'my-semantic-hook)

(require 'semanticdb)
(global-semanticdb-minor-mode 1)

;; if you want to enable support for gnu global
(require 'semanticdb-global)
(semanticdb-enable-gnu-global-databases 'c-mode)
(semanticdb-enable-gnu-global-databases 'c++-mode)

;; enable ctags for some languages:
;;  Unix Shell, Perl, Pascal, Tcl, Fortran, Asm
(semantic-load-enable-primary-exuberent-ctags-support)

;;(defun my-c-mode-cedet-hook ()
;; (local-set-key "." 'semantic-complete-self-insert)
;; (local-set-key ">" 'semantic-complete-self-insert))
;;(add-hook 'c-mode-common-hook 'my-c-mode-cedet-hook)

(require 'semantic-c nil 'noerror)

;; autocomplete when idle
;; (setq global-semantic-idle-completions-mode t)

;; ========== EDE ==========
(global-ede-mode t)

;; ========== other ==========
(require 'eassist nil 'noerror)
(global-srecode-minor-mode 1)       ; Enable template insertion menu
