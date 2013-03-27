;; This is an alternative init file to ~/.emacs
;; Please ensure that ~/.emacs does not exist on your system, otherwise, it will
;; be read as the init file by emacs instead of this file 
;;
;; directory structure
;; .emacs.d
;;   |-config (all config files, loaded in .emacs)
;;   |-plugins (all plugins, loaded in separate config files)

;; plugin list
;; 1. color-theme
;;    http://www.nongnu.org/color-theme/
;; 2. window-numbering:
;;    (http://nschum.de/src/emacs/window-numbering-mode/)
;; 3. 

;; To install all directories to the beginning of the ‘load-path’:
(let ((default-directory "~/.emacs.d/plugins/"))
  (setq load-path
        (append
         (let ((load-path (copy-sequence load-path))) ;; Shadow
           (append 
            (copy-sequence (normal-top-level-add-to-load-path '(".")))
            (normal-top-level-add-subdirs-to-load-path)))
         load-path)))

;;load all config files
;;(mapc 'load(directory-files "~/.emacs.d/config" t "\.el$"))

;;load individual config files
(load "~/.emacs.d/config/my-func-settings")
(load "~/.emacs.d/config/color-theme-settings")
(load "~/.emacs.d/config/yasnippet-settings")
;;(load "~/.emacs.d/config/ibus-settings")
(load "~/.emacs.d/config/dired-settings")
(load "~/.emacs.d/config/cc-mode-settings")
(load "~/.emacs.d/config/scheme-mode-settings")
(load "~/.emacs.d/config/slime-settings")
(load "~/.emacs.d/config/perl-mode-settings")
(load "~/.emacs.d/config/cedet-settings")
(load "~/.emacs.d/config/ecb-settings")
(load "~/.emacs.d/config/org-mode-settings")
;(load "~/.emacs.d/config/auctex-settings")
(load "~/.emacs.d/config/auto-complete-settings")
(load "~/.emacs.d/config/doxymacs-settings")

;; put these two config last, will overwrite some previous configs
(load "~/.emacs.d/config/misc-settings")
(load "~/.emacs.d/config/keyboard-settings")
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(ecb-options-version "2.40")
 '(quack-fontify-style (quote emacs))
 '(quack-programs (quote ("mzscheme" "bigloo" "csi" "csi -hygienic" "gosh" "gracket" "gsi" "gsi ~~/syntax-case.scm -" "guile" "kawa" "mit-scheme" "racket" "racket -il typed/racket" "rs" "scheme" "scheme48" "scsh" "sisc" "stklos" "sxi"))))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
