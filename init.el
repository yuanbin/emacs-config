;; This is an alternative init file to ~/.emacs
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
(load "~/.emacs.d/config/misc-settings")
(load "~/.emacs.d/config/color-theme-settings")
(load "~/.emacs.d/config/keyboard-settings")
(load "~/.emacs.d/config/yasnippet-settings")
(load "~/.emacs.d/config/ibus-settings")
(load "~/.emacs.d/config/cc-mode-settings")
(load "~/.emacs.d/config/cedet-settings")
(load "~/.emacs.d/config/org-mode-settings")
