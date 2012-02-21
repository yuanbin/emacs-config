;; shortcut for c-x b
(global-set-key [(f6)] 'switch-to-buffer)

;;keyboard macros

;; split window into 4
(fset 'split4
      (lambda (&optional arg) "Keyboard macro." (interactive "p")
        (kmacro-exec-ring-item (quote ("32\2632" 0 "%d")) arg)))

;; ===== org-mode =====
(define-key global-map [(f7)] 'org-capture)
