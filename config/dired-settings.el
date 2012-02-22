(setq dired-recursive-deletes t) ; 可以递归的删除目录
(setq dired-recursive-copies t)  ; 可以递归的进行拷贝
(require 'dired-x)               ; 有些特殊的功能
(require 'dired+)
(global-set-key "\C-x\C-j" 'dired-jump) ; 通过 C-x C-j 跳转到当前目录的 Dired

;; disable console output if opened at background
(defadvice dired-run-shell-command (around kid-dired-run-shell-command (command))
  "run a shell command COMMAND .
If the COMMAND ends with `&' then run it in background and *discard* the
output, otherwise simply let the original `dired-run-shell-command' run it."
  (if (string-match "&[[:blank:]]*$" command)
        (let ((proc (start-process "kid-shell" nil shell-file-name
                                   shell-command-switch
                                   (substring command 0 (match-beginning 0)))))
          (set-process-sentinel proc 'shell-command-sentinel))
      ad-do-it))
(ad-activate 'dired-run-shell-command)

;; file association
(setq dired-guess-shell-alist-user
      (list
       (list "\\.chm$"
             "chmsee * &")
       (list "\\.\\(pdf\\|djvu\\|ps\\)$"
             "evince * &" "acroread * &")
       (list "\\.\\(avi\\|mkv\\|rm\\|rmvb\\|mp4\\|wmv\\|flv\\)$" 
             "mplayer-mt -lavdopts threads=2 * &" "gmplayer * &")
       (list "\\.\\(jpeg\\|jpg\\|png\\|gif\\|bmp\\)$"
             "feh * &")
       (list "\\.\\(html\\|htm\\)$"
             "chromium-browser * &")
      )
) ; 设置一些文件的默认打开方式，此功能必须在(require 'dired-x)之后 

