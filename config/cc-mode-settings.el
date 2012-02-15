(require 'cc-mode)

;; cscope, install cscope and xcscope first
(add-hook 'c-mode-common-hook
	  '(lambda ()
             (require 'xcscope)))