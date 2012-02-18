(require 'cc-mode)

;; cscope, install cscope and xcscope first
(add-hook 'c-mode-common-hook
	  '(lambda ()
             (require 'xcscope)))

(defun my-cc-mode-common-hook()
  (setq tab-width 8 indent-tabs-mode nil)
  (c-set-style "linux"))

(add-hook 'c-mode-common-hook 'my-cc-mode-common-hook)