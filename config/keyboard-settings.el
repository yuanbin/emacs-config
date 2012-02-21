;; shortcut for c-x b
(global-set-key [(f6)] 'switch-to-buffer)

;;keyboard macros

;; split window into 4
(fset 'split4
      (lambda (&optional arg) "Keyboard macro." (interactive "p")
        (kmacro-exec-ring-item (quote ("32\2632" 0 "%d")) arg)))

;; ===== org-mode =====
(define-key global-map [(f7)] 'org-capture)

;; ===== cscope =====
;; overwrite bindings in xcscope.el
(setq cscope:map (make-sparse-keymap))
(define-key cscope:map [(ctrl f3)] 'cscope-find-this-symbol)
(define-key global-map [(ctrl f4)] 'cscope-find-global-definition)
(define-key cscope:map [(ctrl f5)] 'cscope-find-functions-calling-this-function)
(define-key cscope:map [(ctrl f6)] 'cscope-find-called-functions)
(define-key cscope:map [(ctrl f7)] 'cscope-find-this-text-string)
(define-key cscope:map [(ctrl f8)] 'cscope-find-egrep-pattern)
(define-key cscope:map [(ctrl f9)] 'cscope-find-this-file)
(define-key cscope:map [(ctrl f10)] 'cscope-find-files-including-file)
