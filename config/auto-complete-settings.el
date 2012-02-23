(require 'auto-complete-config)
'(add-to-list 'ac-dictionary-directories "~/.emacs.d/plugins/auto-complete/auto-complete-1.3.1/dict/")
;; enable ac-modes in other modes
(setq ac-modes (append '(latex-mode text-mode org-mode) ac-modes))
(ac-config-default)

;; for org-mode, resolve conflict of tab
;; (define-key ac-complete-mode-map "\t" 'ac-expand)
(define-key ac-complete-mode-map [tab] 'ac-expand)     ; <<--- add this line
;; (define-key ac-complete-mode-map "\r" 'ac-complete)
