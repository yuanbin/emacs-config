;; ===== Config that can be set with default emacs installation =====

;;start emacs in server mode
(server-start)

;; no blinking
(blink-cursor-mode -1) 

;; show parenthesis
(show-paren-mode 1)
(setq show-paren-delay 0)

;; disable toolbar
(tool-bar-mode -1)

;; disable scrollbar
(toggle-scroll-bar -1)

;; disable menu bar
;; (menu-bar-mode -1)

;; turn on auto-fill-mode for all major modes
(setq-default default-fill-column 80)
(setq-default auto-fill-function 'do-auto-fill)
;;(setq auto-fill-mode 1)

;; turn of tab character   
(setq-default indent-tabs-mode nil) 

;; Show line-number and column-number in the mode line
(line-number-mode 1)
(column-number-mode 1)

(setq mouse-avoidance-mode 'animate) ;光标靠近鼠标指针时，让鼠标指针自动让开，别挡住视线。
(fset 'yes-or-no-p 'y-or-n-p)    ; 按 y 或空格键表示 yes，n 表示 no
(setq x-select-enable-clipboard t) ; 允许emacs和外部其他程序的粘贴
(auto-image-file-mode t);打开图片显示功能
(setq frame-title-format '("" buffer-file-name "@emacs" ));在标题栏显示buffer名称
(setq default-directory "~/")     ; 设置打开文件的缺省路径
(setq-default kill-whole-line t) ; 在行首 C-k 时，同时删除该行
(setq show-paren-style 'parenthesis) ;括号匹配时可以高亮显示另外一边的括号，但光
                                     ;标不会烦人的跳到另一个括号处。
(setq auto-image-file-mode t) ;让 Emacs 可以直接打开和显示图片
(setq track-eol t)    ; 当光标在行尾上下移动的时候，始终保持在行尾。



;; ===== the following config requires third party plugins ====
;; ===== run the install script to install the plugins ====

;;font
(set-default-font "Inconsolata-18")

;; window-numbering
(require 'window-numbering)
(window-numbering-mode 1)

;; enable autopair in all buffers 
(require 'autopair)
(autopair-global-mode) 

;; linum+
(require 'linum+)
(global-linum-mode 1)
