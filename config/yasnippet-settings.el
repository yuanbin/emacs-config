;; yasnippet
(require 'yasnippet) ;; not yasnippet-bundle
(yas/initialize)
(setq yas/snippet-dirs '("~/.emacs.d/plugins/yasnippet/snippets" "~/.emacs.d/plugins/yasnippet/extras/imported"))
(yas/global-mode 1)
(setq yas/trigger-key (kbd "`")) ; redefine trigger-key, default: TAB
