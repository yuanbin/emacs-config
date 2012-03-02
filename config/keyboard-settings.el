;; split window into 4
(fset 'split4
      (lambda (&optional arg) "Keyboard macro." (interactive "p")
        (kmacro-exec-ring-item (quote ("32\2632" 0 "%d")) arg)))


(define-key global-map [(f5)] 'ecb-toggle-ecb-windows)
(global-set-key [(f6)] 'switch-to-buffer) ; shortcut for c-x b
(define-key global-map [(f7)] 'org-capture)
