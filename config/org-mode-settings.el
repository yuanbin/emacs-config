;; ref: http://doc.norang.ca/org-mode.html

(require 'org-install)

(require 'ob-plantuml)
(setq org-plantuml-jar-path
      (expand-file-name "~/.emacs.d/plugins/misc/plantuml.jar"))

;; use org-mode for org, org_archive and txt
(add-to-list 'auto-mode-alist '("\\.\\(org\\|org_archive\\|txt\\)$" . org-mode))

;; flyspell mode for spell checking everywhere
(add-hook 'org-mode-hook 'turn-on-flyspell 'append)

;; enable clean view
(setq org-startup-indented t)

;;diary
(setq org-agenda-include-diary t)

;; view today's agenda by default
(setq org-agenda-ndays 1)

;; ===== capture confg =====
 (setq org-default-notes-file (expand-file-name "~/capture.org"))